<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->

    <link rel="stylesheet" href="css/semantic.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel='stylesheet prefetch'
          href='http://fonts.googleapis.com/css?family=Roboto:400|Roboto+Condensed:400|Fjalla+One:400'>
    <link rel='stylesheet prefetch'
          href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

    <style type="text/css">
        .column {

        }

        .analDiv {
            height: 330px;
        }

        .analDiv div {
            height: 300px;
            text-align: center;
            line-height: 300px;

        }

        .column img {
            margin: 0 auto;
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
                    <i class="twitter blue icon"></i>
                    트위터 분석
                </h4>
                <div class="ui grid analDiv">
                    <div class="eight wide column">
                        <img width="500" height="320" alt="" src="../../images/sns/twitter_bird.png"/>
                    </div>
                    <div class="eight wide column">
                        <img width="500" height="320" alt="" src="../../images/sns/twitter_count.png"/>
                    </div>
                </div>
                <div class="ui grid analDiv">
                    <div class="eight wide column">
                    <img width="500" height="320" alt="" src="../../images/sns/twitter_eatout.png"/>
                    </div>
                    <div class="eight wide column">
                    <img width="500" height="320" alt="" src="../../images/sns/twitter_shop.png"/>
                    </div>
                </div>
                <div class="ui grid analDiv">
                    <div class="eight wide column">
                        <img width="500" height="320" alt="" src="../../images/sns/twitter_market.png"/>
                    </div>
                    <div class="eight wide column">
                        <img width="500" height="320" alt="" src="../../images/sns/twitter_trans.png"/>
                    </div>
                </div>
                <div class="ui grid analDiv">
                    <div class="eight wide column">
                        <img width="500" height="320" alt="" src="../../images/sns/twitter_interest.png"/>
                    </div>
                    <div class="eight wide column">
                        <img width="500" height="320" alt="" src="../../images/sns/twitter_life.png"/>
                    </div>
                </div>

                <%--<h4 class="ui horizontal divider header">--%>
                    <%--<i class="instagram pink icon"></i>--%>
                    <%--인스타그램 분석--%>
                <%--</h4>--%>
                <%--<div class="ui grid analDiv">--%>
                    <%--<div class="eight wide column">--%>
                        <%--<img width="500" height="320" alt="" src="../../images/report/i1.jpeg"/>--%>
                    <%--</div>--%>
                    <%--<div class="eight wide column">--%>
                        <%--<img width="500" height="320" alt="" src="../../images/report/i2.jpg"/>--%>
                    <%--</div>--%>
                <%--</div>--%>
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
