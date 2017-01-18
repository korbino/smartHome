<%--
  Created by IntelliJ IDEA.
  User: yurijs
  Date: 03.01.2017
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Media Control Page</title>
    <style>
        body {
            background-image: url("pics/background_1.jpg");
        }
        .button {
            height: 130px;
            width: 600px;
            text-align: center;
            text-decoration: none;
            font-size: 40px;
            opacity: 0.7;
            filter: alpha(opacity=70); /* For IE8 and earlier */
            border-radius: 30px;
        }
        .blue{
            background-color: dodgerblue;
        }
        .red{
            background-color: lightcoral;
        }
        .green{
            background-color: greenyellow;
        }
        .positionCenter{
            text-align: center;
        }
    </style>

    <%--JQery section:--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#turnOnRadioRelax").click(function(){
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "turnOnRadioRelax"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            });
            $("#turnOnRadioRocks").click(function(){
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "turnOnRadioRocks"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            });
            $("#turnOnRadioKissFM").click(function(){
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "turnOnRadioKissFM"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            });
            $("#turnOffRadio").click(function () {
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "turnOffRadio"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            })
            $("#volIncrease").click(function () {
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "volIncrease"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            })
            $("#volDecrease").click(function () {
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "volDecrease"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            })
            $("#mute").click(function () {
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "mute"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            })
            $("#unmute").click(function () {
                $.get("./mediaControlServlet",
                        {
                            executeWinCommand : "unmute"
                        },
                        function(data, status){
//                            alert("Status: " + status);
                        });
            })
        })
    </script>

    <%--JAVASCRIPT section:--%>
    <script>
        function goToHomePage() {
            location.replace("./")
        }
    </script>
</head>
<body>

<!--- Title Cell --->
<table cellspacing="1" border="1" cellpadding="1" width="100%">
    <tr>
        <td width="150" height="175" style="text-align: center" onclick="goToHomePage()">
            <img src="pics/home_page.png" alt="home_page" wigth="100" height="120">
        </td>
        <td width="150">
            <div id="options" style="text-align: center">
                <img src="pics/optionsButton.png" width="100" >
            </div>
        </td>
        <td>
            <div id="top_title">
                <div style="text-align: center; font-size: 80px">Media Control Page </div>
            </div>
        </td>
    </tr>
</table>
<br><br>

<%--Media Control elements:--%>

<table cellspacing="1" border="1" cellpadding="" width="100%">
    <tr>
        <div style="text-align: center; font-size: 40px;">
            Sound Controls:
        </div>
    </tr>
    <tr>
        <div id="volDecrease" class="positionCenter">
            <button class="button blue"> Vol -</button>
        </div>
        <br>
        <div id="volIncrease" class="positionCenter">
            <button class="button blue"> Vol +</button>
        </div>
        <br>
        <div id="mute" class="positionCenter">
            <button class="button red"> Mute</button>
        </div>
        <br>
        <div id="unmute" class="positionCenter">
            <button class="button green"> Unmute</button>
        </div>
        <br>
    </tr>
</table>
<br>
<table cellspacing="1" border="1" cellpadding="" width="100%">
    <tr>
        <div style="text-align: center; font-size: 40px;">
            Radio Stations:
        </div>
    </tr>
    <tr>
        <div id="turnOffRadio" class="positionCenter">
            <button class="button red">TurnOff the Radio</button>
        </div>
        <br>
        <div id="turnOnRadioRelax" class="positionCenter">
            <button class="button green">Radio RelaxFM</button>
        </div>
        <br>
        <div id="turnOnRadioRocks" class="positionCenter">
            <button class="button green">Radio Rocks</button>
        </div>
        <br>
        <div id="turnOnRadioKissFM" class="positionCenter">
            <button class="button green">Radio KissFM</button>
        </div>
    </tr>
</table>

</body>
</html>
