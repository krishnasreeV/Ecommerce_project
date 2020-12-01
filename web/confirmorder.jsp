<%-- 
    Document   : confirmorder
    Created on : Dec 3, 2018, 2:03:42 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% Connection conn= null;
            String name = request.getParameter("name");
             
                        ServletContext context = getServletContext();
            String url= context.getInitParameter("DB_URL");
            
            String driver = context.getInitParameter("driver");
            String dbusername=context.getInitParameter("username");
            String dbpassword =context.getInitParameter("password");
            Statement st;
//            <!--id,	name,	password,	email,	role.-->
            try{
                int cart_id= (Integer)session.getAttribute("cartid");
                
                Statement st1;
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url, dbusername, dbpassword);
                st = conn.createStatement();
                String query = "UPDATE Cart SET status='Ordered' WHERE id = "+cart_id;
                st.executeUpdate(query);
                session.removeAttribute("cartid");
                response.sendRedirect("successorder.jsp");
            }catch(Exception e){
                
            }
            %>
    </body>
</html>
