<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession(false);
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    if (username == null) {
        response.sendRedirect("login.jsp?message=Please login first");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Bookings</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>My Space Bookings 🚀</h2>
    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th>
            <th>Destination</th>
            <th>Departure Date</th>
            <th>Seats</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/space_db", "root", "2007");

                String sql = "SELECT * FROM bookings WHERE username=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("destination") %></td>
            <td><%= rs.getString("departure_date") %></td>
            <td><%= rs.getInt("seats") %></td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='4'>Error loading bookings</td></tr>");
            }
        %>
    </
