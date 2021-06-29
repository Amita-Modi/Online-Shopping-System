
<!--Check if the user is logged in or not-->
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in. Login to place orders!");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomeCart: Checkout Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body class="custom-body-bg">
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--Card-->
                    <div class="card">
                        <div class="card-header font-weight-bold text-center">
                            <h4 class="mt-2">Products in cart...</h4>
                        </div>

                        <div class="card-body">
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <!--Form details-->
                    <div class="card">
                        <div class="card-header font-weight-bold text-center">
                            <h4 class="mt-2">Please fill your detials.</h4>
                        </div>

                        <div class="card-body">
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" value="<%= user.getUserEmail() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" value="<%= user.getUserName() %>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="number" value="<%= user.getUserPhone() %>" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter your phone number">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Shipping Address</label>
                                    <textarea class="form-control" value="<%= user.getUserAddress() %>" placeholder="Enter your address" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
