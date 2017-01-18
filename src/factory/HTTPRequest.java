package factory;

import model.HTTPResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * This class should receive the full URL with get requests
 * One public method getResponse
 */
public class HTTPRequest {
    private String url = null;
    private HTTPResponse HTTPResponse = new HTTPResponse();

    public HTTPRequest(String url){
        this.url = url;
    }

    public HTTPResponse getGetResponse() throws IOException {

        URL obj = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) obj.openConnection();

        // optional default is GET
        connection.setRequestMethod("GET");

        HTTPResponse.responseCode = connection.getResponseCode();

        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        HTTPResponse.responseBody = response.toString();

        return HTTPResponse;
    }
}
