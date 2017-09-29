<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
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
        .button {
            height: 160px;
            width: 400px;
            text-align: center;
            text-decoration: none;
            font-size: 70px;
            opacity: 0.7;
            filter: alpha(opacity=70); /* For IE8 and earlier */
            border-radius: 30px;
        }
    </style>
    <title>BedRoom</title>

<%--JavaScript functions--%>
    <script type="text/javascript">
        //Sleep function
        function sleep(ms) {
            ms += new Date().getTime()
            while (new Date() < ms){}
        }

        function goToHomePage() {
            location.replace("./")
        }
        function goToBlinds() {
            location.replace("./blinds")
        }
        function showCurrentAutoSwitchOffState(){
            $.get("./options",
                {
                    optionName: "AutoSwitchOff",
                    isGetFromDB: "true"
                },
                function (data, status) {
                    if (data == "23:00"){
                        $("#aso2300").css("background-color", "yellow");
                        $("#aso0000").css("background-color", "lightgray");
                        $("#aso0100").css("background-color", "lightgray");
                    }if(data == "00:00"){
                        $("#aso0000").css("background-color", "yellow");
                        $("#aso2300").css("background-color", "lightgray");
                        $("#aso0100").css("background-color", "lightgray");
                    }if(data == "01:00"){
                        $("#aso0100").css("background-color", "yellow");
                        $("#aso2300").css("background-color", "lightgray");
                        $("#aso0000").css("background-color", "lightgray");
                    }
                }
            );
        }
        function showCurrentBrightnessState() {
            $.get("./options",
                {
                    optionName: "Brightness",
                    isGetFromDB: "true"
                },
                function (data, status) {
                    if (data == "High") {
                        $("#brightnessHigh").css("background-color", "yellow");
                        $("#brightnessMiddle").css("background-color", "lightgray");
                        $("#brightnessLow").css("background-color", "lightgray");
                    }
                    if (data == "Middle") {
                        $("#brightnessHigh").css("background-color", "lightgray");
                        $("#brightnessMiddle").css("background-color", "yellow");
                        $("#brightnessLow").css("background-color", "lightgray");
                    }
                    if (data == "Low") {
                        $("#brightnessHigh").css("background-color", "lightgray");
                        $("#brightnessMiddle").css("background-color", "lightgray");
                        $("#brightnessLow").css("background-color", "yellow");
                    }
                }
            );
        }


        /**
         * The function receive ledMode string, e.g. "red"
         * @param ledMode
         * @returns return response from ESP, via the servlet.
         */
        function setLedMode (ledMode){
            $.get("./test",
                {
                    ledModeValue: ledMode
                },
                function(data, status){
                    //alert("ESP status: " + status + "\nESP response: " + data + "\nledMode: " + ledMode);
                    if (status == "success" && ledMode == "red"){
                        $("#currentStatus").css("background-color", "#ff8080").html("<h2>Current Mode is RED!!!</h2>");
                    }if (status == "success" && ledMode == "green"){
                        $("#currentStatus").css("background-color", "#80ff80").html("<h2>Current Mode is GREEN!!!</h2>");
                    }if (status == "success" && ledMode == "blue"){
                        $("#currentStatus").css("background-color", "#33adff").html("<h2>Current Mode is BLUE!!!</h2>");
                    }if (status == "success" && ledMode == "white"){
                        $("#currentStatus").css("background-color", "#ffff99").html("<h2>Current Mode is WHITE!!!</h2>");
                    }if (status == "success" && ledMode == "switchoff"){
                        $("#currentStatus").css("background-color", "#999999").html("<h2>Current Mode is SWITCH OFF!!!</h2>");
                    }if (status == "success" && ledMode == "gerland"){
                        $("#currentStatus").css("background-color", "#c266ff").html("<h2>Current Mode is GERLAND!!!</h2>");
                    }if (status == "success" && ledMode == "relax"){
                        $("#currentStatus").css("background-color", "#c266ff").html("<h2>Current Mode is RELAX!!!</h2>");
                    }

                    if (status != "success"){
                        $("#currentStatus").css("background-color", "white").html(data);
                    }
                }
            )
        }
    </script>
