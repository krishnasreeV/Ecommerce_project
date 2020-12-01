<%-- 
    Document   : Allusers
    Created on : Nov 25, 2018, 11:07:22 PM
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
         
                        ServletContext context = getServletContext();
            String url= context.getInitParameter("DB_URL");
            
            String driver = context.getInitParameter("driver");
            String dbusername=context.getInitParameter("username");
            String dbpassword =context.getInitParameter("password");
            Statement st;
             try{
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url, dbusername, dbpassword);
                st = conn.createStatement();
                String query = "SELECT * FROM Users";
                ResultSet rs = st.executeQuery(query);
           %>
           <!--id,	name,	password,	email,	role.-->
           <br><br><br>
           <div class='deleteitems' align='center'>
                <form method="post">
               <table border='1'>
                  
                   <tr>
                       <td>ID</td>
                        <td>NAME</td>
                         <td>PASSWORD</td>
                          <td>EMAIL</td>
                          <td>ROLE</td>
                          <td>MODIFY</td>
                          <td>DELETE</td>
                   </tr> 
                   <% while(rs.next()){%>
                   <tr>
                       <td><%=rs.getInt("Id")%></td>
                        <td><%=rs.getString("Name")%></td>
                         <td><%=rs.getString("Password")%></td>
                          <td><%=rs.getString("Email")%></td>
                          <td><%=rs.getString("Role")%></td>
                    <td><a href="modifyusers.jsp?Id=<%=rs.getInt("Id")%>">Modify user</a> </td>
                   <td>  <a href="deleteuser.jsp?Id=<%=rs.getInt("Id")%>">Delete user</a>  </td>
               </tr> 
                  <%}%> 
                  <tr><td colspan="7" align="center"><input type="submit" value="Modify/Delete"</td></tr>
               </table>
                   </form>
             
           </div>    
            
<%
}catch(Exception e){
    
}}
%>
  </body>
</html>
