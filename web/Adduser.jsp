<%-- 
    Document   : Adduser
    Created on : Nov 25, 2018, 10:44:30 PM
    Author     : saiv0001
--%>
<!--id,	name,	password,	email,	role.-->
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
            
            
        </div>     <br><br><br>
        <div class="forms" align='center'>
            <form method="post" action="Adduser_1.jsp">
            <input type='text' name='name' placeholder="Enter user name"><br><br>
            <input type='text' name='password' placeholder="Enter password"><br><br>
            <input type='text' name='email' placeholder="Enter email id of the user"><br><br>
            <select type='text' name='role' >
                <option >Select the role</option>
                <option value='admin'>Admin</option>
                 <option value='shipping'>Shipping</option>
                  <option value='inventory'>Inventory</option>
                   <option value='product'>Product</option>
            </select><br><br>
            <input type="submit" value='Submit'>
            </form>
        </div>
        <%}%>
    </body>
</html>
