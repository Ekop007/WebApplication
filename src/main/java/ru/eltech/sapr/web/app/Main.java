package ru.eltech.sapr.web.app;
/*

import javax.sql.DataSource;*/
import ru.eltech.sapr.web.app.dao.H2UserDao;
import ru.eltech.sapr.web.app.exception.UserServiceException;
import ru.eltech.sapr.web.app.model.User;
import ru.eltech.sapr.web.app.service.UserService;

import javax.sql.DataSource;
import java.io.IOException;


public class Main
{
    public static void main(String[] args) throws IOException
    {
        DataSource dataSource = ConnectionManager.createDataSource();
        UserService service = new UserService(
                new H2UserDao(dataSource));

        try {

            for (User user : service.getUsers()) {
                System.out.println(user);
            }
        } catch (UserServiceException e) {
            // TODO: log, handle
            System.err.println(e);
        }
    }
}
