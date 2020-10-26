<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    // 세션 정보
    String id = (String)session.getAttribute("id");
    Boolean login = (Boolean)session.getAttribute("login");

// 세션이 있는 경우 /main/main.jsp로 페이지 이동
    if (id != null && login) {
        response.sendRedirect("/main/main.jsp");
    }
%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
          crossorigin="anonymous">

    <style>
        .login-box {
            margin-top: 100px;
        }
    </style>
    <title>로그인</title>
</head>
<body>
<div class="container">

    <div class="row justify-content-md-center">
        <div class="col-md-4">

            <div class="card login-box">
                <div class="card-header">
                    로그인
                </div>
                <div class="card-body">
                    <form method="post" action="<c:url value='/' />login" id="loginForm">
                        <div class="form-group">
                            <label>아이디</label>
                            <input type="text" class="form-control" name="id" placeholder="아이디">
                        </div>
                        <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" class="form-control" name="password" placeholder="비밀번호">
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <button type="button" class="btn btn-warning" id="btnLogin">로그인</button>
                    <div class="float-right">
                        <a href="<c:url value='/' />auth/register.jsp">회원가입</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>

<script>
    // 로그인 버튼을 누른 경우
    $('#btnLogin').on('click', function(e) {
        e.preventDefault();

        let id = $.trim( $('input[name="id"]').val() );
        let password = $('input[name="password"]').val();

        if ( !id || id.length < 6 || id.length > 12 ) {
            alert('아이디를 확인해주세요');
            $('input[name="id"]').focus();
            return false;
        }

        if (!password) {
            alert('비밀번호를 확인해주세요');
            $('input[name="password"]').focus();
            return false;
        }

        // 아이디, 비밀번호 전송
        $('#loginForm').submit();
    });
</script>
</body>
</html>
