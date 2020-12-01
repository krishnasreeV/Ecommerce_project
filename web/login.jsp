<%-- 
    Document   : login
    Created on : 11 Nov, 2018, 7:16:19 PM
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
            String username = (String)session.getAttribute("cusername");
            if(username==null){
        %>
        <div class='forms'align='center'>
        <form method="post" action="customerlogin1.jsp">
            Username: <input type="text" name="username"><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" name="submit" value="Login">
            
        </form>
        </div>
        <br><br><br>
        <div class="forms" align="center"><a href="register.jsp">Register if you're a new customer</a></div>
        <div class="forms" align="right"><a href="employeelogin.jsp">Employee login</a></div>
        <%
            }
        
            else
                    {response.sendRedirect("homecustomer.jsp");
                    
                    }
        
        %>
        
    </body>
</html>
