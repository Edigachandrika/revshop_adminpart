<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.revshop.entity.Buyer"%>
<%@ page import="com.revshop.entity.Retailer"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Manage Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .nav-link {
            color: #fff;
        }
        .nav-link:hover {
            color: #ddd;
        }
        .container {
            margin-top: 50px;
        }
        h2 {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<% if (session.getAttribute("admin") != null) { %>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="viewProducts">Manage Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manageUsers">Manage Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewComplaints">View Complaints</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewRegistrationRequests">View Registration Requests</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h2>Manage Users</h2>

        <!-- Success or Error Message -->
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <div class="alert alert-success">
            <%= message %>
        </div>
        <%
            }
        %>

        <!-- Table for Displaying Buyers -->
        <h3>Buyers</h3>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>User ID</th>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Buyer> users = (List<Buyer>) request.getAttribute("users");
                    if (users != null && !users.isEmpty()) {
                        for (Buyer user : users) {
                %>
                <tr>
                    <td><%= user.getBuyerId() %></td>
                    <td><%= user.getBuyerName() %></td>
                    <td><%= user.getBuyerEmail() %></td>
                    <td><%= user.isBlocked() ? "Blocked" : "Active" %></td>
                    <td>
                        <form method="post" action="toggleBlockUser">
                            <input type="hidden" name="userId" value="<%= user.getBuyerId() %>">
                            <button type="submit" class="btn <%= user.isBlocked() ? "btn-success" : "btn-danger" %>">
                                <%= user.isBlocked() ? "Unblock" : "Block" %>
                            </button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No buyers available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <!-- Table for Displaying Retailers -->
        <h3>Retailers</h3>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Retailer ID</th>
                    <th>Retailer Name</th>
                    <th>Email</th>
                    <th>Contact No</th>
                    <th>Address</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Retailer> retailers = (List<Retailer>) request.getAttribute("retailers");
                    if (retailers != null && !retailers.isEmpty()) {
                        for (Retailer retailer : retailers) {
                %>
                <tr>
                    <td><%= retailer.getRetailerId() %></td>
                    <td><%= retailer.getRetailerName() %></td>
                    <td><%= retailer.getRetailerEmail() %></td>
                    <td><%= retailer.getContactNo() %></td>
                    <td><%= retailer.getAddress() %></td>
                    <td><%= retailer.getStatus() != null ? retailer.getStatus() : "Unknown" %></td>
                    <td>
                        <form method="post" action="toggleBlockRetailer">
                            <input type="hidden" name="retailerId" value="<%= retailer.getRetailerId() %>">
                            <button type="submit" class="btn <%= retailer.getStatus() != null && retailer.getStatus().equals("Blocked") ? "btn-success" : "btn-danger" %>">
                                <%= retailer.getStatus() != null && retailer.getStatus().equals("Blocked") ? "Unblock" : "Block" %>
                            </button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No retailers available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

<% } else { %>
    <!-- Redirect to Admin Login if not logged in -->
    <script>
        window.location.href = "admin-login.jsp";
    </script>
<% } %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
