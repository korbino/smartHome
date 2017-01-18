package servlets;

import factory.HTTPRequest;
import model.HTTPResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by yurijs on 27.12.2016.
 */
public class Led extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

        //read get params from request:
        String ledModeValue = req.getParameter("ledModeValue");
        String host = req.getParameter("host");


        //Define Date Format to String value
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String currentDate = df.format(today);

        //TODO: Set LED mode
        //send request to ESP with ledModeValue
        //receive responseBody from ESP
        //send responseBody to JSP (front end)
        if (ledModeValue != null || ledModeValue.length() != 0){
            // TODO: 27.12.2016 Need to create URL for the HTTPRequest for ESP module:
            String url = "http://localhost:8080/test?ledModeValue=" + ledModeValue;
            HTTPResponse newGETResponse;

            // TODO: 27.12.2016 here should be HTTPRequest to the ESP and return the results:
            HTTPRequest newGETRequest = new HTTPRequest(url);
            newGETResponse = newGETRequest.getGetResponse();

            //check response from ESP:
            if (newGETResponse.responseCode == 200){
//                pw.write("ESP:200");
                pw.write("Currently no ESP module, so this is just notification about it.");
            }else{
                pw.write("ESP_ResponseCode: " + newGETResponse.responseCode + " \r\n ESP_ResponseBody: " + newGETResponse.responseBody);
            }

        }

    }
}
