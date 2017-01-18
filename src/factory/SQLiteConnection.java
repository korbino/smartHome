package factory;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by yurijs on 09.12.2016.
 */
public class SQLiteConnection {
    private Connection connection = null;
    private Statement statement = null;
    private Logger logger = new Logger();
    //Define Date Format to String value
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    java.util.Date today = Calendar.getInstance().getTime();
    String currentDate = df.format(today);

    //constructor:
    public SQLiteConnection(String dbLocation){
        initConnection(dbLocation);
    }

    /**Just execute statement for the DB;
     *
     * @param sqlQuery Receive SQL statement
     * @throws SQLException
     */
    public void executeStatement (String sqlQuery) throws SQLException {
        statement = connection.createStatement();
        statement.execute(sqlQuery);
        statement.close();
    }

    /**Receive SQL statement and return result in ResultSet format.
     *
     * @param sqlQuery Receive SQL statement
     * @return
     * @throws SQLException
     */
    public ResultSet getResultSet (String sqlQuery) throws SQLException {
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sqlQuery);
        return resultSet;
    }

    /**for debug purpose - print Audit table content
     *
     * @throws SQLException
     */
    public void printAuditTable () throws SQLException {
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery( "SELECT * FROM Audit;" );
        while (resultSet.next()) {
            System.out.println("\t ID: " + resultSet.getInt("ID")
                    + "\t NAME: " + resultSet.getString("Date")
                    + "\t Description: " + resultSet.getString("Description"));
        }
        resultSet.close();
    }

    public void closeConnection() throws SQLException {
        connection.close();
        logger.writeToLog("[SQLiteConnection] - Connection closed.");

    }

    private void initConnection(String dbLocation){
        try{
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:"+dbLocation);
            logger.writeToLog("[SQLConnection] - Opened database successfully.");
        }catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
    }
}
