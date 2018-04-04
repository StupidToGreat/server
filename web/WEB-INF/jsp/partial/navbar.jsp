<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Insert title here</title>

    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase-auth.js"></script>
    <script type="text/javascript">
        var config = {
            apiKey: "AIzaSyAVL3biib7QX2TfcSodcrzr2mgbayQNTGY",
            authDomain: "stupidtogreat-193305.firebaseapp.com",
            databaseURL: "https://stupidtogreat-193305.firebaseio.com",
            projectId: "stupidtogreat-193305",
            storageBucket: "",
            messagingSenderId: "35285377277"
        };
        firebase.initializeApp(config);
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#logout').click(function () {
                firebase.auth().signOut().then(function () {
                    location.href = "/logout.do";
                }).catch(function (error) {
                    alert(error.message);
                });
            });
        });
    </script>
</head>
<body>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="/main.do">
            <img src="images/logo.png" alt="logo"/>
        </a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <c:if test="${empty id}">
            <div class="navbar-nav navbar-nav-right">
                <a href="/loginForm.do">
                    <i class="mdi mdi-login mr-2 text-primary"></i>로그인
                </a>
            </div>
        </c:if>
        <c:if test="${not empty id}">
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile d-none d-lg-block">
                    <div class="nav-link">${id} 님 환영합니다</div>
                </li>
                <li class="nav-item nav-profile d-none d-lg-block">
                    <a class="nav-link" href="/cashInputForm.do">
                        <i class="mdi mdi-cash mr-2 text-success"></i>직접입력
                    </a>
                </li>
                <li class="nav-item nav-profile d-none d-lg-block">
                    <a class="nav-link" href="/myPageForm.do">
                        <i class="mdi mdi-human mr-2 text-black"></i>MY PAGE
                    </a>
                </li>
                <li class="nav-item nav-logout d-none d-lg-block">
                    <a class="nav-link" id="logout">
                        <i class="mdi mdi-logout mr-2 text-primary"></i>로그아웃
                    </a>
                </li>
            </ul>
        </c:if>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
                type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
        </button>
    </div>
</nav>
</body>
</html>