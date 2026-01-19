<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Users</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #333; text-align: left; }
        th { background-color: #f2f2f2; }
        .btn {
            padding: 6px 12px;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }
        .add-btn {
            background-color: green;
            margin-bottom: 10px;
            text-decoration: none;
            color: white;
            padding: 8px 14px;
            border-radius: 4px;
            display: inline-block;
        }
        .delete-btn {
            background-color: red;
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <h2>All Registered Users</h2>

    <a href="register.html" class="add-btn">➕ Add User</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/space_db", "root", "1234");

                String sql = "SELECT * FROM users";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int id = rs.getInt("id");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("password") %></td>
            <td>
                <form action="DeleteUserServlet" method="post" onsubmit="return confirm('Are you sure to delete this user?');">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="submit" class="btn delete-btn" value="🗑 Delete">
                </form>
            </td>
        </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>