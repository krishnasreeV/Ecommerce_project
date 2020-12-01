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
                int cart_id=0;
                int custid=0;
                Statement st1;
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
                   <% } conn.close();
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
                       Connection co;
                       co = DriverManager.getConnection(url, dbusername, dbpassword);
                        st1 = co.createStatement();
                String query1 = "SELECT * FROM CustomerMaster WHERE name= '"+username+"'";
                System.out.println(query1); 
                ResultSet rs1 = st1.executeQuery(query1);
                if(rs1.next()){
               custid = rs1.getInt("id");
                }
                       int totprice = 0;
                       Connection c;
                       c = DriverManager.getConnection(url, dbusername, dbpassword);
                       
                      
                Statement sth = c.createStatement();
          
          String queryh = "SELECT * FROM CartDetails LEFT JOIN ProductMaster ON ProductMaster.id=CartDetails.prodId LEFT JOIN Cart ON Cart.id=CartDetails.cartid WHERE custid = "+custid+" AND status = 'Added'";
         System.out.println(queryh);
          ResultSet rsh = sth.executeQuery(queryh);
          
              
         
        %>
        <h1 align="center">CART</h1>
          <%
           while(rsh.next()){
                
                   totprice = totprice+ (rsh.getInt("price")*rsh.getInt("qty"));     
          %>
           <br><br><br>
                 <div class="deleteitems" align="center">
                     
                     
                     <div align="center" class="dropdown">
                        
                  <img align="center" src="<%=rsh.getString("image")%>.jpg"> 
                     </div>
                  <div class="dropdown">       Product name: <%=rsh.getString("name")%><br>
                       Brand: <%=rsh.getString("brand")%><br>
                       Description:<%=rsh.getString("descreption")%><br>
                       Price:<%=rsh.getInt("price")%><br>
                       Quantity:<%=rsh.getInt("qty")%><br>
                       <br>
                       <a class="homebutton" href="removefromcart.jsp?prodid=<%=rsh.getInt("prodId")%>"><b>Remove from cart</b></a>
                     </div>
                        
                  </div>
           <%
               
          }
                     Statement sti = c.createStatement();
          
          String queryi = "SELECT * FROM CartDetails LEFT JOIN ProductMaster ON ProductMaster.id=CartDetails.prodId LEFT JOIN Cart ON Cart.id=CartDetails.cartid WHERE custid = "+custid+" AND status = 'Added'";
          System.out.println(queryi);
          ResultSet rsi = sti.executeQuery(queryi);
          if(rsi.next()){
          int cartid = rsi.getInt("cartid");
                System.out.println("cart id set");
          session.setAttribute("cartid", cartid);
            co.close();
}
            
            if(totprice!=0){
           %>
           <div align="center" class="deleteitems">   TOTAL PRICE: <%=totprice%> <br><br>
         <a class="homebutton" href="confirmorder.jsp"><b>Confirm Order</b></a></div>
          <%
     }       
 
   
   }catch(Exception e){
System.out.println(e);} }
%>
    </body>
</html>
