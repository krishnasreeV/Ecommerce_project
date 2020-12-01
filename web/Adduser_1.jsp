<%-- 
    Document   : Adduser_1
    Created on : Nov 25, 2018, 10:52:13 PM
    Author     : saiv0001
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        %>    <div class="heading" >
        <h1 align="center">Welcome to Shopoholics.com <%=username%> </h1><br>
        </div>
        <div class="nav-bar" align="center">
            <div class="dropdown">
                <a class="homebutton" href="homeadmin.jsp"><b>HOME</b></a>
            </div>
            
            <div class="dropdown">
                <button class="homebutton">USERS</button>
                <ul class="dropmenu">
                    <li><a href="Adduser.jsp">Add User</a></li>
                    <li><a href="Allusers.jsp">All Users</a></li>
                 
                </ul>
                
            </div>
            <div class="dropdown">
                <a class="homebutton" href="logout.jsp"><b>LOGOUT</b></a>
            </div>
            </div>  
            <% Connection conn= null;
            String name = request.getParameter("name");
             String password = request.getParameter("password");
              String email = request.getParameter("email");
               String role = request.getParameter("role");
                        ServletContext context = getServletContext();
            String url= context.getInitParameter("DB_URL");
            
            String driver = context.getInitParameter("driver");
            String dbusername=context.getInitParameter("username");
            String dbpassword =context.getInitParameter("password");
            Statement st;
//            <!--id,	name,	password,	email,	role.-->
            try{
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url, dbusername, dbpassword);
                st = conn.createStatement();
                String query = "INSERT INTO Users (name,password,email,role) VALUES ('"+name+"','"+password+"','"+email+"','"+role+"')";
                int result = st.executeUpdate(query);
                if(result==1){%>
                <h1>New user successfully added.</h1>  
           <%     }
            }catch(Exception e){
                
}}%>
    </body>
</html>
