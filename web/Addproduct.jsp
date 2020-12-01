<%-- 
    Document   : Adduser
    Created on : Nov 25, 2018, 10:44:30 PM
    Author     : saiv0001
--%>
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!--id,	name,	password,	email,	role.-->
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
                
<!--         id,	catId,	name,	brand,	desc,	image,	price.    -->
        </div>     <br><br><br>
        <div class="forms" align='center'>
            <form method="post" action="Addproduct_1.jsp">
            <input type='text' name='name' placeholder="Enter name of the product"><br><br>
            <select name="category">
                <option>Select category</option>
                <% while(rs.next()){ %>
                <option value="<%=rs.getInt("id")%>" ><%=rs.getString("catname")%></option>
                <%}%>
            </select><br><br>
            <input type='text' name='brand' placeholder="Enter brand of the product"><br><br>
            <input type='text' name='description' placeholder="Enter description of the product"><br><br>
            <input type='text' name='image' placeholder="Upload image of the product to the server and enter the image file name here."><br><br>
            <input type='text' name='price' placeholder="Enter price of the product"><br><br>
           <br><br>
            <input type="submit" value='Submit'>
            </form>
        </div>
        <%   
}catch(Exception e){
System.out.println(e);
}
}%>
    </body>
</html>
