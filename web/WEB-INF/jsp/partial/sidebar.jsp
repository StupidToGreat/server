<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Insert title here</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../node_modules/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="../css/semantic.css">
    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script type="text/javascript">
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
                    $('#progressDiv').attr('aria-valuenow', Math.round((data.sum/data.budget)*100));
                }
            });
        });
    </script>
</head>
<body>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item"><a class="nav-link" href="/main.do"> <span
                class="menu-title">대시보드</span> <span class="menu-sub-title">(업데이트 구성)</span> <i
                class="mdi mdi-home menu-icon"></i>
        </a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="collapse"
                                href="#ui-calendar" aria-expanded="false" aria-controls="ui-calendar">
            <span class="menu-title">수입/지출내역</span> <i
                class="menu-arrow"></i> <i class="mdi mdi-format-list-bulleted menu-icon"></i>
        </a>
            <div class="collapse" id="ui-calendar">
                <ul class="nav flex-column sub-menu">
                    <c:set var="now" value="<%=new java.util.Date()%>"/>
                    <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
                    <c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM"/></c:set>
                    <c:set var="sysDay"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
                    <li class="nav-item"><a class="nav-link"
                                            href="/monthlyCategory.do?year=${sysYear}&month=${sysMonth}">월별</a></li>
                    <li class="nav-item"><a class="nav-link"
                                            href="/dailyCategory.do?day=${sysDay}">일별</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item"><a class="nav-link" data-toggle="collapse"
                                href="#ui-report" aria-expanded="false" aria-controls="ui-report">
            <span class="menu-title">보고서</span> <i
                class="menu-arrow"></i> <i class="mdi mdi-chart-bar menu-icon"></i>
        </a>
            <div class="collapse" id="ui-report">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"><a class="nav-link" href="/monthlyReport.do">월간 보고서</a></li>
                    <li class="nav-item"><a class="nav-link" href="/ggongChart.do">나의 소비그룹 비교</a></li>
                    <li class="nav-item"><a class="nav-link" href="/trendAnalysis.do">트랜드 분석</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item"><a class="nav-link"
                                href="/calendar.do"> <span
                class="menu-title">달력</span> <i
                class="mdi mdi-calendar"></i>
        </a></li>
    </ul>
    <div class="sidebar-progress">
        <p>목표금액까지..</p>
        <div class="progress progress-sm">
            <%--aria-valuenow="72" aria-valuemax="100"--%>
            <div class="progress-bar bg-gradient-success" id="progressDiv" role="progressbar"
                 style="width: 72%" aria-valuemax="100" aria-valuemin="0"></div>
        </div>
        <p>${msg}</p>
    </div>
</nav>
</body>
</html>