<%------- jQuery side-----%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
//          take last state from DB and display in UI
            showCurrentAutoSwitchOffState();
            showCurrentBrightnessState();

            $("#setRedColorModeButton").click(function () {
                $.get("http://192.168.1.104",
                    {
                        color : "red"
                    },
                    function(data, status){
                        alert (data + status)
                    });
                setLedMode("red");
            })
            $("#setGreenColorModeButton").click(function () {
                $.get("http://192.168.1.104",
                    {
                        color : "green"
                    },
                    function(data, status){
                        alert (data + status)
                    });
                setLedMode("green");
            })
            $("#setBlueColorModeButton").click(function () {
                $.get("http://192.168.1.104",
                    {
                        color : "blue"
                    },
                    function(data, status){
                        alert (data + status)
                    });
                setLedMode("blue");
            })
            $("#setWhiteColorModeButton").click(function () {
                $.get("http://192.168.1.104",
                    {
                        color : "white"
                    },
                    function(data, status){
                        alert (data + status)
                    });
                setLedMode("white");
            })
            $("#setSwitchOff").click(function () {
                $.get("http://192.168.1.104",
                    {
                        color : "none"
                    },
                    function(data, status){
                        alert (data + status)
                    });
                setLedMode("switchoff");
            })
            $("#setGerlandModeButton").click(function () {
                setLedMode("gerland");
            })
            $("#setRelaxModeButton").click(function () {
                setLedMode("relax");
            })
            $("#options").click(function(){
                $("#panel").slideToggle("slow");
            });
            $("#aso2300").click(function(){
                $.get("./options",
                    {
                        optionName : "AutoSwitchOff",
                        currentState: "23:00",
                        sourceLocation: "SleepRoom_Led",
                        isWriteToDB: "true"
                    },
                    function(data, status){
                        $("#aso2300").css("background-color", "yellow");
                        $("#aso0000").css("background-color", "lightgray");
                        $("#aso0100").css("background-color", "lightgray");
                    });
            });
            $("#aso0000").click(function(){
                $.get("./options",
                    {
                        optionName : "AutoSwitchOff",
                        currentState: "00:00",
                        sourceLocation: "SleepRoom_Led",
                        isWriteToDB: "true"
                    },
                    function(data, status){
                        $("#aso0000").css("background-color", "yellow");
                        $("#aso2300").css("background-color", "lightgray");
                        $("#aso0100").css("background-color", "lightgray");
                    });
            });
            $("#aso0100").click(function(){
                $.get("./options",
                    {
                        optionName : "AutoSwitchOff",
                        currentState: "01:00",
                        sourceLocation: "SleepRoom_Led",
                        isWriteToDB: "true"
                    },
                    function(data, status){
                        $("#aso0100").css("background-color", "yellow");
                        $("#aso2300").css("background-color", "lightgray");
                        $("#aso0000").css("background-color", "lightgray");
                    });
            });
            $("#brightnessHigh").click(function(){
                $.get("./options",
                    {
                        optionName : "Brightness",
                        currentState: "High",
                        sourceLocation: "SleepRoom_Led",
                        isWriteToDB: "true"
                    },
                    function(data, status){
                        $("#brightnessHigh").css("background-color", "yellow");
                        $("#brightnessMiddle").css("background-color", "lightgray");
                        $("#brightnessLow").css("background-color", "lightgray");
                    });
            });
            $("#brightnessMiddle").click(function(){
                $.get("./options",
                    {
                        optionName : "Brightness",
                        currentState: "Middle",
                        sourceLocation: "SleepRoom_Led",
                        isWriteToDB: "true"
                    },
                    function(data, status){
                        $("#brightnessHigh").css("background-color", "lightgray");
                        $("#brightnessMiddle").css("background-color", "yellow");
                        $("#brightnessLow").css("background-color", "lightgray");
                    });
            });
            $("#brightnessLow").click(function(){
                $.get("./options",
                    {
                        optionName : "Brightness",
                        currentState: "Low",
                        sourceLocation: "SleepRoom_Led",
                        isWriteToDB: "true"
                    },
                    function(data, status){
                        $("#brightnessHigh").css("background-color", "lightgray");
                        $("#brightnessMiddle").css("background-color", "lightgray");
                        $("#brightnessLow").css("background-color", "yellow");
                    });
            });
            $("#testESPButtonON").click(function () {
                $.get("http://192.168.1.104/?val=100",
                    {
                    },
                    function(data, status){
                    alert (data + status)
                    });
            })
            $("#testESPButtonOFF").click(function(){
                $.get("http://192.168.1.104",
                    {
                        val : "0"
                    },
                    function(data, status){
                    });
                sleep(400);
            });
        })
    </script>
