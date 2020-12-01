<%-- 
    Document   : homecustomer
    Created on : Nov 25, 2018, 8:05:27 PM
    Author     : saiv0001
--%>
<!--Home,	Products,	BestSelling,	Cart, Logout.-->
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
            String username = (String)session.getAttribute("cusername");
            if(username==null){
        %>
        <h1>You are not logged in</h1><br><br>
         <a href="login.jsp">LOGIN</a>
        <%}else{
%>
       
        <div class="heading" >
        <h1 align="center">Welcome to Shopoholics.com <%=username%> </h1><br>
        </div>
        <div class="nav-bar" align="center">
            <div class="dropdown">
                <a class="homebutton" href="homecustomer.jsp"><b>HOME</b></a>
            </div>
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
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url, dbusername, dbpassword);
                st = conn.createStatement();
                String query = "SELECT * FROM CategoryMaster";
                System.out.println(query); 
                ResultSet rs = st.executeQuery(query);
               
             
                %>
            <div class="dropdown">
                <button class="homebutton">PRODUCTS</button>
                <ul class="dropmenu">
                    <% while(rs.next()){
                        %>
                    <li><a href="Showcategory.jsp?catid=<%=rs.getInt("id")%>"><%=rs.getString("catName")%></a></li>

                   <%  System.out.println ("debug print"+ rs.getString("catName"));} conn.close();
                st.close();
                   %>
                 
                </ul>
            </div>
            <div class="dropdown">
                <a class="homebutton" href="bestselling.jsp"><b>BESTSELLING</b></a>
            </div>
            <div class="dropdown">
               <a class="homebutton" href="cart.jsp"><b>CART</b></a>
                
            </div>
            
            <div class="dropdown">
                <a class="homebutton" href="logout.jsp"><b>LOGOUT</b></a>
            </div>
            
<!--            - id,	catId,	name,	brand,	desc,	image,	price.-->
        </div>
          <%  
              String id =request.getParameter("catid");
              conn = DriverManager.getConnection(url, dbusername, dbpassword);
                st = conn.createStatement();
                String query1 = "SELECT * FROM ProductMaster WHERE catId ="+id;
                System.out.println(query1);
                ResultSet rsa = st.executeQuery(query1);
            
               %>
               <form method="post" action="submit">
               <%
                 while(rsa.next()){ 
                  System.out.println(rsa.getString("image"));  
          %>
          <br><br><br>
                 <div class="deleteitems" align="center">
                     
                     
                     <div align="center" class="dropdown">
                        
                  <img align="center" src="<%=rsa.getString("image")%>.jpg"> 
                     </div>
                  <div class="dropdown">       Product name: <%=rsa.getString("name")%><br>
                       Brand: <%=rsa.getString("brand")%><br>
                       Description:<%=rsa.getString("descreption")%><br>
                       Price:<%=rsa.getInt("price")%><br>
                       <br>
                       <a class="homebutton" href="addtocart.jsp?prodid=<%=rsa.getInt("id")%>"><b>Add to cart</b></a>
                     </div>
                        
                 </div>
              <%   }
%>  End of products in this category
            </form>

           
<%


            
      
            
   }catch(Exception e){
System.out.println(e);} }
%>
    </body>
</html>
