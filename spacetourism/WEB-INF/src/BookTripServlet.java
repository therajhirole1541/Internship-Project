import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/BookTripServlet")
public class BookTripServlet extends HttpServlet {

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/space_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234"; // adjust as needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Validate session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get data
        String userEmail = (String) session.getAttribute("userEmail");
        String destination = request.getParameter("destination");
        String tripDate = request.getParameter("tripDate");

        // Default status
        String status = "Booked";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO bookings (user_email, destination, trip_date, status) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, userEmail);
                    stmt.setString(2, destination);
                    stmt.setString(3, tripDate);
                    stmt.setString(4, status);

                    stmt.executeUpdate();
                }
            }

            // Success message
            String confirmation = " Booking confirmed for " + userEmail +
                    " to " + destination + " on " + tripDate + ".";

            request.setAttribute("message", confirmation);
            request.getRequestDispatcher("bookingSuccess.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", " Database error: " + e.getMessage());
            request.getRequestDispatcher("bookingError.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("bookTrip.jsp");
    }
}
