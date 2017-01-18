package servlets; /**
 * Created by yurijs on 09.12.2016.
 */
import factory.SQLiteConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet  {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

        String ledModeValue = req.getParameter("ledModeValue");

        //for testing LED mode response untill i'll have real ESP module:
        if (ledModeValue != null || ledModeValue.length() != 0) {
            pw.write("This is test response from TEST servlet, while i don't have ESP module :)");
        }

    }
}
