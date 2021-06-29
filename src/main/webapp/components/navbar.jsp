
<!--****************************___COMMON NAVBAR ELEMENT___****************************-->

<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.demo.helper.FactoryProvider"%>
<%@page import="com.mycompany.demo.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");

    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> cList = cDao.getCategories();
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">HomeCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

                <!--________________________DROPDOWN_________________-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%
                            for (Category c : cList) {
                        %>

                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="dropdown-item"><%= c.getCategoryTitle()%></a>
                        <div class="dropdown-divider"></div>
                        <%
                            }
                        %>
                    </div>
                </li>

            </ul>

            <ul class="navbar-nav ml-auto">
                <!--ICON-->
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 30px; color: #FFC107"></i>
                        <span class="ml-2 cart-items" style="font-size: 18px">(0)</span>
                    </a>
                </li>

                <%
                    if (user1 == null) {
                %>      

                <!--_______________________LOGIN_________________-->
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>

                <!--________________________REGISTER__________________-->
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
            </ul>
            <%
            } else {
            %>

            <ul class="navbar-nav ml-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><%= user1.getUserName()%></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
            </ul>

            <%
                }
            %>

        </div>
    </div>
</nav>