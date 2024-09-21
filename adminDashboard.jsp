<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.revshop.entity.Admin"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <% 
        Admin admin = (Admin) session.getAttribute("admin"); 
        if (admin != null) { 
    %>
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="viewProducts">Manage Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="manageUsers">Manage Users</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewComplaints">View Complaints</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewRegistrationRequests">View Registration Requests</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </nav>

        <!-- Dashboard Welcome Message -->
        <div class="container mt-5">
            <h1>Welcome, <%= admin.getEmail() %></h1>
            <p>Use the navigation bar to manage products, users, complaints, and registration requests.</p>

            <!-- Dashboard Statistics -->
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Total Products</h5>
                            <p class="card-text"><%= request.getAttribute("productCount") != null ? request.getAttribute("productCount") : 0 %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Total Registrations</h5>
                            <p class="card-text"><%= request.getAttribute("registrationCount") != null ? request.getAttribute("registrationCount") : 0 %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Total Viewers</h5>
                            <p class="card-text"><%= request.getAttribute("viewerCount") != null ? request.getAttribute("viewerCount") : 0 %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <% 
        } else { 
    %>
        <!-- Redirect to login if session is invalid -->
        <script>window.location.href = "admin-login.jsp";</script>
    <% } %>
</body>
</html>
