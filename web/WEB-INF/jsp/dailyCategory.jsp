<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>카테고리 일별</title>
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
    <link rel="stylesheet" href="../../css/semantic.css">
    <link rel="stylesheet" href="../../css/daily3.css?version=2">
    <!-- endinject -->
    <link rel="shortcut icon" href="../images/favicon.png"/>
    <style type="text/css">
    </style>
</head>
<body>
<input type="hidden" id="day" value=${day}>
<input type="hidden" id="userPhone" value=${member.memberPhonenum}>
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
                <div class="row chartDiv ">
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body" style="background-color: #fff;">
                                <canvas id="barChart"
                                        style="height: 250px; background-color: #fff;"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body" style="background-color: #fff;">
                                <canvas id="pieChart"
                                        style="height: 250px; background-color: #fff;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${manjokCheck == 0}">
                        <div id="manjokDiv" class="col-lg-12 grid-margin ui info message">
                            <center>
                                <span name="manjoktxt"></span><br>
                                <span class="manjoktxt2"> 오늘 하루 ${member.memberName}님의 소비는 몇점이신가요? </span><br>
                                <div class="ui star huge rating" id="ratingDiv"></div><br>
                                <button class="ui blue basic button" id="ratingBtn">점수주기</button>
                            </center>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div id="manjokDiv2"
                             class="col-lg-12 grid-margin ui info message">
                            <center>
                                <span name="manjoktxt"></span><br>
                                <span class="manjoktxt2"> 오늘 하루 ${member.memberName}님의 소비 점수 </span><br>
                                <div class="ui star huge rating" id="ratingfin" data-rating="${manjokScore}"></div><br>
                            </center>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div id="cateSelectDiv">
                    <select id="cateSelect">
                        <option value="all">전체보기</option>
                        <option value="eatout">외식</option>
                        <option value="market">마켓/편의점</option>
                        <option value="shop">쇼핑</option>
                        <option value="trans">교통</option>
                        <option value="life">생활비</option>
                        <option value="interest">문화생활</option>
                        <option value="etc">기타</option>
                    </select>
                </div>
                <br>
                <div class="col-lg-12 grid-margin stretch-card" id="sobiListDiv">
                    <table class="ui cell table" id="sobiListTable">
                        <thead>
                        <tr>
                            <th align="center">카테고리</th>
                            <th align="center">날짜</th>
                            <th align="center">소비처</th>
                            <th align="center">금액</th>
                            <th align="center">결제수단</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
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
<!-- plugins:js -->
<script src="../../node_modules/jquery/dist/jquery.min.js"></script>
<script src="../../node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="../../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script
        src="../../node_modules/perfect-scrollbar/dist/js/perfect-scrollbar.jquery.min.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="../../node_modules/chart.js/dist/Chart.min.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="../../js/off-canvas.js"></script>
<script src="../../js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="../../js/daily4.js?version=2"></script>
<script src="../../js/semantic.js"></script>
<script>
    $('.ui.rating').rating({
        initialRating: 0,
        maxRating: 5
    });

    $('#ratingfin').rating('disable');

    $('.ui.dropdown').dropdown();
</script>
</body>

</html>
