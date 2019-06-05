package ru.eltech.sapr.web.app.servlets;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;
import ru.eltech.sapr.web.app.thymeleaf.TemplateEngineUtil;
import ru.eltech.sapr.web.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class AllUsersServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService service = (UserService) getServletContext().getAttribute(UserService.SERVICE_NAME);

        TemplateEngine engine = TemplateEngineUtil.getTemplateEngine(req.getServletContext());
        WebContext context = new WebContext(req, resp, req.getServletContext());
        context.setVariable("user", service.getUsers());
        engine.process("SartPage.html", context, resp.getWriter());
    }
}
