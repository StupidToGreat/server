<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>공공비교</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../node_modules/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/icon.css">
    <link rel="stylesheet" href="../../css/ggongChart.css?version=2">
    <link rel="stylesheet" href="../../css/semantic.css">
    <link rel="stylesheet" href="../../css/fonts">
    <!-- endinject -->
    <link rel="shortcut icon" href="../images/favicon.png"/>
    <script
            src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
</head>

<body>
<div class="container-scroller">
    <jsp:include page="partial/navbar.jsp"/>
    <div class="container-fluid page-body-wrapper">
        <div class="row row-offcanvas row-offcanvas-right">
            <jsp:include page="partial/sidebar.jsp"/>
            <div class="content-wrapper" align="center">
                <h4 class="ui horizontal divider header">
                    <i class="bar chart icon"></i>
                    공공 데이터 비교
                </h4>
                <div class="col-lg-8 grid-margin stretch-card" align="center" id="ggongDiv">
                    <canvas id="ggongChart" style="height:230px"></canvas>
                </div>
                <div class="col-lg-8" style="text-align: right">
                    2016년 공공데이터 20대 - 60대 기준
                </div>
                <div class="col-lg-8 grid-margin stretch-card sobiListDiv">


                    <table class="ui table" id="ggongTable">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>

            </div>
            <jsp:include page="partial/footer.jsp"/>
        </div>
    </div>
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
<script src="../../js/ggongChart.js?version=4"></script>
<!-- End custom js for this page-->
</body>

</html>
