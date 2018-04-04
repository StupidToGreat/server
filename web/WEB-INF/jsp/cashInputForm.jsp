<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>직접입력</title>
    <!-- plugins:css -->
    <link rel="stylesheet"
          href="../../node_modules/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet"
          href="../../node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../css/cash.css">
    <link rel="stylesheet" href="../../css/semanticCalendar.css">
    <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
    <!-- endinject -->
    <link rel="stylesheet" type="text/css"
          href="../semantic/components/icon.css">

    <link rel="shortcut icon" href="../images/favicon.png"/>
    <link rel="stylesheet" href="../../css/icon.css"/>
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
                <form class="ui form sobiForm" action="/cashInput.do">
                    <h4 class="ui dividing header">소비 입력정보</h4>
                    <div class="field">
                        <label>날짜</label>
                        <div class="ui calendar" id="example1">
                            <div class="ui input left icon">
                                <i class="calendar icon"></i>
                                <input type="text" name="date" placeholder="날짜/시간">
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>금액</label>
                        <input type="number" name="balance" placeholder="금액">
                    </div>
                    <div class="field">
                        <label>소비처</label>
                        <input type="text" name="brand" placeholder="소비처">
                    </div>

                    <div class="ui tablet stackable steps">
                        <div class="step">
                            <i class="hand pointer icon"></i>
                            <div class="content">
                                <div class="title">첫번째</div>
                                <div class="description">처음 고를 카테고리</div>
                            </div>
                        </div>
                        <div class="step">
                            <i class="hand peace icon"></i>
                            <div class="content">
                                <div class="title">두번째</div>
                                <div class="description">월간 보고서를 위한 카테고리</div>
                            </div>
                        </div>
                        <div class="step">
                            <i class="flag icon"></i>
                            <div class="content">
                                <div class="title">세번째</div>
                                <div class="description">마지막 세부 카테고리</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="field col-sm-3">
                            <label>카테고리 정보1</label>
                            <select id="menu1" name="cate1">
                            </select>
                        </div>
                        <div class="field col-sm-3" style="margin-left: 80px;">
                            <label>카테고리 정보2</label>
                            <select id="menu2" required="required" name="cate2">
                            </select>
                        </div>
                        <div class="field col-sm-3" style="margin-left: 80px;">
                            <label>카테고리 정보3</label>
                            <select id="menu3" name="cate3">
                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <label>소비방식</label>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="means">
                            <div class="default text">소비방식</div>
                            <i class="dropdown icon"></i>
                            <div class="menu">
                                <div class="item" data-value="cash">
                                    <i class="money icon"></i> 현금
                                </div>
                                <div class="item" data-value="check">
                                    <i class="amex icon"></i> 체크카드
                                </div>
                                <div class="item" data-value="credit">
                                    <i class="credit card alternative icon"></i> 신용카드
                                </div>
                                <div class="item" data-value="phone">
                                    <i class="call icon"></i> 휴대폰 간편결제
                                </div>
                                <div class="item" data-value="bank">
                                    <i class="desktop icon"></i> 은행 계좌이체
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="field submitbtnDiv">
                        <button class="ui grey basic button submitBtn" type="submit">저장</button>
                    </div>
                </form>
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
<!-- plugins:js -->
<script src="../../node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="../../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script
        src="../../node_modules/perfect-scrollbar/dist/js/perfect-scrollbar.jquery.min.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->

<!-- End plugin js for this page-->
<!-- inject:js -->

<!-- endinject -->
<!-- Custom js for this page-->
<script type="text/javascript" src="../../js/semanticCalendar.js"></script>
<script src="../../js/cashInputForm.js?version=1"></script>
<!-- End custom js for this page-->
<script>
    $('#example1').calendar();
    $('.ui.dropdown').dropdown();
</script>
</body>

</html>
