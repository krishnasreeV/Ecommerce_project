<%-- 
    Document   : homeproduct
    Created on : Nov 25, 2018, 6:28:06 PM
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
        <h1>
            <% 
                String username;
               String password;
                 username = request.getParameter("username");
                 System.out.println(username);
                 password = request.getParameter("password");
                if(username.isEmpty()){
                      username = (String)session.getAttribute("username");
                       password = (String)session.getAttribute("password");
                }
                 
                Connection conn= null;
                        ServletContext context = getServletContext();
						System.out.println("debugcontext"+context);
            String url= context.getInitParameter("DB_URL");
            System.out.println("debug"+url);
            String driver = context.getInitParameter("driver");
            System.out.println("debug"+driver);
            String dbusername=context.getInitParameter("username");
            System.out.println("debug"+dbusername);
            String dbpassword =context.getInitParameter("password");
            System.out.println("debug"+dbpassword);
            Statement st;
            
            try{
                Class.forName(driver).newInstance();
                System.out.println("Conn");
                conn = DriverManager.getConnection(url, dbusername, dbpassword);
                System.out.println("conn");
                st = conn.createStatement();
                String query = "SELECT * FROM Users WHERE Name='"+username+"'";
                System.out.println("here");
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                    String usernamedb= rs.getString("Name");
                    String passworddb= rs.getString("Password");
                    String roledb= rs.getString("Role");
              
                  if(username.equals(usernamedb)&&password.equals(passworddb)){
                          session.setAttribute("username", username);  
                          session.setAttribute("password", password);  
                         String redirect = "home"+roledb+".jsp";
                         System.out.println(redirect);
                         System.out.println(redirect);
                            response.sendRedirect(redirect);
                                 }  
                  else{
          session.removeAttribute("username");      
            session.removeAttribute("password");      %>
                 <h1><a href="employeelogin.jsp">Password incorrect, Please try again</a></h1>
                  <%}
                }
                else{
            session.removeAttribute("username");      
            session.removeAttribute("password"); 
            %>
                <h1><a href="employeelogin.jsp">User doesn't exist, Please try again</a></h1>
                <%
                    }}
    catch(Exception e){
        System.out.println(e);
                }
            %>
        </h1>
    </body>
</html>
