<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>달력</title>
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
    <link rel="stylesheet" href="../../css/cal4.css">
    <link rel="stylesheet" href="../../css/semantic.css">
    <link rel="stylesheet" href="../../css/icon.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../images/favicon.png"/>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel='stylesheet prefetch'
          href='http://fonts.googleapis.com/css?family=Roboto:400|Roboto+Condensed:400|Fjalla+One:400'>
    <link rel='stylesheet prefetch'
          href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

    <style type="text/css">
        .static_wrap {
            width: 800px;
            height: 75px;
            margin-left: 40px;
        }

        .won {
            font-size: 50px;
        }

        .ctLabel {
            font-size: 18px;
            color: #444447;
        }

        #messageDiv {
            width: 900px;
            height: 110px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #fff;
        }

        .messagetxt {
            margin-left: 50px;
        }

        #countDiv {
            margin-top: 8px;
            margin-left: 10px;
        }

        #sumDiv {
            margin-top: 8px;
            margin-left: 100px;
        }

        #monthlyDiv {
            float: right;
        }

        #monthlyBtn, #disabledBtn {
            width: 250px;
            height: 70px;
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
                <div class="ui message" id="messageDiv">
                    <div class="ui small statistic" id="countDiv">
                        <div class="value sumCount"></div>
                        <div class="label">COUNT</div>
                    </div>
                    <div class="ui  small statistic" id="sumDiv">
                        <div class="value sumTotal"></div>
                        <div class="label">TOTAL</div>
                    </div>
                    <div class="ui  small statistic" id="monthlyDiv"></div>
                </div>
                <div class="calendar-wrapper">
                    <button id="btnPrev" type="button">Prev</button>
                    <button id="btnNext" type="button">Next</button>
                    <div id="divCal"></div>
                </div>
                <script src="../../js/cal4.js"></script>
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
</body>
</html>
