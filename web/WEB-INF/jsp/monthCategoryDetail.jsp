<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>카테고리 월별 상세정보</title>
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
    <link rel="stylesheet" href="../../css/monthCategoryDetail.css">
    <!-- endinject -->
    <link rel="stylesheet" type="text/css" href="../../css/semantic.css">
    <link rel="shortcut icon" href="../images/favicon.png"/>
    <script
            src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container-scroller">
    <input type="hidden" id="year" value=${year}>
    <input type="hidden" id="month" value=${month}>
    <input type="hidden" id="cate" value=${cate}>
    <!-- partial:../../partials/_navbar.html -->
    <jsp:include page="partial/navbar.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <div class="row row-offcanvas row-offcanvas-right">
            <!-- partial:../../partials/_sidebar.html -->
            <jsp:include page="partial/sidebar.jsp"/>
            <!-- partial -->
            <div class="content-wrapper">
                &nbsp;
                <span class="ui teal sum_span" id="headcate">
                </span>
                &nbsp;
                <div class="col-lg-9 grid-margin piechart">
                    <div class="card">
                        <div class="card-body" style="background-color: #F6F8FA;">
                            <canvas id="pieChart"
                                    style="height: 250px; background-color: #F6F8FA;"></canvas>
                        </div>
                    </div>
                </div>


                <div style="margin-left: 150px;">
                    <div class="ui mini statistic" style="margin-left: 120px;">
                        <div class="value">
                            이번 달 <span class="cate_span" id="cateName"></span> 소비는
                            <span class="teal sum_span" id="sum"></span>원입니다
                        </div>
                    </div>
                    <div class="ui large statistics" style="margin-left: -60px;">
                        <div class="grey statistic">
                            <div class="label">
                                많이 이용한 요일
                            </div>
                            <div class="value" id="day"></div>
                        </div>
                        <div class="grey statistic">
                            <div class="label">
                                많이 이용한 시간
                            </div>
                            <div class="value" id="hour"></div>
                            <div class="label">
                                시
                            </div>
                        </div>
                        <div class="grey statistic">
                            <div class="label">
                                총 이용 횟수
                            </div>
                            <div class="value" id="count"></div>
                            <div class="label">
                                회
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 grid-margin stretch-card sobiListDiv">
                    <table class="ui table" id="sobiTable" style="margin: auto; text-align: center">
                        <thead>
                        <tr>
                            <th>소비처</th>
                            <th>금액</th>
                            <th>날짜</th>
                            <th>카테고리</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
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
<script src="../../node_modules/perfect-scrollbar/dist/js/perfect-scrollbar.jquery.min.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="../../node_modules/chart.js/dist/Chart.min.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="../../js/off-canvas.js"></script>
<script src="../../js/misc.js"></script>
<script src="../../js/semantic.js"></script>

<!-- endinject -->
<!-- Custom js for this page-->
<script src="../../js/monthCategoryDetail.js?version=1"></script>
<!-- End custom js for this page-->
</body>

</html>
