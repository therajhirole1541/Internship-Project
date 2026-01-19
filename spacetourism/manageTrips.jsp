<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Trips - Space Tourism Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #eef2f7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px 30px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .top-button {
            text-align: right;
            margin-bottom: 15px;
        }

        .top-button a {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .top-button a:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: center;
            font-size: 15px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        input[type=submit] {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 7px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type=submit]:hover {
            background-color: #c82333;
        }
    </style>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this trip?");
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Manage Space Tourism Trips</h2>


    <table>
        <tr>
            <th>ID</th>
            <th>User Email</th>
            <th>Destination</th>
            <th>Trip Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/space_db", "root", "1234");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM bookings");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("user_email") %></td>
            <td><%= rs.getString("destination") %></td>
            <td><%= rs.getString("trip_date") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <form action="DeleteTripServlet" method="post" onsubmit="return confirmDelete();">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</div>

</body>
</html>