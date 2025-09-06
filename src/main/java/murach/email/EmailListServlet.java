package murach.email;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import murach.business.User;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) 
                         throws ServletException, IOException {

        String url = "/index.jsp";

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // perform action and set URL
        if (action.equals("join")) {
            url = "/index.jsp";
        }
        else if (action.equals("add")) {                
            // get parameters from the request
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");

            // store data in User object
            User user = new User();
            user.setEmail(email);
            user.setFirstName(firstName);
            user.setLastName(lastName);

            // set current date as request attribute
            request.setAttribute("currentDate", new Date());

            // add user to session users list
            HttpSession session = request.getSession();
            List<User> users = (List<User>) session.getAttribute("users");
            if (users == null) {
                users = new ArrayList<>();
            }
            users.add(user);
            session.setAttribute("users", users);

            // set User object in session
            session.setAttribute("user", user);

            url = "/thanks.jsp";
        }
        
        // forward request
        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);
    }    

    @Override
    protected void doGet(HttpServletRequest request, 
                         HttpServletResponse response) 
                         throws ServletException, IOException {
        doPost(request, response);
    }    
}