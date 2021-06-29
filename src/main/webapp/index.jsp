<%@page import="com.mycompany.demo.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.demo.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomeCart: Home Page</title>

        <%@include file="components/common_css_js.jsp" %>
        <style>
            .discount-label{
                font-size: 12px!important;
                font-style: italic!important;   
            }
            .product-card:hover{
                color: #FFC107;
                cursor: pointer;
            }
        </style>
    </head>
    <body class="custom-body-bg">

        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <!--Fetching all products-->
                <%                    String cat = request.getParameter("category");
                    //out.println(cat);

                    //Products
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    //Categories
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>

                <!--Show Categories-->
                <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All the Categories
                        </a>

                        <%
                            for (Category c : clist) {
                        %>

                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>

                    </div>
                </div>

                <!--Show Products-->
                <div class="col-md-10">

                    <!--row-->
                    <div class="row mt-4">

                        <!--col:12-->
                        <div class="col-md-12">
                            <div class="card-columns">
                                <!--Traversing products-->
                                <%
                                    for (Product p : list) {
                                %>

                                <!--Product Card-->

                                <div class="card product-card">

                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 180px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="">
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>
                                        </p>
                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white mr-2" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>', <%= p.getPriceAfterDiscount() %>)">Add to Cart</button>
                                        <button class="btn btn-outline-success ml-2">&#8377; <%= p.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label">&#8377; <%= p.getPprice()%>, <%= p.getpDiscount()%>% off</span></button>
                                    </div>
                                </div>

                                <%
                                    }
                                    if (list.size() == 0) {
                                        out.println("<h3>No items in this Category.</h3>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
