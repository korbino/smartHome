package servlets;

import factory.AnalyzeInputRequest;
import factory.HTTPRequest;
import factory.TestFactory;
import model.KeyWords;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import static java.awt.Color.blue;

/**
 * Created by yurijs on 05.01.2017.
 */
public class ChatControlServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

        String request = req.getParameter("request");
        String location = req.getParameter("location");

        //Return results from Sam:
        pw.write(new AnalyzeInputRequest(request, location).getAnalyzedResponseFromSam());

        //testing static instance of test model
//        TestFactory testFactory = TestFactory.getTestFactoryInstance();
//        testFactory.isToDoTestIncrement(request);
    }
}
