package factory;

import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by yurijs on 06.01.2017.
 */
public class Logger {
    public void writeToLog(String logText){

        //Define Date Format to String value
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String currentDate = df.format(today);

        try
        {
            String filename= ".\\LOG\\smartHome.log";
            FileWriter fw = new FileWriter(filename,true); //the true will append the new data
            fw.write(currentDate + " - " + logText + "\n");//appends the string to the file
            fw.close();
        }
        catch(IOException ioe)
        {
            System.err.println("IOException: " + ioe.getMessage());
        }
    }
}
