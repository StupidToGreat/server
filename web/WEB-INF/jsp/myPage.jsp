<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>MY PAGE</title>
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="css/semanticCalendar.css">
    <link rel="stylesheet" href="../../css/icon.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel='stylesheet prefetch'
          href='http://fonts.googleapis.com/css?family=Roboto:400|Roboto+Condensed:400|Fjalla+One:400'>
    <link rel='stylesheet prefetch'
          href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

    <style type="text/css">
        #myPageFrm {
            width: 600px;
            margin: 30px auto;
        }

        #btnDiv {
            width: 600px;
            margin-top: 40px;
            text-align: center;
        }

        #myPageDiv {
            margin-top: 20px;
        }

        #modeDiv {
            width: 700px;
            margin: 0 auto;
            text-align: center;
            margin-top: 20px;
            letter-spacing: -1.3px;
        }
    </style>

    <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase-auth.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
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
            $('#btn_mod').click(function () {
                var user = firebase.auth().currentUser;
                // console.log(user.email);
                var newPassword = $("input[name='memberPwd']").val();
                console.log(newPassword);
                console.log($("input[name='memberBudget']").val());

                user.updatePassword(newPassword).then(function() {
                    post_to_url("/modifyMemberInfo.do", {
                        'memberId': $("input[name='memberId']").val(),
                        'memberPwd': newPassword,
                        'memberBudget': $("input[name='memberBudget']").val(),
                    });
                }).catch(function(error) {
                    alert(error.message);
                });
            });
        });

        function post_to_url(path, params, method) {
            method = method || "post";
            var form = document.createElement("form");
            form.setAttribute("method", method);
            form.setAttribute("action", path);
            for (var key in params) {
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", key);
                hiddenField.setAttribute("value", params[key]);
                form.appendChild(hiddenField);
            }
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <jsp:include page="partial/navbar.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <div class="row row-offcanvas row-offcanvas-right">
            <!-- partial:../../partials/_sidebar.html -->
            <jsp:include page="partial/sidebar.jsp"/>
            <!-- partial -->

            <div class="content-wrapper">
                <div id="myPageDiv">
                    <h4 class="ui horizontal divider header">
                        <i class="tag icon"></i>MY PAGE
                    </h4>
                </div>
                <c:if test="${mode == 1}">
                    <div id="modeDiv">
                        <i class="checkmark box icon"></i> 회원정보를 변경했습니다
                    </div>
                </c:if>
                <form action="/modifyMemberInfo.do"></form>
                <div class="ui form" id="myPageFrm">
                    <div class="field">
                        <label>아이디</label>
                        <input type="text" name="memberId"
                                                  readonly="readonly" value="${member.memberId}">
                    </div>
                    <div class="field">
                        <label>이름</label>
                        <input type="text" name="memberName"
                                                 readonly="readonly" value="${member.memberName}">
                    </div>
                    <div class="field">
                        <label>비밀번호</label>
                        <input type="password" name="memberPwd"
                                                   value="${member.memberPwd}">
                    </div>
                    <div class="field">
                        <label>월 목표금액</label>
                        <input type="number" name="memberBudget"
                                                     value="${member.memberBudget}">
                    </div>
                    <div class="field">
                        <label>전화번호</label>
                        <input type="text" name="memberPhonenum"
                                                   readonly="readonly" value="${member.memberPhonenum}">
                    </div>
                    <div id="btnDiv">
                        <button class="ui button" id="btn_mod">변경</button>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <jsp:include page="partial/footer.jsp"/>
            <!-- partial -->
        </div>
        <!-- row-offcanvas ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- Custom js for this page-->
</body>
</html>
