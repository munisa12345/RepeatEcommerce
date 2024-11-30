package uz.pdp.repeatecommerce.servlets;


import uz.pdp.repeatecommerce.DB;
import uz.pdp.repeatecommerce.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        Optional<User> userOptional = DB.USERS.stream()
                .filter(user -> user.getPhone().equals(phone) && user.getPassword().equals(password))
                .findFirst();

        if (userOptional.isPresent()) {
            User currentUser = userOptional.get();
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", currentUser);

            if ("ADMIN".equals(currentUser.getRole())) {
                resp.sendRedirect("/adminPage.jsp");
            } else {
                resp.sendRedirect("/categories.jsp");
            }
        }
    }
}
