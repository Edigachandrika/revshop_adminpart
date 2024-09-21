<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.revshop.entity.Complaints"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Complaints</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        table {
            background-color: #f8f9fa; /* Light background for the table */
        }
        thead {
            background-color: #343a40; /* Dark background for the header */
            color: white; /* White text for the header */
        }
        tbody tr {
            background-color: #ffffff; /* White background for rows */
        }
        tbody tr:hover {
            background-color: #e2e2e2; /* Light gray on hover */
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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

    <div class="container mt-5">
        <h2>View Complaints</h2>

        <!-- Display Error Message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                ${errorMessage}
            </div>
        </c:if>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Complaint ID</th>
                    <th>User ID</th>
                    <th>Message</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty complaints}">
                    <c:forEach var="complaint" items="${complaints}">
                        <tr>
                            <td>${complaint.complaintId}</td>
                            <td>${complaint.userId}</td>
                            <td>${complaint.message}</td>
                            <td>${complaint.status}</td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty complaints}">
                    <tr>
                        <td colspan="4" class="text-center">No complaints available.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
