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
    <link rel="stylesheet" type="text/css" href="../../css/icon.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/semantic.css">
    <link rel="stylesheet" type="text/css" href="../../css/header.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/grid.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/divider.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/progress.css"/>
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
                <%--<h2 class="ui icon header">--%>
                <%--<i class="money bill alternate icon"></i>--%>
                <div class="content">
                    <h1>Stupid To Great</h1>
                    <div class="sub header">소비를 자동으로 분류해 드릴테니, 만족평가만 해주세요!</div>
                </div>

                <div class="wrapper" style="width: 50%" id="progressDiv">
                </div>
                <div class="column" id="progressMent"></div>


                <br>
                <div class="ui vertical stripe quote segment">
                    <div class="ui equal width stackable internally celled grid">
                        <div class="center aligned row">
                            <div class="column">
                                <h3>"오늘 소비는 만족스러웠나요?"</h3>
                                <p>불필요한 지출을 줄이고, <b>만족</b>스러운 소비만 해요</p>
                                <c:set var="now" value="<%=new java.util.Date()%>"/>
                                <c:set var="sysDay"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
                                <a class="ui primary small button" tabindex="0" href="/dailyCategory.do?day=${sysDay}">
                                    오늘의 소비
                                </a>
                            </div>
                            <div class="column">
                                <h3>"소비를 테마별로 만들었어요"</h3>
                                <p>
                                    카테고리별로 봤다면, 이젠 <b>즐겁게</b> 내 소비를 분석해 봤습니다!
                                </p>
                                <a class="ui primary small button" tabindex="0" href="/monthlyReport.do">
                                    월간 레포트
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
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
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">SNS 소비트랜드</h4>
                                <img class="ui medium rounded image" src="../../images/sns/twitter_bird.png"><br>
                                <div class="column">
                                    <h3>"SNS에서 트랜드를 찾았어요"</h3>
                                    <p>
                                        내가 소비한 카테고리가 SNS에서 어떤 단어로 <b>검색</b>이 많이 되었을까요
                                    </p>
                                    <a class="ui red small button" tabindex="0" href="/snsTrend.do">
                                        <i class="heart icon"></i> Trend
                                    </a>
                                </div>
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
<script src="../../js/dashboard.js"></script>
<!-- endinject -->
<script type="text/javascript">
    var currentSobis = [];
    var beforeSobis = [];

    $(document).ready(function () {
        var dt = new Date();
        var year = dt.getFullYear();
        var month = dt.getMonth() + 1;
        var param = "year=" + year + "&month=" + month;

        $.ajax({
            url: 'getMonthlyList.do',
            data: param,
            dataType: 'json',
            success: function (data) {
                if (data.sobiList != null) {
                    $.each(data.sobiList, function (index, item) {
                        currentSobis.push(item.sobiBalance);
                    });
                    $.each(data.sobiBefore, function (index, item) {
                        beforeSobis.push(item.sobiBalance);
                    });
                    var ctx = document.getElementById("canvas").getContext("2d");
                    new Chart(ctx, config)
                } else {
                    currentSobis.push(0);
                }
            }
        });

        $.ajax({
            url: 'budgetProgress.do',
            data: param,
            type: "post",
            dataType: 'json',
            success: function (data) {
                $('#progressDiv').empty();
                $('#progressMent').empty();

                var per = 0;
                var sumSobi = 0;
                var budget = 0;


                $.each(data, function (index, item) {
                    budget = item.budget;
                    sumSobi = item.sumSobi;
                });
                sumSobi *= 1;
                budget *= 1;


                if (sumSobi > budget) {
                    if (sumSobi == budget)
                        per = 100;
                    per = 100;
                }
                else {
                    per = String(sumSobi / budget) * 100;
                }
                per = Math.round(per);


//                per에따라 멘트 달라지기
                if (per < 70)
                    $('#progressMent').append(
                        "<p><b>훌륭합니다!</b> 더 아낄 수 있을까요?</p>"
                    );
                else if(per<100)
                    $('#progressMent').append(
                        "<p><b>조심하세요!</b> 지출목표금액에 가까워지고 있어요!</p>"
                    );
                else if(per==100)
                    $('#progressMent').append(
                        "<p><b>으악!!!</b>지출목표금액을 초과했어요!!!!</p>"
                    );


                $('#progressDiv').append(
                    "<div class=\"d-flex justify-content-between\">\n" +
                    "<p class=\"mb-2\">목표 지출금액까지</p>\n" +
                    "<p class=\"mb-2 text-primary\">" + per +
                    "%</p>\n" +
                    "</div>\n" +
                    "<div class=\"progress\">\n" +
                    "<div class=\"progress-bar bg-danger progress-bar-striped progress-bar-animated\" role=\"progressbar\" style=\"width: "
                    + per + "%\" aria-valuenow=\"" + per + "\"\n" +
                    "aria-valuemin=\"0\" aria-valuemax=\"100\"></div>\n" +
                    "</div>"
                )
            }
        });

        $('.rapid.example .ui.button')
            .on('click', function () {
                var
                    $progress = $('.rapid.example .ui.progress'),
                    $button = $(this),
                    updateEvent
                ;
                // restart to zero
                clearInterval(window.fakeProgress)
                $progress.progress('reset');
                // updates every 10ms until complete
                window.fakeProgress = setInterval(function () {
                    $progress.progress('increment');
                    $button.text($progress.progress('get value'));
                    // stop incrementing when complete
                    if ($progress.progress('is complete')) {
                        clearInterval(window.fakeProgress)
                    }
                }, 10);
            })
        ;
        $('.rapid.example .ui.progress')
            .progress({
                duration: 200,
                total: 200,
                text: {
                    active: '{value} of {total} done'
                }
            })
        ;

    })
    ;

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
