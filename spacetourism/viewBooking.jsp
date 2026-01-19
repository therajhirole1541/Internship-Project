<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, String>> bookings = (List<Map<String, String>>) request.getAttribute("bookings");
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Bookings</title>
    <style>
        body {
            background: linear-gradient(to right, #000010, #001133);
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 40px;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background-color: #1a1a40;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.6);
        }

        h2 {
            color: #00ccff;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #444;
        }

        th {
            background-color: #003366;
        }

        .no-bookings {
            text-align: center;
            margin-top: 30px;
            font-size: 18px;
        }

        a, button {
            margin-top: 20px;
            display: inline-block;
            background-color: #00ccff;
            color: black;
            font-weight: bold;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            border: none;
            cursor: pointer;
        }

        a:hover, button:hover {
            background-color: white;
            color: #0a0a23;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>🛰️ My Space Bookings (<%= userEmail %>)</h2>

    <%
        if (bookings != null && !bookings.isEmpty()) {
    %>
        <table>
            <tr>
                <th>Destination</th>
                <th>Trip Date</th>
                <th>Status</th>
            </tr>
            <%
                for (Map<String, String> booking : bookings) {
            %>
            <tr>
                <td><%= booking.get("destination") %></td>
                <td><%= booking.get("tripDate") %></td>
                <td><%= booking.get("status") %></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        } else {
    %>
        <div class="no-bookings">You have no bookings yet.</div>
    <%
        }
    %>

    <!-- Optional: Back to dashboard or book new trip -->
    <a href="bookTrip.jsp">➕ Book Another Trip</a>
</div>

</body>
</html>
