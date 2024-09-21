<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.revshop.entity.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Products</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #fff;
        }
        .navbar-nav .nav-link:hover {
            color: #ddd;
        }
        .alert {
            margin-top: 20px;
        }
        .table-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Admin Dashboard</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="adminDashboard.jsp">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manageUsers.jsp">Manage Users</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="viewOrders.jsp">View Orders</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <h2 class="my-4">Manage Products</h2>

    <!-- Display Success or Error Message -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">
            ${message}
        </div>
    </c:if>

    <!-- Add Product Form -->
    <form:form action="addProducts" method="POST" modelAttribute="product" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Product Name:</label>
            <form:input path="productName" id="name" class="form-control" required="true"/>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <form:input path="price" id="price" class="form-control" required="true"/>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <form:textarea path="description" id="description" class="form-control" required="true"/>
        </div>
        <div class="form-group">
            <label for="status">Status:</label>
            <form:select path="active" id="status" class="form-control" required="true">
                <form:option value="Active">Active</form:option>
                <form:option value="Inactive">Inactive</form:option>
            </form:select>
        </div>
        <div class="form-group">
            <label for="category">Product Category:</label>
            <form:input path="product_category" id="category" class="form-control" required="true"/>
        </div>
        <div class="form-group">
            <label for="image">Attach Product Image:</label>
            <input type="file" id="image" name="image" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to add this product?');">Add Product</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </form:form>

    <hr>

    <!-- Product List Table -->
    <div class="table-container">
        <h2 class="text-center">Product List</h2>

        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.product_id}</td>
                        <td>${product.productName}</td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td>${product.product_category}</td>
                        <td>${product.active}</td>
                        <td>
                            <a href="editProduct.jsp?product_id=${product.product_id}" class="btn btn-primary">Edit</a>
                            <a href="deleteProduct.jsp?product_id=${product.product_id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
