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
        <div class='forms'align='center'>
        <form method="post" action="loginform1.jsp">
            Username: <input type="text" name="username"><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" name="submit" value="Login">
            
        </form>
        </div>
        <%
            }
            
            else
                    {response.sendRedirect("loginform1.jsp");
                    
                    }
        
        %>
        
    </body>
</html>
