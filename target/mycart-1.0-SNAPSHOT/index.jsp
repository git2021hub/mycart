
<%@page import="com.learn.mycart.helper.Factoryprovider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title> 
        <%@include file="components/common_css_js.jsp" %>
        </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <h1>Creating Session Factory object</h1>
        <%
            out.println(Factoryprovider.getFactory()+"<br>");
            out.println(Factoryprovider.getFactory()+"<br>");
            out.println(Factoryprovider.getFactory());
         %>
    </body>
</html>
