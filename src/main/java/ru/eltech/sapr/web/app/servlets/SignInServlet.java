package ru.eltech.sapr.web.app.servlets;

import ru.eltech.sapr.web.app.exception.UserServiceException;
import ru.eltech.sapr.web.app.model.MoneyBag;
import ru.eltech.sapr.web.app.model.Transaction;
import ru.eltech.sapr.web.app.model.User;
import ru.eltech.sapr.web.app.model.UserType;
import ru.eltech.sapr.web.app.service.MoneyBagService;
import ru.eltech.sapr.web.app.service.TransactionService;
import ru.eltech.sapr.web.app.service.UserService;

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

@WebServlet("/Sing.jsp")
public class SignInServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        if (req.getAttribute("Err") != null && (int)req.getAttribute("Err") == 1)
        {
            requestDispatcher = req.getRequestDispatcher("Registered.jsp");
        }
        else {
            MoneyBagService mbService = (MoneyBagService) getServletContext().getAttribute(MoneyBagService.SERVICE_NAME);
            TransactionService tService = (TransactionService) getServletContext().getAttribute(TransactionService.SERVICE_NAME);
            List<MoneyBag> moneyBagList = mbService.getMoneyBags((int)req.getAttribute("UserId"));
            List<Transaction> transactionList = tService.getTransaction((int)req.getAttribute("UserId"));
            req.setAttribute("transactions", transactionList);
            req.setAttribute("moneyBags", moneyBagList);
            requestDispatcher = req.getRequestDispatcher("Statistic.jsp");
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserService service = (UserService) getServletContext().getAttribute(UserService.SERVICE_NAME);
            String email_or_login = req.getParameter("email_or_login");
            String password = req.getParameter("password");
            List<User> result1 = service.getUsers().stream()
                    .filter(user -> user.getLogin().contains(email_or_login))
                    .filter(user -> user.getPassword().contains(password))
                    .collect(Collectors.toCollection(ArrayList::new));
            List<User> result2 = service.getUsers().stream()
                    .filter(user -> user.getEmail().contains(email_or_login))
                    .filter(user -> user.getPassword().contains(password))
                    .collect(Collectors.toCollection(ArrayList::new));
            if (result1.isEmpty() && result2.isEmpty())
            {
                req.setAttribute("Err", 1);
            }
            else {
                if (!result1.isEmpty())
                {
                    req.setAttribute("UserId", result1.get(0).getId());
                }
                if (!result2.isEmpty())
                {
                    req.setAttribute("UserId", result2.get(0).getId());
                }
                    req.setAttribute("Error", 0);
            }
            doGet(req, resp);
        } catch (UserServiceException e) {
            resp.sendError(500, "Unable to create contact");
        }

    }
}
