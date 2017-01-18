<%--
  Created by IntelliJ IDEA.
  User: yurijs
  Date: 05.01.2017
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat Control</title>

    <style>
        body {
            background-image: url("pics/background_1.jpg");
        }
        #panel {
            padding: 10px;
            text-align: center;
            background-color: #e5eecc;
            border: solid 1px #c3c3c3;
            display: none;
        }
    </style>

    <%--JavaScript part--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        function goToHomePage() {
            location.replace("./")
        }
        function sayToSam() {
            var outputChat = document.getElementById("output").value;
            var request = document.getElementById("myText").value;
            var requestWithNewLine = document.getElementById("myText").value + "\n";
            outputChat = "You: " + requestWithNewLine + outputChat;
            document.getElementById("output").innerHTML = outputChat;
            $.get("./chatControlServlet",
                    {
                        request : request,
                        location: window.location.hostname
                    },
                    function(data, status){
//                            alert(window.location.hostname);
                        outputChat = data + outputChat;
                        document.getElementById("output").innerHTML = outputChat;
                    });
//            document.getElementById("output").scrollTop = document.getElementById("output").scrollHeight
        }
        $(document).ready(function () {
            $("#help").click(function(){
                $("#panel").slideToggle("slow");
            });
        })

//        TODO: implement below functions
//        function sendRequest(request){
//        }
//        function printAnswerFromSam() {
//        }

    </script>
</head>
<body>
<!--- Title Cell --->
<table cellspacing="1" border="1" cellpadding="1" width="100%">
    <tr>
        <td width="150" height="175" onclick="goToHomePage()" style="text-align: center">
            <img src="pics/home_page.png" alt="home_page" wigth="100" height="120">
        </td>
        <td width="150">
            <div id="help" style="text-align: center">
                <img src="pics/help_icon.png" width="130" >
            </div>
        </td>
        <td>
            <div id="top_title">
                <div style="text-align: center; font-size: 80px">Chat Control Page </div>
            </div>
        </td>
    </tr>
</table>

<div id="panel" style="text-align: justify">
    <h2>
        You can use key words for control diff options, for example (with free order):
    </h2>
    <div>
        <h4>'turn on radio relax' - will start Radio Relax</h4>
        <h4>'turn on radio rocks' - will start Radio Rocks</h4>
        <h4>'turn on radio kissFM' - will start Radio KissFM</h4>
        <h4>'turn off' - close radio</h4>
        <h4>'mute' - mute sound</h4>
        <h4>'unmute' - un mute sound</h4>
        <h4>'volume up' - increase volume</h4>
        <h4>'volume down' - decrease volume</h4>
    </div>
</div>
<br><br>

<h1>Welcome to the chat control.</h1>

<h3>Enter you request to Sam</h3>

<input type="text" id="myText" size="40">
<br>
<button onclick="sayToSam()">Say To Sam</button>
<br><br><br>

<textarea id="output" rows="20" cols="42" readonly></textarea>


</body>
</html>
