<%@page import="java.util.Map"%>
<%@page import="com.mycompany.demo.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.demo.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in.");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not an Admin. You are not allowed to access this page!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
    //getting count
    Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomeCart: Admin Panel</title>
        <style>
            .admin .card{
                border: 1px solid #7b1fa2;
            }
            .admin .card:hover{
                background: #E1E8EB;
                color: #FFC107;
                cursor: pointer;
            }
        </style>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body class="custom-body-bg">
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

            <!--First Row-->
            <div class="row mt-3">
                <!--First Column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/group.png" alt="user_id">
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h2 class="text-uppercase text-muted">Users</h2>
                        </div>
                    </div>
                </div>

                <!--Second Column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/options.png" alt="user_id">
                            </div>
                            <h1><%= list.size() %></h1>
                            <h2 class="text-uppercase text-muted">Categories</h2>
                        </div>
                    </div>
                </div>

                <!--Third Column-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_id">
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h2 class="text-uppercase text-muted">Products</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!--Second Row-->
            <div class="row mt-3">
                <!--Second Row: Fist Column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/add.png" alt="user_id">
                            </div>
                            <p class="mt-3">Click here to add new Category!</p>
                            <h2 class="text-uppercase text-muted">Add Category</h2>
                        </div>
                    </div>
                </div>

                <!--Second Row: Second Column-->
                <div class="col-md-6 ">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/add-product.png" alt="user_id">
                            </div>
                            <p class="mt-3">Click here to add new Product!</p>
                            <h2 class="text-uppercase text-muted">Add Product</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Add Category Modal-->

        <!-- Modal -->

        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" >

                            <input type="hidden" name="operation" value="addcategory" />

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height:150px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>

                            <div class="container  text-center">
                                <button class="btn btn-outline-warning">Add Category</button>
                                <button type="button" class="btn btn-secondary ml-3" data-dismiss="modal">Close</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--End Add Category Model-->


        <!--Add Product Modal-->

        <!-- Modal -->

        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct" />

                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter product name" required/>
                            </div>

                            <div class="form-group">
                                <textarea style="height:150px;" class="form-control" placeholder="Enter product description" name="pDesc" required></textarea>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required />
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required />
                            </div>

                            <!--product Categories-->



                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%
                                        for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="file" class="form-control" name="pPic" required />
                                <br>
                                <label for="pPic">Select Picture of Product</label>
                            </div>

                            <div class="container  text-center">
                                <button class="btn btn-outline-warning">Add Product</button>
                                <button type="button" class="btn btn-secondary ml-3" data-dismiss="modal">Close</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--End Add Product Model-->

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
