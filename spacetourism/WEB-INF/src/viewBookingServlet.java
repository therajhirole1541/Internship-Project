package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/ViewBookingServlet")
public class ViewBookingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/space_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");
        List<Map<String, String>> bookings = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT destination, trip_date, status FROM bookings WHERE user_email = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, userEmail);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            Map<String, String> booking = new HashMap<>();
                            booking.put("destination", rs.getString("destination"));
                            booking.put("tripDate", rs.getString("trip_date"));
                            booking.put("status", rs.getString("status"));
                            bookings.add(booking);
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBooking.jsp").forward(request, response);
    }
}
