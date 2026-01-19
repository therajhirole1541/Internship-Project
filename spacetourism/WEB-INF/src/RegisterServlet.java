import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/space_db", "root", "1234");

            PreparedStatement pst = conn.prepareStatement(
                "INSERT INTO users(name, email, password) VALUES (?, ?, ?)");

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                // ✅ Show success message and redirect using HTML + meta refresh
                out.println("<html><body>");
                out.println("<h3 style='color:green;'>User registered successfully!</h3>");
                out.println("<p>Redirecting to login page in 3 seconds...</p>");
                out.println("<meta http-equiv='refresh' content='3;URL=userlogin.html'/>");
                out.println("</body></html>");
            } else {
                out.println("<h3 style='color:red;'>Registration failed. Try again.</h3>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}