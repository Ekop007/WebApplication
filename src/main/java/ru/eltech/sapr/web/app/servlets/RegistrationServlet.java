package ru.eltech.sapr.web.app.servlets;
import ru.eltech.sapr.web.app.exception.UserServiceException;
import ru.eltech.sapr.web.app.model.User;
import ru.eltech.sapr.web.app.model.MoneyBagType;
import ru.eltech.sapr.web.app.model.UserType;
import ru.eltech.sapr.web.app.service.MoneyBagService;
import ru.eltech.sapr.web.app.service.UserService;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/Registered.jsp")
public class RegistrationServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        if (req.getAttribute("Err") != null)
        {
            requestDispatcher = req.getRequestDispatcher("Registered.jsp");
        }
        else {
            requestDispatcher = req.getRequestDispatcher("Statistic.jsp");
        }
        requestDispatcher.forward(req, resp);
    }


        @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserService service = (UserService) getServletContext().getAttribute(UserService.SERVICE_NAME);
            String login = req.getParameter("login");
            String email = req.getParameter("email");
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            String pass1 = req.getParameter("pass1");
            String pass2 = req.getParameter("pass2");
            if (pass1 == pass2)
            {
                List<User> result1 = service.getUsers().stream()
                        .filter(user -> user.getLogin().contains(login))
                        .collect(Collectors.toCollection(ArrayList::new));
                List<User> result2 = service.getUsers().stream()
                        .filter(user -> user.getEmail().contains(email))
                        .collect(Collectors.toCollection(ArrayList::new));
                if (result1.isEmpty() && result2.isEmpty())
                {
                    User user = service.createUser(name, surname, email, pass1, UserType.User, login);
                    req.setAttribute("UserId", user.getId());
                }
                else
                {
                    if (!result1.isEmpty())
                    {
                        req.setAttribute("LoginErr", 1);
                    }
                    if (!result2.isEmpty())
                    {
                        req.setAttribute("EmailErr", 1);
                    }
                    req.setAttribute("Error", 1);
                }
            }
            else
            {
                req.setAttribute("PassErr", 1);
                req.setAttribute("Error", 1);
            }
            doGet(req, resp);
        } catch (UserServiceException e) {
            resp.sendError(500, "Unable to create contact");
        }

    }

}
