window.onload = function () {
    var year = $('#year').val();
    var month = $('#month').val();
    var cate = $('#cate').val();

    var params = "year=" + year + "&month=" + month + "&cate=" + cate;
    $.ajax({
        url: 'categoryDetail.do',
        type: "GET",
        data: params,
        dataType: 'json',
        success: function (data) {
            showDetail(data);
        },
        error:
            function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
    });

    $.ajax({
        url: 'sobiTable.do',
        type: "GET",
        data: params,
        dataType: 'json',
        success: function (data) {
            showSobiListTable(data);
        },
        error:
            function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
    });

    $.ajax({
        url: 'sobiChart.do',
        type: "GET",
        data: params,
        dataType: 'json',
        success: function (data) {
            // alert(data)
            // $.each(data, function (index, item) {
            //     data[index].count
            // })
            count = [];
            brand = [];
            for (i in data) {
                count.push(data[i].count);
                brand.push(data[i].brand);
            }

            showChartUpload(count, brand);
        },
        error:
            function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
    });
};

function showDetail(data) {
    $('#headcate').empty();
    $('#headcate').append(
        data.cate
    );
    $('#cateName').empty();
    $('#cateName').append(
        data.cate
    );
    $('#sum').empty();
    $('#sum').append(
        data.sum
    );
    $('#day').empty();
    $('#day').append(
        data.day
    );
    $('#hour').empty();
    $('#hour').append(
        data.hour
    );
    $('#count').empty();
    $('#count').append(
        data.count
    );
}

function showSobiListTable(data) {
    $('#sobiTable tbody').empty();
    $.each(data, function (index, item) {
        var date = new Date(item.sobiDate);
        var m = date.getMonth() + 1;
        var d = date.getDate();
        var h = date.getHours();
        var i = date.getMinutes();
        var s = date.getSeconds();
        var t = date.getFullYear() + '-' + (m > 9 ? m : '0' + m) + '-' + (d > 9 ? d : '0' + d) + ' ' + (h > 9 ? h : '0' + h) + ':' + (i > 9 ? i : '0' + i) + ':' + (s > 9 ? s : '0' + s);

        $('tbody').append(
            "<tr><td>" + item.sobiBrand + "</td>" +
            "<td>" + item.sobiBalance + "</td>" +
            "<td>" + t + "</td>" +
            "<td>" + item.sobiCate + "</td></tr>");
    });
}

function showChartUpload(count, brand) {
    var doughnutPieData = {
        datasets: [{
            data: count,
            backgroundColor: [
                'rgba(231, 74, 37, 0.2)',
                'rgba(46, 204, 113, 0.2)',
                'rgba(0, 187, 217,  0.2)',
                'rgba(25, 118, 210, 0.2)',
                'rgba(228, 234, 236, 0.5)',
                'rgba(58, 63, 81, 0.2)'
            ],
            borderColor: [
                'rgba(231, 74, 37, 0.3)',
                'rgba(46, 204, 113, 0.3)',
                'rgba(0, 187, 217, 0.3)',
                'rgba(25, 118, 210, 0.3)',
                'rgba(228, 234, 236, 1)',
                'rgba(58, 63, 81, 0.2)'
            ],
        }],
        labels: brand
    };

    var doughnutPieOptions = {
        responsive: true,
        animation: {
            animateScale: true,
            animateRotate: true
        }
    };

    if ($("#pieChart").length) {
        var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
        var pieChart = new Chart(pieChartCanvas, {
            type: 'pie',
            data: doughnutPieData,
            options: doughnutPieOptions
        });
    }
};
