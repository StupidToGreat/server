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
    <title>카테고리 월별</title>
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
    <link rel="stylesheet" href="../../css/monthly4.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../images/favicon.png"/>
</head>
<body>

<input type="hidden" id="year" value=${year}>
<input type="hidden" id="month" value=${month}>
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

                <div id="manjokDiv" class="col-lg-12 grid-margin ui info message">
                    <h1 class="method2">${month}월,  ${member.memberName}님의   소비점수</h1>
                    <c:choose>
                        <c:when test="${score == 0}">
                            <div id="noScore">일일 만족도 평가를 해주세요</div>
                        </c:when>
                        <c:otherwise>
                            <div id="progressBar" class="progress" style="height: 18px;">
                                <div
                                        class="progress-bar progress-bar-striped progress-bar-animated"
                                        role="progressbar" style="width: ${score}%; "
                                        aria-valuenow="${score}" aria-valuemin="0"
                                        aria-valuemax="100">${score}점
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="row chartDiv">
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
                                <canvas id="pieChart" style="height: 250px; background-color: #fff;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="cateBtnDiv col-lg-12 grid-margin">
                    <button class="ui green basic button cateBtn"
                            style="width: 110px; font-size: 15px" data-id="eatout">외식
                    </button>
                    <button class="ui teal basic button cateBtn"
                            style="width: 130px; font-size: 15px" data-id="market">마켓/편의점
                    </button>
                    <button class="ui blue basic button cateBtn"
                            style="width: 110px; font-size: 15px" data-id="shop">쇼핑
                    </button>
                    <button class="ui violet basic button cateBtn"
                            style="width: 110px; font-size: 15px" data-id="trans">교통
                    </button>
                    <button class="ui purple basic button cateBtn"
                            style="width: 110px; font-size: 15px" data-id="life">생활비
                    </button>
                    <button class="ui pink basic button cateBtn"
                            style="width: 110px; font-size: 15px" data-id="interest">문화생활
                    </button>
                    <button class="ui brown basic button cateBtn"
                            style="width: 110px; font-size: 15px" data-id="etc">기타
                    </button>
                </div>

                <div class="col-lg-12 grid-margin stretch-card" id="sobiListDiv">
                    <table class="ui table" id="sobiListTable">
                        <thead>
                        <tr>
                            <th align="center">카테고리</th>
                            <th align="center">날짜</th>
                            <th align="center">소비처</th>
                            <th align="center">금액</th>
                            <th align="center">결제수단</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sobiList }" var="sobi" varStatus="i">
                            <tr>
                                <td>${sobi.sobiCate}</td>
                                <td><fmt:formatDate value="${sobi.sobiDate}" type="both"/></td>
                                <td>${sobi.sobiBrand }</td>
                                <td><fmt:formatNumber value="${sobi.sobiBalance }"
                                                      type="currency"></fmt:formatNumber></td>
                                <td>${sobi.sobiMeans }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div id="pagingDiv">
                    <c:if test="${start != 1 }">
                        <a href="monthlyCategory.do?page=1&year=${year}&month=${month}">[처음]</a>
                        <a href="monthlyCategory.do?page=${start-1}&year=${year}&month=${month}">[이전]</a>
                    </c:if>
                    <c:forEach begin="${start}" end="${end}" var="i">
                        <c:choose>
                            <c:when test="${i == current}">
                                [${i}]
                            </c:when>
                            <c:otherwise>
                                <a
                                        href="monthlyCategory.do?page=${i}&year=${year}&month=${month}">[${i}]</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${end != last}">
                        <a href="monthlyCategory.do?page=${end+1}&year=${year}&month=${month}">[다음]</a>
                        <a href="monthlyCategory.do?page=${last}&year=${year}&month=${month}">[끝]</a>
                    </c:if>
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
<!-- endinject -->
<!-- Custom js for this page-->
<script src="../../js/monthly2.js?version=5"></script>
<script src="../../js/semantic.js"></script>
<script>
    $('.ui.progress.bar').progress();

    $('.ui.rating')
        .rating({
            initialRating: 0,
            maxRating: 5
        })
    ;

    $('#ratingfin')
        .rating('disable')
    ;

    $('.ui.dropdown').dropdown();
</script>
</body>
</html>
