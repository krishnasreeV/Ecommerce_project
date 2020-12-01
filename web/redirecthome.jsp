<%-- 
    Document   : redirecthome
    Created on : Nov 25, 2018, 6:45:26 PM
    Author     : saiv0001
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%String role = (String)session.getAttribute("role");
       System.out.println(role);
       if(role=="admin"){
           response.sendRedirect("homeadmin");
       }else if(role=="product"){
           response.sendRedirect("homeproduct");
       }else if(role=="shipping"){
           response.sendRedirect("homeshipping");
       }else if(role=="inventory"){
           response.sendRedirect("homeinventory");
       }else{
           
       }
       

       %>
       
    </body>
</html>
