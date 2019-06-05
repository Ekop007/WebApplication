<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="css/Style.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <title>Регистрация</title>
</head>

<body bgcolor="green">
<div class="container">
    <br>
    <div class="container">
        <form class="form-signin">
            <div class="row">
                <div class="col"> <br> <br> <br> </div>
            </div>
            <div class="row">
                <div class="col"></div>
                <div class="card">
                    <article class="card-body">
                        <h4 class="card-title text-center mb-4 mt-1"> Регистрация </h4>
                        <hr>
                        <form id="registration_form" method="post">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <input name="name" class="form-control" placeholder="Введите имя" type="text" required>
                                </div> <!-- input-group.// -->
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <input name="surname" class="form-control" placeholder="Введите фамилию" type="text" required>
                                </div> <!-- input-group.// -->
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <% if (request.getAttribute("LoginErr") != null && (int)request.getAttribute("LoginErr") > 0)
                                    {
                                        out.println("<input name=\"login\" class=\"form-control\" placeholder=\"Данный логин занят\" type=\"text\" required>");
                                    }
                                    else
                                    {
                                        out.println("<input name=\"login\" class=\"form-control\" placeholder=\"Придумайте логин\" type=\"text\" required>");
                                    } %>
                                </div> <!-- input-group.// -->
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class=" fa fa-envelope"></i> </span>
                                    </div>
                                   <!-- <input name="email" class="form-control" placeholder="Введите email" type="email" required>-->
                                    <% if (request.getAttribute("LoginErr") != null && (int)request.getAttribute("EmailErr") > 0)
                                    {
                                        out.println("<input name=\"login\" class=\"form-control\" placeholder=\"Данный почтовый адрес занят\" type=\"text\" required>");
                                    }
                                    else
                                    {
                                        out.println("<input name=\"login\" class=\"form-control\" placeholder=\"Введите email\" type=\"text\" required>");
                                    } %>
                                </div> <!-- input-group.// -->
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input name="pass1" class="form-control" placeholder="Придумайте пароль" type="password">
                                </div> <!-- input-group.// -->
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input name="pass2" class="form-control" placeholder="Повторите пароль" type="password">
                                </div> <!-- input-group.// -->
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <button name="regSubmit" type="submit" class="btn btn-primary btn-block" value="active"> Регистрация  </button>
                            </div> <!-- form-group// -->
                            <p class="text-center"> Есть аккаунт? <br><a href="/Sing" class="btn"> Войти </a></p>
                        </form>
                    </article>
                </div> <!-- card.// -->
                <div class="col"></div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
