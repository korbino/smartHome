package servlets;

import factory.Logger;
import factory.SQLiteConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by yurijs on 21.12.2016.
 */
public class Options extends HttpServlet {
    private Logger logger = new Logger();
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

        //read get params from request:
        String optionName = req.getParameter("optionName");
        String currentState = req.getParameter("currentState");
        String sourceLocation = req.getParameter("sourceLocation");
        String isWriteToDB = req.getParameter("isWriteToDB");
        String isGetFromDB = req.getParameter("isGetFromDB");

        //Define Date Format to String value
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String currentDate = df.format(today);

        //return responseBody to JSP:
        try{
            if(isGetFromDB.equals("true")){
                SQLiteConnection sqLiteConnection = new SQLiteConnection(".\\DB\\test.db");
                pw.write(getCurrentOption(optionName, sqLiteConnection));
                closeConnection(sqLiteConnection);
            }
        }catch (Exception e){
//            System.out.println("isGetFromDB is NULL");;
        }

        //init write to DB process:
        try{
            if(isWriteToDB.equals("true")){
                writeOptionToDB(optionName, currentState,currentDate, sourceLocation);
                pw.write("The option -="+optionName+"=- was written to DB. \nWith currentstate: -="+currentState+"=-");
            }
        }catch (Exception e){
//            System.out.println("isWriteToDB = NULL");
        }
    }

    //TODO:
    public String getCurrentOption (String optionName, SQLiteConnection sqLiteConnection) throws SQLException {
        String result=null;
        ResultSet resultSet = sqLiteConnection.getResultSet("select * from Options where Option_Name like '%"+optionName+"%' order by Update_Date desc limit 1;");
        result = resultSet.getString("Current_State");
        return result;
    }

    //TODO:
    public void writeOptionToDB(String optionName, String currentState, String currentDate, String sourceLocation){
        SQLiteConnection sqLiteConnection = new SQLiteConnection(".\\DB\\test.db");
        logger.writeToLog("[Options] - Write to DB option:<"+optionName+">, with current state:<"+currentState+">, from source location:<"+sourceLocation+">.");
        try{
            String statement = "insert into Options('Option_Name', 'Current_State', 'Update_Date', 'Source_Location')" +
                    "values ('"+ optionName +"', '"+currentState+"', '"+currentDate+"', '"+sourceLocation+"');";
            sqLiteConnection.executeStatement(statement);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeConnection(sqLiteConnection);
        }
    }

    private void closeConnection (SQLiteConnection connection){
        try {
            connection.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
