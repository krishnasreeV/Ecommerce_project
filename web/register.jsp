<%-- 
    Document   : register
    Created on : Nov 25, 2018, 8:13:56 PM
    Author     : saiv0001
--%>
<!--id,	email,	password,	name,	mobile,	address.-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="newcss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class='forms' align='center' >
            <br><br>
            <form method='post' action='register_1.jsp'>
                <input type='text' name="name" placeholder="Enter your name">
                 <br><br><input type='password' name="password" placeholder="Set a password">
                <br><br><input type='text' name="email" placeholder="Enter your email id">
                <br><br><input type='text' name="mobile" placeholder="Enter your mobile number">
                <br><br><input type='text' name="address" placeholder="Enter your address">
                <br><br><input type='submit' value='Register'>
            </form>
        </div>
    </body>
</html>
