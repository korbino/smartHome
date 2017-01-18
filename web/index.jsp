<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <style>
      body {
        background-image: url("pics/background_1.jpg");
      }
      .button {
          height: 130px;
          width: 600px;
          text-align: center;
          text-decoration: none;
          font-size: 60px;
          opacity: 0.8;
          filter: alpha(opacity=80); /* For IE8 and earlier */
          border-radius: 30px;
      }
      .blue{
            background-color: dodgerblue;
        }
      .red{
            background-color: lightcoral;
        }
        .yellow{
            background-color: yellow;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
      <script>
          function goToSleepRoom(){
              location.replace("./balcony")
          }
          function goToMediaControlPage(){
              location.replace("./mediaControlPage")
          }
          function goToChatControlPage(){
              location.replace("./chatControlPage")
          }
      </script>
    <title>SmartHome</title>
  </head>
  <body>
  <h1 style="text-align: center; font-size: 60px">Welcome to Smart Home page!</h1>
  <table style=" margin-left: auto; margin-right: auto;">
    <body>
    <tr>
      <td style="text-align: center">
          <div onclick="goToSleepRoom()">
              <button class="button blue">BedRoom</button>
          </div>
      </td>
    </tr>
    <tr>
        <td style="text-align: center;">
            <div onclick="goToMediaControlPage()">
                <button class="button red" id="MediaControlButton">Media Control</button>
            </div>
        </td>
    </tr>
    <tr>
        <td style="text-align: center;">
            <div onclick="goToChatControlPage()">
                <button class="button yellow" id="ChatControlButton">Chat Control</button>
            </div>
        </td>
    </tr>
    </body>

  </table>
  </body>
</html>
