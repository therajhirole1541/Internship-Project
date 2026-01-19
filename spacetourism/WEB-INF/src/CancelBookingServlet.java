import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
        
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession(false);
        String userEmail = null;

        if (session != null && session.getAttribute("userEmail") != null) {
            userEmail = (String) session.getAttribute("userEmail");
        } else {
            out.println("<script>alert('Please login first');window.location='login.jsp';</script>");
            return;
        }

        String bookingIdStr = req.getParameter("bookingId");

        if (bookingIdStr == null || bookingIdStr.isEmpty()) {
            out.println("<script>alert('Booking ID not provided');window.location='myBooking.jsp';</script>");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            try (Connection conn = DBConnection.getConnection()) {
                PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM bookings WHERE id = ? AND user_email = ?"
                );
                ps.setInt(1, bookingId);
                ps.setString(2, userEmail);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<script>alert('Booking cancelled successfully');window.location='myBooking.jsp';</script>");
                } else {
                    out.println("<script>alert('Booking not found or unauthorized');window.location='myBooking.jsp';</script>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
        doPost(req, res);
    }
}

























