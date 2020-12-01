<%-- 
    Document   : loginform1
    Created on : 11 Nov, 2018, 7:32:51 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%   
            String name = request.getParameter("username");
            String password = request.getParameter("password");
            

            Connection conn= null;
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
                String query = "SELECT * FROM CustomerMaster WHERE Name='"+name+"'";
                ResultSet rs = st.executeQuery(query);
                if(rs.next()==false){
                    %>
                    <h1>Username does not exist</h1><br><br>
                    <a href="login.jsp">Try logging in again</a>
                    <%
                }else{
                String usernameverify = rs.getString("Name");
                System.out.println(usernameverify);
                String passwordverify = rs.getString("Password");
                    
        
                    if(name.equals(usernameverify)&&password.equals(passwordverify)){
                          session.setAttribute("cusername", name);      
                          response.sendRedirect("homecustomer.jsp");
                                 }
else{
            session.removeAttribute("cusername");
                %>
            <h1>Password is incorrect</h1><br><br>
            <a href="login.jsp">Try logging in again</a>
            <%
}
                            }
}
catch(Exception e){
System.out.println(e);
}


 
        %>
       
    </body>
</html>
