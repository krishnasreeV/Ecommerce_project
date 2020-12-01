<%-- 
    Document   : homeadmin
    Created on : 11 Nov, 2018, 7:15:42 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="newcss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String username = (String)session.getAttribute("username");
            if(username==null){
        %>
        <h1>You are not logged in</h1><br><br>
         <a href="employeelogin.jsp">LOGIN</a>
        <%}else{
%>
       
        <div class="heading" >
        <h1 align="center">Welcome to Shopoholics.com <%=username%> </h1><br>
        </div>
        <div class="nav-bar" align="center">
            <div class="dropdown">
                <a class="homebutton" href="homeadmin.jsp"><b>HOME</b></a>
            </div>
            
         <div class="dropdown">
                <a class="homebutton" href="shipping.jsp"><b>SHIPPING</b></a>
            </div>
            
            <div class="dropdown">
                <a class="homebutton" href="logout.jsp"><b>LOGOUT</b></a>
            </div>
            
            
        </div>  
            
            
        
        <%}
%>
    </body>
</html>
