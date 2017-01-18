package servlets;

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
 * Created by yurijs on 12.12.2016.
 */
public class TemperatureStatistics extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter pw = resp.getWriter();
        pw.println("<H1>Temperature statistics:</H1>");

        //read get params from request:
        String temperature = req.getParameter("currentTemperature");
        Boolean isWriteToDBTmp  = Boolean.valueOf(req.getParameter("isWriteToDB"));
        Boolean isDisplayTemperatureTmp = Boolean.valueOf(req.getParameter("isDisplayTemperature"));
        boolean isWriteToDB = isWriteToDBTmp.booleanValue();
        boolean isDisplayTemperature = isDisplayTemperatureTmp.booleanValue();
        pw.println("DEBUG: " + "Temperature:" + temperature + " IsWriteToDB:" + isWriteToDB);

        //Define Date Format to String value
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String currentDate = df.format(today);

        //write to DB results
        if (isWriteToDB){
            SQLiteConnection sqLiteConnection = new SQLiteConnection(".\\DB\\test.db");
            try {
                String statement = "insert into Temperature ('Date', 'Temperature') values ('" + currentDate + "', '" + temperature + "');";
                sqLiteConnection.executeStatement(statement);
            }catch (Exception e){
                e.getMessage();
            }finally {
                closeConnection(sqLiteConnection);
            }
        }
        //Show result of temperature to Web Page:
        if (isDisplayTemperature){
            SQLiteConnection sqLiteConnection = new SQLiteConnection(".\\DB\\test.db");
            try{
                String stringHtmlResult =
                        "<table  style=\"width: 379px; height: 50px;\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">" +
                                "<tbody><tr><th style=\"background-color: grey;\">Date:</th>" +
                                "<th style=\"background-color: grey;\">Temperature:</th></tr>";
                ResultSet resultSet = sqLiteConnection.getResultSet("select * from Temperature order by Date desc limit 10;");
                while (resultSet.next()){
                    stringHtmlResult +="<tr><td style=\"text-align: center;\">" + resultSet.getString("Date") + "</td>" +
                            "<td style=\"text-align: center;\">" + resultSet.getString("Temperature") + "</td></tr>";
                }
                stringHtmlResult += "</tbody></table>";
                pw.println(stringHtmlResult);
            }catch (Exception e){
                e.getMessage();
            }finally {
                closeConnection(sqLiteConnection);
            }
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
