<%-- 
    Document   : modifyusers
    Created on : Nov 25, 2018, 11:49:30 PM
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
             String id =request.getParameter("Id");
             System.out.println(id);
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
                String query = "SELECT * FROM Users WHERE Id= "+id;
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                %>
                <div class='deleteitems' align="center" >
                    <br><br>
                    <form method="post" action="modifyusers_1.jsp">
                        <table border='1'>
                            <tr> <td>  ID:</td> <td><input type="text" name="id" readonly="true" value='<%=id%>'></td></tr>
                    <tr> <td>  NAME: </td> <td><input type="text" name="name" value="<%=rs.getString("Name")%>"></td></tr>
                    <tr> <td>  PASSWORD: </td> <td><input type="text" name="password" value="<%=rs.getString("password")%>"></td></tr>
                    <tr> <td>  EMAIL: </td> <td><input type="text" name="email" value="<%=rs.getString("email")%>"></td></tr>
                     <tr> <td>  ROLE:</td> <td><input type="text" name="role" value="<%=rs.getString("role")%>"></td></tr>
                     <tr><td colspan='2' align='center'><input type="submit" value='Modify'></td></tr>
                        </table>
                    </form>
                </div>
     <%           
           } }catch(Exception e){
                
}} %>
    </body>
</html>
