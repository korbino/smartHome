<%--
  Created by IntelliJ IDEA.
  User: yurijs
  Date: 11.01.2017
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Blinds Page</title>
    <style>
        body {
            background-image: url("pics/background_1.jpg");
        }
    </style>

    <%--JavaScript:--%>
    <script>
        function goToHomePage() {
            location.replace("./")
        }
        function goToLedControlPage() {
            location.replace("./balcony")
        }
    </script>


    <%--Slider implementation, took from here:   https://webgyry.info/jquery-ui-slider   --%>
    <%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
    <%--<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>--%>
    <%--<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>--%>
    <%--<script type="text/javascript">--%>
        <%--$(document).ready(function(){--%>
            <%--$( "#slider" ).slider({--%>
                <%--value : 0,//Значение, которое будет выставлено слайдеру при загрузке--%>
                <%--min : 0,//Минимально возможное значение на ползунке--%>
                <%--max : 100,//Максимально возможное значение на ползунке--%>
                <%--step : 1,//Шаг, с которым будет двигаться ползунок--%>
                <%--create: function( event, ui ) {--%>
                    <%--val = $( "#slider" ).slider("value");//При создании слайдера, получаем его значение в перемен. val--%>
                    <%--$( "#contentSlider" ).html( val );//Заполняем этим значением элемент с id contentSlider--%>
                <%--},--%>
                <%--slide: function( event, ui ) {--%>
                    <%--$( "#contentSlider" ).html( ui.value );//При изменении значения ползунка заполняем элемент с id contentSlider--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>
</head>
<body>

<!--- Title Cell --->
<table cellspacing="1" border="1" cellpadding="1" width="100%">
    <tr>
        <td width="150"  height="175" style="text-align: center" onclick="goToHomePage()">
            <img src="pics/home_page.png" alt="home_page" wigth="100" height="120">
        </td>
        <td width="150">
            <div id="options" style="text-align: center">
                <img src="pics/optionsButton.png" width="100" >
            </div>
        </td>
        <td style="text-align: center" width="150" onclick="goToLedControlPage()">
            <div id="ledControl">
                <img src="pics/LedControl_page_button.png" alt="ledControl_page" wigth="100" height="120">
            </div>
        </td>
        <td style="width: auto">
            <div id="top_title">
                <div style="text-align: center; font-size: 80px">Blinds control Page</div>
            </div>
        </td>
    </tr>
</table>
<br><br><br><br><br>


<%--Slider part--%>
<%--<table>--%>
    <%--<tr>--%>
        <%--<td width="500">--%>
            <%--<div style="font-size: 30px">--%>
                <%--Choose you range:--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td width="500">--%>
            <%--<div id="slider"></div>--%>
        <%--</td>--%>
        <%--<td style="font-size: 60px; text-align: center" width="500">--%>
            <%--<div id="contentSlider"></div>--%>
        <%--</td>--%>
    <%--</tr>--%>
</table>
</body>
</html>
