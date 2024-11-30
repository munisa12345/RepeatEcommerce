<%@ page import="uz.pdp.repeatecommerce.entity.User" %>
<%@ page import="uz.pdp.repeatecommerce.entity.Basket" %>
<%@ page import="uz.pdp.repeatecommerce.entity.Category" %>
<%@ page import="uz.pdp.repeatecommerce.DB" %>
<%@ page import="uz.pdp.repeatecommerce.entity.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/30/2024
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .header {
            background-color: #343a40;
            color: white;
            padding: 20px;
        }

        .profile-section {
            display: flex;
            align-items: center;
        }

        .profile-section img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 2px solid white;
            margin-right: 10px;
        }

        .profile-section p {
            margin: 0;
            font-weight: bold;
            font-size: 20px;
        }

        .header .d-flex.gap-2 {
            gap: 5px;
        }

        .product-card {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            margin-bottom: 15px;
        }

        .product-card img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .product-card button {
            margin-top: 10px;
        }

        .category-buttons {
            margin-bottom: 20px;
        }

        .category-buttons button {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
    <title>Categories</title>
</head>
<body>
<!-- Header -->
    <%
    User currentUser = (User) session.getAttribute("currentUser");
    boolean isLoggedIn = currentUser != null;
%>
<div class="header d-flex align-items-center px-3">
    <div class="profile-section me-auto">
        <% if (isLoggedIn) { %>
        <img src="<%= request.getContextPath() + "/file/profile" %>" alt="Profile Picture">
        <p class="text-white m-0"><%= currentUser.getFirstName() %></p>
        <% } else { %>
        <p class="text-white m-0">Guest</p>
        <% } %>
    </div>

    <div class="d-flex align-items-center gap-2">
        <% if (isLoggedIn) { %>
        <%
            HttpSession session1 = request.getSession(true); // Sessiyani yaratish
            Basket basket = (Basket) session1.getAttribute("basket");

            if (basket == null) {
                basket = new Basket();
                session1.setAttribute("basket", basket);
            }
        %>
        <a href="showOrders.jsp" class="btn btn-outline-light">My Orders</a>
        <a href="basket.jsp" class="btn btn-outline-light">
            Basket(<%= basket.getBASKET().size() %>)
        </a>

        <a href="/logout">
            <button class="btn btn-outline-light" type="submit">Logout</button>
        </a>
        <% } else { %>
        <a href="login.jsp" class="btn btn-outline-light">Login</a>
        <% } %>
    </div>
</div>

<div class="container mt-4">
    <div class="row">

        <div class="col-3 border-end category-buttons">
            <h2>Categories</h2>
                <%
                String selectedCategoryId = request.getParameter("categoryId");
            %>

            <form action="categories.jsp" method="get">
                <input type="hidden" name="categoryId" value="">
                <button class="btn <%= (selectedCategoryId == null || selectedCategoryId.isEmpty()) ? "btn-dark" : "btn-outline-dark" %> w-100 mb-2" type="submit">All</button>
            </form>
                <% for (Category category : DB.CATEGORIES) {
                boolean isActive = String.valueOf(category.getId()).equals(selectedCategoryId);
            %>


            <form action="categories.jsp" method="get">
                <input type="hidden" name="categoryId" value="<%= category.getId() %>">
                <button class="btn <%= isActive ? "btn-dark" : "btn-outline-dark" %> w-100 mb-2" type="submit">
                    <%= category.getName() %>
                </button>
            </form>
            <% } %>
        </div>

        <div class="col-9">
            <h1 class="text-center">Products</h1>
            <div class="row">
                <%
                    List<Product> products;
                    if (selectedCategoryId != null && !selectedCategoryId.isEmpty()) {
                        Integer categoryId = Integer.parseInt(selectedCategoryId);
                        products = DB.getProductsByCategoryId(categoryId);
                    } else {
                        products = DB.PRODUCTS;
                    }

                    HttpSession session1 = request.getSession(true);
                    Basket basket = (Basket) session1.getAttribute("basket");

                    if (basket == null) {
                        basket = new Basket();
                        session1.setAttribute("basket", basket);
                    }

                    for (Product product : products) {
                        boolean isInBasket = basket.getBASKET() != null && basket.getBASKET().containsKey(product);
                %>
                <div class="col-md-4">
                    <div class="product-card">
                        <img src="<%= request.getContextPath() + "/file/" + product.getId() %>" alt="<%= product.getName() %>">
                        <h5><%= product.getName() %></h5>
                        <p><%= product.getPrice() %> UZS</p>
                        <form action="addToBasket.jsp" method="post">
                            <input type="hidden" name="categoryId" value="<%= selectedCategoryId %>">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <% if (isInBasket) { %>
                            <button class="btn btn-danger" type="submit">X</button>
                            <% } else { %>
                            <button class="btn btn-success" type="submit">+</button>
                            <% } %>
                        </form>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
