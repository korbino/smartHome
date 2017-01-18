package factory;

import model.KeyWords;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Yura on 05.01.2017.
 * This class should receive to constructor the String request.
 * It will parse it for key words and execute needed command according to key words.
 *
 * There is one public methos "getAnalyzedResponseFromSam" - it will return the String.
 */
public class AnalyzeInputRequest {
    private String inputRequest = null;
    private String location = null;
    private String url = null;
    private Logger logger = new Logger();
    public AnalyzeInputRequest(String inputRequest, String location){
        this.inputRequest = inputRequest;
        this.location = location;
    }


    /**
     * Getting back the response from Sam :)
     * @return String
     * @throws IOException
     */
    public String getAnalyzedResponseFromSam() throws IOException {
        setURL();
        return analyseKeyWordsForLogicActions(inputRequest);
    }

    private void setURL(){
        if(location.equalsIgnoreCase("localhost")) location +=":8080";
        if(location.equalsIgnoreCase("yurij.ddns.net")) location +="/smartHome";
        if(location.equalsIgnoreCase("yurijshinkaruk.ddns.net")) location +="/smartHome";
        if(location.equalsIgnoreCase("yurko.ddns.net")) location +="/smartHome";

        url = "http://" + location + "/mediaControlServlet?executeWinCommand=";
    }

    //Main logic implementation:
    private String analyseKeyWordsForLogicActions(String inputRequest) throws IOException {
        List<String> list = Arrays.asList(inputRequest.split(" "));
        KeyWords kw = analyseRequestForKeywords(list);
        //radio
        if(kw.turn){
            if(kw.on){
                if(kw.radio){
                    if(kw.relax){
                        return turnOnRadioRelax();
                    }
                    if(kw.rocks){
                        return turnOnRadioRocks();
                    }
                    if(kw.kissFM){
                        return turnOnRadioKissFM();
                    }
                }
            }
            if(kw.off){
                return turnOffRadio();
            }
        }
        //mute
        if(kw.mute){
            return mute();
        }
        //un mute
        if(kw.unmute){
            return unMute();
        }
        //volume
        if(kw.volume){
            if(kw.up){
                return volumeUp();
            }
            if(kw.down){
                return volumeDown();
            }
        }

        logger.writeToLog("[AnalyseInputRequest] - Sam: sorry - I didn't understood your request, please try again :)");
        return "\nSam: sorry - I didn't understand your request, please try again :) \n\n";
//        return "";
    }


    //private functions:
    private KeyWords analyseRequestForKeywords(List<String> list){
        KeyWords kw = new KeyWords();

        for(String s:list){
            if(s.equalsIgnoreCase("turn")) kw.turn = true;
            if(s.equalsIgnoreCase("on")) kw.on = true;
            if(s.equalsIgnoreCase("off")) kw.off = true;
            if(s.equalsIgnoreCase("radio")) kw.radio = true;
            if(s.equalsIgnoreCase("relax")) kw.relax = true;
            if(s.equalsIgnoreCase("kissFM")) kw.kissFM = true;
            if(s.equalsIgnoreCase("rocks")) kw.rocks = true;
            if(s.equalsIgnoreCase("mute")) kw.mute = true;
            if(s.equalsIgnoreCase("unmute")) kw.unmute = true;
            if(s.equalsIgnoreCase("volume")) kw.volume = true;
            if(s.equalsIgnoreCase("up")) kw.up = true;
            if(s.equalsIgnoreCase("down")) kw.down = true;
        }

        return kw;
    }

    private String turnOnRadioRelax() throws IOException {
        String result = null;
        url += "turnOnRadioRelax";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Radio Relax was turned ON. Wish you a pleasure listening...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Radio Relax was turned ON. Wish you a pleasure listening... with URL: " + url);
        }
        return result;
    }

    private String turnOnRadioRocks() throws IOException {
        String result = null;
        url += "turnOnRadioRocks";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Radio Rocks was turned ON. Wish you a pleasure listening...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Radio Rocks was turned ON. Wish you a pleasure listening... with URL: " + url);
        }
        return result;
    }

    private String turnOnRadioKissFM() throws IOException {
        String result = null;
        url += "turnOnRadioKissFM";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Radio Relax was turned ON. Wish you a pleasure listening...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Radio Relax was turned ON. Wish you a pleasure listening... with URL: " + url);
        }
        return result;
    }

    private String turnOffRadio() throws IOException {
        String result = null;
        url += "turnOffRadio";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Radio was stopped...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Radio was stopped... with URL: " + url);
        }
        return result;
    }

    private String mute () throws IOException {
        String result = null;
        url += "mute";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Radio was muted...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Radio was muted... with URL: " + url);
        }
        return result;
    }

    private String unMute () throws IOException {
        String result = null;
        url += "unmute";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Radio was un muted...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Radio was un muted... with URL: " + url);
        }
        return result;
    }

    private String volumeUp () throws IOException {
        String result = null;
        url += "volIncrease";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Volume was upped...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Volume was upped... with URL: " + url);
        }
        return result;
    }

    private String volumeDown () throws IOException {
        String result = null;
        url += "volDecrease";
        HTTPRequest httpRequest = new HTTPRequest(url);
        int httpResponseStatus = httpRequest.getGetResponse().responseCode;
        if(httpResponseStatus == 200){
            result = "\nSam: Volume was downed...\n\n";
            logger.writeToLog("[AnalyseInputRequest] - Sam: Volume was downed... with URL: " + url);
        }
        return result;
    }

}
