<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Send HTTPRequest and get HTTPResponse--%>
    <script>
        $(document).ready(function(){
            $("button").click(function(){
                $.get("http://localhost:8080/test",
                        {requestFromJSP : "giveMeResponse"},
                        function(data, status){
                            $("#result").text(data);
                            alert("Data: " + data + "\nStatus: " + status);
                });
            });
        });
    </script>
</head>
<body>

<button>Get Data to DIV</button>

<div id="result"></div>
</body>
</html>
