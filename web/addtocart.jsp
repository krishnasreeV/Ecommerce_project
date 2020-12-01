<%-- 
    Document   : homecustomer
    Created on : Nov 25, 2018, 8:05:27 PM
    Author     : saiv0001
--%>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
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
             int cartid=0;
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
                   <% }  %>
                 
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
            
            
        </div>  
          
        <%   
            
            int custid = 0;
            String prodid;
          Statement sta;
          sta = conn.createStatement();
          String querya = "SELECT * FROM CustomerMaster WHERE name = '"+username+"'";
          ResultSet rsa = sta.executeQuery(querya);
          if(rsa.next()){
           custid = rsa.getInt("id");
          System.out.println("custid"+custid);}
           prodid =request.getParameter("prodid");
          
           Statement stb;
          stb = conn.createStatement();
          String queryb = "SELECT * FROM Cart WHERE custId = "+ custid +" AND status='Added'";
          ResultSet rsb = stb.executeQuery(queryb);
          
          if(rsb.next()){
              cartid = rsb.getInt("id");
                Statement stc;
          stc = conn.createStatement();
          String queryc = "SELECT * FROM CartDetails WHERE cartId = "+ cartid +" AND prodid= "+prodid;
          ResultSet rsc = stc.executeQuery(queryc);
          if(rsc.next()){
              int qty = rsc.getInt("qty")+1;
                  Statement std;
          std = conn.createStatement();
          String queryd = "UPDATE CartDetails SET qty = "+ qty+ " WHERE cartId = "+ cartid +" AND prodid= "+prodid;
          System.out.println(queryd);
           std.executeUpdate(queryd);
          
         
          }else{
              Statement std;
//              id,	cartId,	prodId,	qty.
          std = conn.createStatement();
          String queryd = "INSERT INTO CartDetails (cartId,prodId,qty) VALUES ("+cartid+","+prodid+",1)";
           std.executeUpdate(queryd);
          }
//          custId,	status
          }else{
              
               Statement ste;
          ste = conn.createStatement();
          String querye = "INSERT INTO Cart (custId,status) VALUES ("+ custid+", 'Added')";
          System.out.println(querye);
          ste.executeUpdate(querye);
           stb = conn.createStatement();
          String queryf = "SELECT * FROM Cart WHERE custId = "+ custid +" AND status='Added'";
          ResultSet rsf = stb.executeQuery(queryf);
           
          if(rsf.next()){
            cartid = rsf.getInt("id");
          }
          Statement stg = conn.createStatement();
          String queryd = "INSERT INTO CartDetails (cartId,prodId,qty) VALUES ("+cartid+","+prodid+",1)";
           stg.executeUpdate(queryd);
          }
          
         response.sendRedirect("cart.jsp?cartid="+cartid);
          
         
          
         }catch(Exception e){
         System.out.println(e);
 }
         
     
      } 
%>  
            </form>
    </body>
</html>
