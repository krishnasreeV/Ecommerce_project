<%-- 
    Document   : register_1
    Created on : Nov 25, 2018, 8:14:07 PM
    Author     : saiv0001
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--id,	email,	password,	name,	mobile,	address.-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String name = request.getParameter("name");
           System.out.println(name);
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            System.out.println(password);
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
   
            
            if(name.isEmpty()||email.isEmpty()||password.isEmpty()||mobile.isEmpty()||address.isEmpty()){ %>
            <h1><a href="register.jsp">Please enter all the mandatory fields and try again.</a></h1>    
          <%  }else{
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
                String query = "INSERT INTO CustomerMaster(email,password,name,mobile,address) VALUES ('"+email+"','"+password+"','"+name+"','"+mobile+"','"+address+"');";
                System.out.println(query);
                int result = st.executeUpdate(query);
                if(result==1){
                    
                    %>
                    <h1><a href="login.jsp">Registered Successfully, Login</a></h1>
                 <%   }
}
            catch(Exception e){
                       System.out.println(e); 
                }}
                 
                 %>
                
    </body>
</html>
