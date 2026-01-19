import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/space_db", "root", "1234");

            // 1. Get user email from id
            PreparedStatement ps1 = conn.prepareStatement("SELECT email FROM users WHERE id = ?");
            ps1.setInt(1, id);
            ResultSet rs = ps1.executeQuery();

            String email = null;
            if (rs.next()) {
                email = rs.getString("email");
            }

            if (email != null) {
                // 2. Delete all bookings for this user
                PreparedStatement ps2 = conn.prepareStatement("DELETE FROM bookings WHERE user_email = ?");
                ps2.setString(1, email);
                ps2.executeUpdate();

                // 3. Now delete user
                PreparedStatement ps3 = conn.prepareStatement("DELETE FROM users WHERE id = ?");
                ps3.setInt(1, id);
                ps3.executeUpdate();

                response.sendRedirect("viewAllUsers.jsp");
            } else {
                out.println("<h3>User not found.</h3>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }
}