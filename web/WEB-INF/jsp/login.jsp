<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인</title>
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
    <link rel="shortcut icon" href="../images/favicon.png"/>
    <script type="text/javascript">
        function loginCheck() {
            if ($("input[name='id']").val() == '') {
                $("input[name='id']").append("아이디를 써주세요");
                $("input[name='id']").focus();
                return false;
            }
            if ($("input[name='pwd']").val() == '') {
                $("input[name='pwd']").append("비밀번호를 반드시 입력해주세요");
                $("input[name='pwd']").focus();
                return false;
            }
            return true;
        }
    </script>

    <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase-auth.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script src="https://cdn.firebase.com/libs/firebaseui/2.6.0/firebaseui.js"></script>
    <script src="https://www.gstatic.com/firebasejs/ui/2.6.0/firebase-ui-auth__ko.js"></script>
    <link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/2.6.0/firebase-ui-auth.css"/>
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

        $(document).ready(function () {
            $('#btn_login').click(function () {
                var arr = {id: '아이디', pwd: '비밀번호'};
                $.each(arr, function (i, val) {
                    if ($('#' + i).val() == '') {
                        alert(val + '을 입력해주세요');
                        return;
                    }
                })

                var email = $('#id').val();
                var password = $('#pwd').val();

                firebase.auth().signInWithEmailAndPassword(email, password)
                    .then(function (user) {
                        $.ajax({
                            type: 'GET',
                            url: '/login.do',
                            data: {
                                id: user.email
                            },
                            success: function (data) {
                                location.href = '/main.do';
                                // console.log(data.result);
                            },
                            error: function (xhr, status, error) {
                                alert(xhr + '\n' + status + '\n' + error);
                            }
                        });
                    })
                    .catch(function (error) {
                        // Handle Errors here.
                        var errorCode = error.code;
                        var errorMessage = error.message;
                        // alert(error.message);
                        // location.href = '/loginForm.do';
                    });
            })
        });
    </script>

    <script type="text/javascript">
        var uiConfig = {
            callbacks: {
                signInSuccess: function (currentUser, credential, redirectUrl) {
                    $.ajax({
                        type: 'GET',
                        url: '/loginWithSNS.do',
                        data: {
                            email: currentUser.email,
                            name: currentUser.displayName,
                            // gender: currentUser
                        },
                        success: function (data) {
                            location.href = data.url;
                            // console.log(currentUser);
                            // return true;
                            // console.log(data.result);
                        },
                        error: function (xhr, status, error) {
                            alert(xhr + '\n' + status + '\n' + error);
                        }
                    });
                },
                signInFailure: function (error) {
                    return handleUIError(error);
                }
            },
            signInFlow: 'popup',
            signInSuccessUrl: '/loginForm.do',
            signInOptions: [
                // {
                //     provider: firebase.auth.EmailAuthProvider.PROVIDER_ID,
                //     requireDisplayName: false
                // },
                {
                    provider: firebase.auth.GoogleAuthProvider.PROVIDER_ID,
                    scopes: [
                        'https://www.googleapis.com/auth/plus.login',
                        'https://www.googleapis.com/auth/user.birthday.read',
                        'https://www.googleapis.com/auth/plus.me'
                    ],
                    customParameters: {
                        prompt: 'select_account'
                    }
                },
                {
                    provider: firebase.auth.FacebookAuthProvider.PROVIDER_ID,
                    scopes: [
                        'public_profile',
                        'email',
                        'user_likes',
                        'user_friends'
                    ],
                    customParameters: {
                        // Forces password re-entry.
                        auth_type: 'reauthenticate'
                    }
                }
            ],
            // Required to enable one-tap sign-up credential helper.
            credentialHelper: firebaseui.auth.CredentialHelper.GOOGLE_YOLO,
            // Terms of service url.
            tosUrl: '/main.do'
        };

        var ui = new firebaseui.auth.AuthUI(firebase.auth());
        ui.start('#firebaseui-auth-container', uiConfig);
        // ui.disableAutoSignIn();
    </script>
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper">
        <div class="row">
            <div class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages">
                <div class="card col-lg-3.5 mx-auto">
                    <div class="card-body px-5 py-5">
                        <h3 class="card-title text-left mb-3">로그인</h3>
                        <div class="form-group">
                            <label>아이디</label>
                            <input type="text" class="form-control p_input" id="id" placeholder="아이디를 입력해주세요">
                            <p id="login_check"></p>
                        </div>
                        <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" class="form-control p_input" id="pwd" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary btn-block enter-btn" id="btn_login">로그인
                            </button>
                        </div>
                        <div class="form-group row">
                            <div id="firebaseui-auth-container"></div>
                        </div>
                        <p class="sign-up">회원이 아니라면?<a href="/registerForm.do">가입</a></p>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- row ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
</div>
<!-- plugins:js -->
<%--<script src="../node_modules/jquery/dist/jquery.min.js"></script>--%>
<script src="../../node_modules/jquery/dist/jquery.min.js"></script>
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
