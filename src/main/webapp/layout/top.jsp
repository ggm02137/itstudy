
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>오이마켓</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
          crossorigin="anonymous">

    <!--datables-->
    <link rel = "stylesheet"
          href="//cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">

    <style>
        body {
            margin-top: 100px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-success fixed-top">
    <a class="navbar-brand" href="#">오이마켓</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value='/' />main/main.jsp">홈
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/' />board/list.jsp">우리동네</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/' />board/chat.jsp">채팅</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/' />user/list.jsp">마이페이지</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <span class="navbar-text">
      			<a href="<c:url value='/' />auth/profile.jsp"><%=id%></a>
      			<a href="<c:url value='/' />logout" class="btn btn-danger btn-sm ml-3">로그아웃</a>
    		</span>
    </div>
</nav>
