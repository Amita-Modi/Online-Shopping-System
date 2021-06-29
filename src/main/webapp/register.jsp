<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomeCart: New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body class="custom-body-bg">
        <%@include file="components/navbar.jsp" %>
        <!--<h1>Hello World!</h1>-->
        
        <div class="container-fluid">
                    <div class="row mt-5">
                    <div class="col-md-4 offset-md-4">
                        <%@include file="components/message.jsp" %>
                        <div class="card border-dark">
                            <div class="card-header border-dark">
                                <div class="text-center">
                                    <img src="img/register.png" style="max-width: 100px;" class="img-fluid" alt="Register"/>
                                    <h4>Sign Up here!!</h4>
                                </div>
                            </div>
                            
                            <div class="card-body px-5">
                                <form action="RegisterServlet" method="post">
                                    <div class="form-group">
                                        <label for="name">User Name</label>
                                        <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
                                    </div>

                                    <div class="form-group">
                                        <label for="email" class="control-label">User Email ID</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">@</span>
                                            </div>
                                            <input type="email"name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
                                    </div>

                                    <div class="form-group">
                                        <label for="phone">User Phone No</label>
                                        <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter here">
                                    </div>

                                    <div class="form-group">
                                        <label for="adress">User Address</label>
                                        <textarea style="height: 200px; " name="user_address" id="address" class="form-control" placeholder="Enter here"></textarea>
                                    </div>

                                    <div class="container text-center">
                                        <button class="btn btn-outline-info">Register</button>
                                        <button class="btn btn-outline-warning">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

        </div>
    </body>
</html>
