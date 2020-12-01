<%-- 
    Document   : homeadmin
    Created on : 11 Nov, 2018, 7:15:42 PM
    Author     : User
--%>

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
%>
       
        <div class="heading" >
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
            
            
        
        <%}
%>
    </body>
</html>