</head>
<body>
<!--- Title Cell --->
<table cellspacing="1" border="1" cellpadding="1" width="100%">
    <tr>
        <td onclick="goToHomePage()" width="150"  height="175" style="text-align: center">
            <img src="pics/home_page.png" alt="home_page" wigth="100" height="120">
        </td>
        <td width="150">
            <div id="options" style="text-align: center">
                <img src="pics/optionsButton.png" width="100" >
            </div>
        </td>
        <td style="text-align: center" width="150" onclick="goToBlinds()">
            <div id="blinds">
                <img src="pics/blinds_pic.jpg" alt="blinds_page" wigth="100" height="120">
            </div>
        </td>
        <td style="width: auto">
            <div id="top_title">
                <div style="text-align: center; font-size: 80px">Led control Page</div>
            </div>
        </td>
    </tr>
</table>

<%--Options pannel--%>
<div id="panel">
    <table>
        <tr>
            <td width="200">
                <h1>Brightness:</h1>
            </td>
            <td id="brightnessHigh" width="150" height="150" style="background-color: lightgray">
                   <h1>High</h1>
            </td>
            <td id="brightnessMiddle" width="150" style="background-color: lightgray">
                <h1>Middle</h1>
            </td>
            <td id="brightnessLow" width="150" style="background-color: lightgray">
                <h1>Low</h1>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td width="200">
                    <h1>Auto-SwitchOff:</h1>
            </td>
            <td id="aso2300" width="150" height="150" style="background-color: lightgray">
                <h1>23:00</h1>
            </td>
            <td id="aso0000" width="150" style="background-color: lightgray">
                <h1>00:00</h1>
            </td>
            <td id="aso0100" width="150" style="background-color: lightgray">
                <h1>01:00</h1>
            </td>
        </tr>
    </table>

</div>

<br><br>

<!--Status Cell -->
<table cellspacing="1" border="1" cellpadding="" width="100%">
    <tr>
        <td width="150" style="text-align: center; font-size: 50px;color: #2f4f4f">
            <div>Current Status:</div>
        </td>
        <td id="currentStatus" >
        </td>
    </tr>
</table>
<br><br>

<!--Control Panel -->
<table cellspacing="1" border="1" cellpadding="" width="100%">
    <tr>
        <td width="50%">
            <center><p> <font size="7" color="#2f4f4f">Common Controls:</font></p></center>
        </td>
        <td width="50%">
            <center><p> <font size="7" color="#2f4f4f">Special Modes:</font></p></center>
        </td>
    </tr>
    <tr>
        <td width="50%">

            <br><div style="text-align: center" id="setRedColorModeButton">
                <button class="button" style="background-color: red;">Red</button>
            </div><br>
            <br><div style="text-align: center" id="setGreenColorModeButton">
                    <button class="button" style="background-color: green;">Green</button>
            </div><br>
            <br><div style="text-align: center" id="setBlueColorModeButton">
                    <button class="button" style="background-color: blue;">Blue</button>
            </div><br>
            <br><div style="text-align: center;" id="setWhiteColorModeButton">
                    <button class="button" style="background-color: yellow;">White</button>
            </div><br>
        </td>
        <td width="50%" valign="top">
            <br><div style="text-align: center" id="setGerlandModeButton">
                    <button class="button" style="background-color: darkviolet;">Gerland</button>
            </div><br>
            <br><div style="text-align: center" id="setRelaxModeButton">
                    <button class="button" style="background-color: darkviolet;">Relax</button>
            </div><br>
            <br><div style="text-align: center" id="testESPButtonON">
            <button class="button" style="background-color: darkviolet;">ESP_Light_ON</button>
            </div><br>
            <br><div style="text-align: center" id="testESPButtonOFF">
            <button class="button" style="background-color: darkviolet;">ESP_ Light_OFF</button>
        </div><br>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br><div style="text-align: center;" id="setSwitchOff" >
                    <button class="button" style="background-color: darkgray;">Switch Off</button>
            </div><br>
        </td>
    </tr>
</table>
<br>
</body>
</html>