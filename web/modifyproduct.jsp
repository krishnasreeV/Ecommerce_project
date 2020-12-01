<%-- 
    Document   : modifyusers
    Created on : Nov 25, 2018, 11:49:30 PM
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
             String id =request.getParameter("Id");
             System.out.println(id);
                        ServletContext context = getServletContext();
            String url= context.getInitParameter("DB_URL");
            
            String driver = context.getInitParameter("driver");
            String dbusername=context.getInitParameter("username");
            String dbpassword =context.getInitParameter("password");
            Statement st;
            Statement st1;
//            <!--         id,	catId,	name,	brand,	desc,	image,	price.    -->
            try{
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url, dbusername, dbpassword);
                st = conn.createStatement();
                String query = "SELECT * FROM ProductMaster LEFT JOIN CategoryMaster ON  ProductMaster.catId= CategoryMaster.id  WHERE ProductMaster.Id= "+id;
                System.out.println(query);
                ResultSet rs = st.executeQuery(query);
                
                if(rs.next()){
                    System.out.println(rs.getString("catName"));
                 System.out.println(rs.getInt("catid"));
                %>
                <div class='deleteitems' align="center" >
                    <br><br>
                    <form method="post" action="modifyproduct_1.jsp">
                        <table border='1'>
                            <tr> <td>  ID:</td> <td><input type="text" name="id" readonly="true" value='<%=id%>'></td></tr>
                            
                    <tr> <td>  NAME: </td> <td><input type="text" name="name" value="<%=rs.getString("Name")%>"></td></tr>
                    <tr> <td>  BRAND: </td> <td><input type="text" name="brand" value="<%=rs.getString("brand")%>"></td></tr>
                    <tr> <td>  DESCRIPTION: </td> <td><input type="text" name="desc" value="<%=rs.getString("descreption")%>"></td></tr>
                    <tr> <td>  IMAGE: </td> <td><input type="text" name="image" value="<%=rs.getString("image")%>"></td></tr>
                    <tr> <td>  PRICE: </td> <td><input type="text" name="price" value="<%=rs.getString("price")%>"></td></tr>
                   <tr> <td>  CATEGORY </td> <td><select name="category">
                          <%     int catid = rs.getInt("catid"); %>
                <option value="<%=rs.getInt("catid")%>" ><%=rs.getString("catName")%></option>
                <% String query1 = "SELECT * FROM CategoryMaster";
                rs.close();
                st.close();
                st1 = conn.createStatement();
                ResultSet rsa = st1.executeQuery(query1);
                                while(rsa.next()){  if(rsa.getInt("id")!=catid){%>
                <option value="<%=rsa.getInt("id")%>" ><%=rsa.getString("catname")%></option>
                <%}}%>
                           </select><br><br></td>
                     <tr><td colspan='2' align='center'><input type="submit" value='Modify'></td></tr>
                        </table>
                    </form>
                </div>
     <%           
           } }catch(Exception e){
       System.out.println(e);         
}} %>
    </body>
</html>
