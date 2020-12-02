<%-- 
    Document   : logout
    Created on : 12 Nov, 2018, 12:35:57 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cusername= (String)session.getAttribute("cusername");
            if(cusername==null){
            session.removeAttribute("username");
            response.sendRedirect("employeelogin.jsp");}
            else{
                session.removeAttribute("cartid");
                session.removeAttribute("cusername");
            response.sendRedirect("login.jsp");
            }
            %>
    </body>
</html>
