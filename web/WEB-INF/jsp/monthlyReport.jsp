<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>월간 보고서</title>
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/semantic.css">
    <link rel="stylesheet" href="../../css/icon.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel='stylesheet prefetch'
          href='http://fonts.googleapis.com/css?family=Roboto:400|Roboto+Condensed:400|Fjalla+One:400'>
    <link rel='stylesheet prefetch'
          href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

    <style type="text/css">
        .reportDiv {
            height: 400px;
        }

        #cardDiv {

        }

        #reportTitle {
            text-align: center;
            margin: 0 auto 20px auto;
        }

        h1.method2 {
            margin-top: -10px;
            font-size: 30px;
            background: linear-gradient(to right, #30CFD0 0%, #944ee8 90%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -2px;
        }

        .description {
            font-size: 15px;
        }

        .sub_desc {
            font-size: 13px;
        }

        .sub_stan {
            font-size: 11px;
            letter-spacing: -1.5px;
        }

        .sub_count {
            font-size: 23px;
            position: relative;
            top: 6px;
            letter-spacing: -1.3px;
            font-weight: bold;
        }

        .sub_count2 {
            font-size: 23px;
            position: relative;
            top: 1.5px;
            letter-spacing: -1px;
            font-weight: bold;

        }

        .header {
            letter-spacing: -1.3px;
        }

        #cardChartDiv {

            margin-bottom: 20px;
            margin-top: 20px;
        }

        #cardListDiv {
            margin-top: 20px;
        }

        #label {
            font-weight: lighter;
            font-size: 15px;

        }

        #hrLine {
            height: 30px;

        }
    </style>
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
                <h4 class="ui horizontal divider header">
                    <i class="bar chart icon"></i>
                    월간 보고서
                </h4>
                <div class="row" id="cardChartDiv">
                    <div class="col-lg-6 grid-margin ">
                        <canvas id="doughnutChart"
                                style="height: 200px; "></canvas>
                    </div>
                    <div class="col-lg-6 grid-margin" id="cardListDiv">
                        <h4 class="ui header" id="label">
                            <i class="credit blue card alternative icon"></i>
                            카드 사용순위</h4>
                        <table class="ui blue table" id="cardRankTable">
                            <thead>
                            <tr>
                                <th>Rank</th>
                                <th>Card</th>
                                <th>Total</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-lg-12 grid-margin" id="hrLine">
                    <hr>
                </div>

                <div class="row ui link cards cardDiv">
                    <div class="col-lg-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/1_coffee.png">
                            </div>
                            <div class="content">
                                <div class="header">커피</div>
                                <div class="meta">
                                    <a>Cafe</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${coffee == 0 }">
                                            발생한 카페 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="" src="../../images/report/coffee.png" width="90" height="90">
                                            <span class="sub_count"><fmt:formatNumber
                                                    value="${coffee }" pattern=".0"/></span>
                                            <br><br>약 <fmt:formatNumber value="${coffee }" pattern=".0"/>잔을 마셨습니다
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="extra content">
									<span class="right floated sub_stan">스타벅스 아메리카노 Tall 사이즈
										기준</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/2_market.png">
                            </div>
                            <div class="content">
                                <div class="header">편의점</div>
                                <div class="meta">
                                    <a>Convenience store</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${market == 0 }">
                                            발생한 편의점 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            편의점에서<br>
                                            <fmt:formatNumber value="${market }" type="currency"/>
                                            를 결제하셨습니다
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/3_soju.png">
                            </div>
                            <div class="content">
                                <div class="header">술/유흥</div>
                                <div class="meta">
                                    <a>Bar</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${bar == 0 }">
                                            발생한 술/유흥 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>

                                            <img alt="" src="../../images/report/soju.png" width="80" height="80">
                                            <span class="sub_count"><fmt:formatNumber
                                                    value="${bar}" pattern=".0"/></span>
                                            <br><br>약 소주 <fmt:formatNumber value="${bar}" pattern=".0"/>
                                            병을 마셨습니다
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="extra content">
                                <span class="right floated sub_stan">처음처럼 소주 1병 기준</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/4_fastfood.png">
                            </div>
                            <div class="content">
                                <div class="header">패스트푸드</div>
                                <div class="meta">
                                    <a>Fastfood</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${burger == 0 }">
                                            발생한 패스트푸드 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="" src="../../images/report/fastfood.png" width="80" height="80">
                                            <span class="sub_count"><fmt:formatNumber
                                                    value="${burger}" pattern=".0"/></span>
                                            <br><br>
                                            약 <fmt:formatNumber value="${burger }" pattern=".0"/>
                                            세트를 드셨습니다
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="extra content">
                                <span class="right floated sub_stan">맥도날드 빅맥세트 기준</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/5_book.png">
                            </div>
                            <div class="content">
                                <div class="header">도서</div>
                                <div class="meta">
                                    <a>Bookstore</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${book == 0 }">
                                            발생한 서점 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="" src="../../images/report/book.png" width="80" height="80">
                                            <span class="sub_count2"><fmt:formatNumber value="${book }"
                                                                                       pattern=".0"/></span>
                                            <br><br>
                                            약 <fmt:formatNumber value="${book }" pattern=".0"/>
                                            권을 구매하셨습니다
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="extra content">
                                <span class="right floated sub_stan">도서 1권 12000원 기준</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 stretch-card grid-margin ">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/6_cinema.png">
                            </div>
                            <div class="content">
                                <div class="header">영화</div>
                                <div class="meta">
                                    <a>Cinema</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${movie == 0 }">
                                            발생한 영화관 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="" src="../../images/report/cinema.png" width="80" height="80">
                                            <span class="sub_count2"><fmt:formatNumber
                                                    value="${movie}" pattern=".0"/></span>
                                            <br><br>
                                            약 <fmt:formatNumber value="${movie }" pattern=".0"/>
                                            번을 관람하셨습니다
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="extra content">
                                <span class="right floated sub_stan">CGV 평일저녁 티켓기준</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/7_health.png">
                            </div>
                            <div class="content">
                                <div class="header">병원/의료</div>
                                <div class="meta">
                                    <a>Medical treatment</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${hsList.count == 0 }">
                                            발생한 의료내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            약국/병원을 다녀오신지 ${hsList.diff }일이 지났습니다
                                            <br>
                                            <br>
                                            <br>
                                            <span class="sub_desc"><fmt:formatDate
                                                    value="${hsList.sobi_date }" pattern="yyyy년 MM월 dd일 E요일"/>
													<br>${hsList.sobi_brand },${hsList.sobi_balance } 원 결제</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/8_hair.png">
                            </div>
                            <div class="content">
                                <div class="header">미용실</div>
                                <div class="meta">
                                    <a>Hair shop</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${hairList.count == 0 }">
                                            발생한 미용실 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            미용실을 다녀오신지 ${hairList.diff }일이 지났습니다
                                            <br>
                                            <br>
                                            <br>
                                            <span class="sub_desc"> <fmt:formatDate
                                                    value="${hairList.sobi_date }" pattern="yyyy년 MM월 dd일 E요일"/>
													<br>${hairList.sobi_brand },${hairList.sobi_balance }
													원 결제
												</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="ui card">
                            <div class="image">
                                <img src="../../images/report/9_gas.png">
                            </div>
                            <div class="content">
                                <div class="header">주유소</div>
                                <div class="meta">
                                    <a>Gas station</a>
                                </div>
                                <div class="description">
                                    <c:choose>
                                        <c:when test="${gas == 0 }">
                                            발생한 주유비 내역이 없습니다
                                        </c:when>
                                        <c:otherwise>
                                            <img alt="" src="../../images/report/gas.png" width="80" height="80">
                                            <span class="sub_count2"><fmt:formatNumber
                                                    value="${gas}" pattern=".0"/></span>
                                            <br><br>
                                            <fmt:formatNumber value="${gas }" pattern="#,##0.0"/>L 를 주유하셨습니다
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="extra content">
                                <span class="right floated sub_stan">휘발유 1L, 1600원 기준</span>
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
<!-- Custom js for this page-->
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

<script src="../../js/semantic.js"></script>
<script src="../../js/monthlyReport.js?version=2"></script>

</body>

</html>
