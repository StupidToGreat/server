<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../node_modules/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="../../node_modules/font-awesome/css/font-awesome.min.css"/>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../../images/favicon.png"/>

    <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase-app.js"></script>
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

        function isASCII(str) {
            return /^[\x21-\x7F]*$/.test(str);
        }

        $(document).ready(function () {
            var memberPwd;
            $('#memberPwd').blur(function () {
                memberPwd = $('#memberPwd').val();
                if(!isASCII(memberPwd)) {
                    alert('특수문자,숫자,영문 대소문자를 모두 포함해서 6글자 이상 입력해주세요')
                }
            });

            $('#pwd_ok').blur(function () {
                if (memberPwd === $('#pwd_ok').val()) {
                    $('#pwd_check').html('비밀번호 일치')
                } else {
                    $('#pwd_check').html('비밀번호 불일치')
                }
            });

            $('#btn_register').click(function () {
                var arr = ['memberId', 'memberPwd', 'memberName', 'year', 'month', 'day', 'memberPhonenum', 'memberBudget'];
                $.each(arr, function (i, val) {
                    if ($('#' + val).val() == '') {
                        alert('모든 사항을 기입해주세요');
                        $('#' + val).focus();
                        return;
                    }
                })

                var memberId = $('#memberId').val();
                var memberPwd = $('#memberPwd').val();

                firebase.auth().createUserWithEmailAndPassword(memberId, memberPwd)
                    .then(function () {
                        post_to_url('/register.do', {
                            'memberId': memberId,
                            'memberPwd': memberPwd,
                            'memberName': $('#memberName').val(),
                            'memberGender': $("input[name='memberGender']").val(),
                            'memberPhonenum': $('#memberPhonenum').val(),
                            'memberBudget': $('#memberBudget').val(),
                            'year': $('#year').val(),
                            'month': $('#month').val(),
                            'day': $('#day').val(),
                        });
                    })
                    .catch(function (error) {
                        // Handle Errors here.
                        var errorCode = error.code;
                        var errorMessage = error.message;
                        alert(errorMessage);
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
    <style>
        .iconDiv{
            margin-top: 13px;
        }
        .genderDiv{

            margin-top: -11px;
        }
    </style>
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper">
        <div class="row">
            <div class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages">
                <div class="card col-lg-5 mx-auto">
                    <div class="card-body px-5 py-5">
                        <h3 class="card-title text-left mb-3">회원가입</h3>
                        <label>이름</label>
                        <div class="form-group row">
                            <div class="col-sm-6">
                                <input type="text" class="form-control p_input" id="memberName" placeholder="이름">
                            </div>
                            <div class="col-sm-3 genderDiv">
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <div class="form-radio">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="memberGender"
                                                       id="Female"
                                                       value="0"
                                                       checked>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 iconDiv" >
                                        <i class="mdi mdi-human-female"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 genderDiv">
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <div class="form-radio">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="memberGender"
                                                       id="Male"
                                                       value="1">
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 iconDiv">
                                        <i class="mdi mdi-human-male"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>아이디</label>
                            <div class="input-group col-xs-12">
                                <input type="email" class="form-control p_input" id="memberId"
                                       placeholder="메일주소를 입력하세요">
                                <%--<span class="input-group-btn">--%>
                                <%--<button class="btn btn-info" type="button" id="dup_check">중복확인</button>--%>
                                <%--</span>--%>
                            </div>
                            <p id="dup_result"></p>
                        </div>
                        <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" class="form-control p_input" id="memberPwd"
                                   placeholder="비밀번호를 입력하세요 (6자 이상)">
                        </div>
                        <div class="form-group">
                            <label>비밀번호 확인</label>
                            <input type="password" class="form-control p_input" id="pwd_ok"
                                   placeholder="비밀번호 한번 더 입력해주세요">
                            <p id="pwd_check"></p>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-4 col-form-label">생년월일</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control p_input" placeholder="1999" id="year">
                            </div>
                            <div class="col-md-2">
                                <input type="text" class="form-control p_input" placeholder="1" id="month">
                            </div>
                            <div class="col-md-2">
                                <input type="text" class="form-control p_input" placeholder="1" id="day">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>전화번호</label>
                            <input type="text" class="form-control p_input" id="memberPhonenum"
                                   placeholder="XXX-XXXX-XXXX">
                        </div>
                        <div class="form-group">
                            <label>월 목표금액</label>
                            <div class="input-group">
                                    <span class="input-group-addon bg-primary text-white"><i
                                            class="fa fa-krw"></i> </span>
                                <input type="text" class="form-control" id="memberBudget"
                                       placeholder="목표금액을 설정해주세요"
                                       aria-label="Amount (to the nearest dollar)">
                                <span class="input-group-addon bg-primary border-primary text-white">원</span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <button class="btn btn-primary col mr-2" id="btn_register">가입</button>
                            <button type="reset" class="btn btn-danger col">취소</button>
                        </div>
                        <p class="sign-up text-center">회원이신가요?<a href="/loginForm.do">로그인</a></p>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->

<script src="../../node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="../../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../../node_modules/perfect-scrollbar/dist/js/perfect-scrollbar.jquery.min.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="../../js/off-canvas.js"></script>
<script src="../../js/misc.js"></script>
<!-- endinject -->
</body>

</html>
