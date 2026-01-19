import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/startTrip")
public class StartTripServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Example: Normally this data would come from DB
        List<String> bookerNames = new ArrayList<>();
        bookerNames.add("Alice");
        bookerNames.add("Bob");
        bookerNames.add("Charlie");
        bookerNames.add("Diana");
        bookerNames.add("Ethan");

        // Check if at least 5 bookings
        boolean canStart = bookerNames.size() >= 5;

        // Pass data to JSP
        request.setAttribute("bookerNames", bookerNames);
        request.setAttribute("canStart", canStart);

        RequestDispatcher rd = request.getRequestDispatcher("startTrip.jsp");
        rd.forward(request, response);
    }
}
