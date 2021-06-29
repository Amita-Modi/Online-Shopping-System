<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user == null){
        session.setAttribute("message","You are not logged in." );
        response.sendRedirect("login.jsp");
        return;
    }
    else if(user.getUserType().equals("admin")){
        session.setAttribute("message", "You are not a Normal User. You are not allowed to access this page!");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        response.sendRedirect("index.jsp");
    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomeCart: Normal User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>This is normal user panel...</h1>
    </body>
</html>
