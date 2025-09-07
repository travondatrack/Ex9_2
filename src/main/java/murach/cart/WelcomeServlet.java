package murach.cart;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class WelcomeServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, 
                        HttpServletResponse response)
                        throws ServletException, IOException {
        
        // Check for existing cookie
        Cookie[] cookies = request.getCookies();
        boolean hasVisited = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("firstName")) {
                    hasVisited = true;
                    request.setAttribute("firstName", cookie.getValue());
                    break;
                }
            }
        }
        
        if (!hasVisited) {
            // Set a default first name for demo purposes
            Cookie firstName = new Cookie("firstName", "Guest");
            firstName.setMaxAge(60 * 60 * 24 * 365); // 1 year
            firstName.setPath("/");
            response.addCookie(firstName);
            request.setAttribute("firstName", "Guest");
            request.setAttribute("isFirstVisit", true);
        } else {
            request.setAttribute("isFirstVisit", false);
        }
        
        String url = "/welcome.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response)
                         throws ServletException, IOException {
        doGet(request, response);
    }
}
