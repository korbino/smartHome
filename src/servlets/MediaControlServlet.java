package servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by yurijs on 03.01.2017.
 */
public class MediaControlServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

        String executeWinCommand = req.getParameter("executeWinCommand");

        //control for system media:
        if (executeWinCommand.equals("turnOnRadioRelax")){
            Runtime.getRuntime().exec("C:\\webControls\\batch\\runRelxFM.bat");
        }
        if (executeWinCommand.equals("turnOnRadioRocks")){
            Runtime.getRuntime().exec("C:\\webControls\\batch\\radiorocks.bat");
        }
        if (executeWinCommand.equals("turnOnRadioKissFM")){
            Runtime.getRuntime().exec("C:\\webControls\\batch\\kissfm.bat");
        }
        if(executeWinCommand.equals("turnOffRadio")){
          Runtime.getRuntime().exec("taskkill /IM winamp.exe");
        }
        if(executeWinCommand.equals("volIncrease")){
            Runtime.getRuntime().exec("C:\\webControls\\nircmd\\nircmd.exe changesysvolume 5000");
        }
        if(executeWinCommand.equals("volDecrease")){
            Runtime.getRuntime().exec("C:\\webControls\\nircmd\\nircmd.exe changesysvolume -5000");
        }
        if(executeWinCommand.equals("mute")){
            Runtime.getRuntime().exec("C:\\webControls\\nircmd\\nircmd.exe mutesysvolume 1");
        }
        if(executeWinCommand.equals("unmute")){
            Runtime.getRuntime().exec("C:\\webControls\\nircmd\\nircmd.exe mutesysvolume 0");
        }


    }

}
