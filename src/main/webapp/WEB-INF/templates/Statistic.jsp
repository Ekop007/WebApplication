<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="css/Style.css" rel="stylesheet">
    <link href="css/Menu.css" rel="stylesheet">
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
    <title>Расходы</title>
</head>
<body class="menu">
    <header>
        <div id="header_h">
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto"> +
                        <li class="nav-item"><a class="nav-link" href="Score.jsp?menuId=1">Список счетов<span class="sr-only">(current)</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="Templates.jsp?menuId=2">Шаблоны оплаты<span class="sr-only">(current)</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="Statistic.jsp?menuId=3">Статистика расходов<span class="sr-only">(current)</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="SartPage.html?menuId=4" onclick="Exit()">Выйти<span class="sr-only">(current)</span></a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <div class="container">
        <div class="row" style="text-align: center">
            <div class="col" style="text-align: center">
                <h3 style="text-align: center"> Таблица расходов </h3>
            </div>
        </div>
        <div class="row" style="text-align: center">
            <div class="col" style="border-style: outset ;border-right: #434855; background-color: cadetblue">
                <h4> Откуда </h4>
            </div>
            <div class="col" style="border-style: outset ;border-right: #434855; border-left: #434855; background-color: cadetblue">
                <h4> Куда </h4>
            </div>
            <div class="col" style="border-style: outset ;border-left: #434855; background-color: cadetblue">
                <h4> Сколько </h4>
            </div>
        </div>
        <div class="table-form">
            <c:forEach items="${transactions}" var="transaction">
                <div class="row">
                    <div class="col">  <!-- <img src="'+money[tran.from].url + '" alt = ""> -->
                         <h5>${transaction.}</h5>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>