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
                <a class="homebutton" href="homeproduct.jsp"><b>HOME</b></a>
            </div>
            
            <div class="dropdown">
                <button class="homebutton">CATEGORIES</button>
                <ul class="dropmenu">
                    <li><a href="Addcategory.jsp">Add Category</a></li>
                    <li><a href="Allcategories.jsp">All Categories</a></li>
                 
                </ul>
            </div>
            <div class="dropdown">
                <button class="homebutton">PRODUCTS</button>
                <ul class="dropmenu">
                    <li><a href="Addproduct.jsp">Add Product</a></li>
                    <li><a href="Allproducts.jsp">All Products</a></li>
                 
                </ul>
            </div>
            <div class="dropdown">
                <button class="homebutton">BESTSELLING</button>
                <ul class="dropmenu">
                    <li><a href="Addbestselling.jsp">Add Bestselling</a></li>
                    <li><a href="Allbestselling.jsp">All Bestselling</a></li>
                 
                </ul>
            </div>
             <div class="dropdown">
                <a class="homebutton" href="reports.jsp"><b>REPORTS</b></a>
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
                String query = "SELECT * FROM ProductMaster LEFT JOIN CategoryMaster ON ProductMaster.catId=CategoryMaster.Id";
                ResultSet rs = st.executeQuery(query);
           %>
<!--          //id,	catId,	name,	brand,	desc,	image,	price.    -->-->
           <br><br><br>
           <div class='deleteitems' align='center'>
                <form method="post" >
               <table border='1'>
                  
                   <tr>
                       <td>ID</td>
                        <td>CATEGORY NAME</td>
                          <td>NAME</td>
                          <td>BRAND</td>
                          <td>DESCRIPTION</td>
                          <td>IMAGE</td>
                          <td>PRICE</td>
                          <td>MODIFY</td>
                          <td>DELETE</td>
                   </tr> 
                   <% while(rs.next()){%>
                   <tr>
                       <td><%=rs.getInt("Id")%></td>
                        <td><%=rs.getString("catName")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("brand")%></td>
                        <td><%=rs.getString("descreption")%></td>
                        <td><%=rs.getString("image")%></td>
                        <td><%=rs.getString("price")%></td>
                    <td><a href="modifyproduct.jsp?Id=<%=rs.getInt("Id")%>">Modify Product</a> </td>
                   <td>  <a href="deleteproduct.jsp?Id=<%=rs.getInt("Id")%>">Delete Product</a>  </td>
               </tr> 
                  <%}%> 
                  <tr><td colspan="9" align="center"><input type="submit" value="Modify/Delete"</td></tr>
               </table>
                   </form>
             
           </div>    
            
<%
}catch(Exception e){
    System.out.println(e);
}}
%>
  </body>
</html>
