<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.tools.ant.taskdefs.Local" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>홈</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../node_modules/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="../../css/semantic.css">
    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
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

            <div class="content-wrapper" align="center">
                <br>
                <div class="ui huge purple statistic">
                    <%
                        Date date = new Date();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("EEE", Locale.KOREAN);
                        String koDate = dateFormat.format(date);
                    %>
                    <div class="text value">
                        <%=koDate%>요일<br>
                        나의 소비는
                    </div>
                </div>
                <br><br>

                <div class="ui statistics">
                    <div class="statistic">
                    </div>
                </div>
                <br><br>

                <%--한달 소비그래프--%>
                <div class="row">
                    <div class="col-lg-7 grid-margin stretch-card">
                        <div class="ui card" data-position="top center">
                            <div class="card-body">
                                <h3 class="card-title">전 월 비교</h3>
                                <canvas id="canvas" width="746" height="372" class="chartjs-render-monitor"
                                        style="display: block; height: 186px; width: 373px;"></canvas>
                            </div>
                        </div>
                    </div>
                    <%--SNS 트랜드--%>
                    <div class="col-md-5 stretch-card grid-margin">
                        <div class="card bg-gradient-warning text-white">
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3"># SNS</h4>
                                <%--<h2 class="font-weight-normal mb-5">여기다가 트랜드 붙여</h2>--%>
                                <%--<p class="card-text">꺅</p>--%>
                            </div>
                        </div>
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
<script type="text/javascript">
    var currentSobis = [];
    var beforeSobis = [];

    $(document).ready(function () {
        var dt = new Date();

        $.ajax({
            url: 'getMonthlyList.do',
            data: {
                year: dt.getFullYear(),
                month: dt.getMonth() + 1
            },
            dataType: 'json',
            success: function (data) {
                if (data.sobiList != null) {
                    $.each(data.sobiList, function (index, item) {
                        currentSobis.push(item.sobiBalance);
                    })
                    $.each(data.sobiBefore, function (index, item) {
                        beforeSobis.push(item.sobiBalance);
                    })

                    var ctx = document.getElementById("canvas").getContext("2d");
                    new Chart(ctx, config)
                } else {
                    currentSobis.push(0);
                }
            }
        });

        // $.ajax({
        //     url: 'getMonthlyList.do',
        //     data: {
        //         year: dt.getFullYear(),
        //         month: dt.getMonth()
        //     },
        //     dataType: 'json',
        //     success: function (data) {
        //         if (data.sobiList != null) {
        //             $.each(data.sobiList, function (index, item) {
        //                 beforeSobis.push(item.sobiBalance);
        //             })
        //         } else {
        //             beforeSobis.push(0);
        //         }
        //     }
        // });
    });

    var areaData = {
        labels: [
            "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
            "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
            "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"
        ],
        datasets:
            [{
                label: '이번 달 소비',
                data: currentSobis,
                borderColor: ['rgba(255, 99, 132, 0.5)'],
                backgroundColor: ['rgba(255, 99, 132, 0.5)'],
                borderWidth: 2,
                fill: 'origin', // 0: fill to 'origin'
                fill: '+2', // 1: fill to dataset 3
                fill: 1, // 2: fill to dataset 1
                fill: false, // 3: no fill
                fill: '-2' // 4: fill to dataset 2
            }, {
                label: '저번 달 소비',
                data: beforeSobis,
                borderColor: ['rgba(54, 162, 235, 0.5)'],
                backgroundColor: ['rgba(54, 162, 235, 0.5)'],
                borderWidth: 2,
                fill: false
            }]
    };

    var areaOptions = {
        plugins: {
            filler: {
                propagate: true
            }
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '날짜'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '소비금액'
                }
            }]
        }
    };

    var config = {
        type: 'line',
        data: areaData,
        options: areaOptions
    };

    // window.onload = function () {
    //     var ctx = document.getElementById("canvas").getContext("2d");
    //     window.myLine = new Chart(ctx, config);
    // };

    $('.ui.card')
        .popup({});
    $('.rating')
        .rating('disable')
    ;


</script>
<!-- End custom js for this page-->
</body>

</html>
