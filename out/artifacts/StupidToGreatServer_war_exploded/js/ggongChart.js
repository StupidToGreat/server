window.onload = function () {
    $.ajax({
        url: 'ggongMyData.do',
        dataType: 'json',
        success: function (data) {
            showGgongTableHead(data);
        },
        error:
            function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
    });

    $.ajax({
        url: 'ggongData.do',
        type: "GET",
        dataType: 'json',
        success: function (data) {
            showGgongListTable(data);
        },
        error:
            function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
    });
    chartData();
};

function chartData() {
    $.ajax({
        url: 'ggongChartData.do',
        dataType: 'json',
        success: function (data) {
            showChartUpload(data);
        }
    })
}

function showGgongTableHead(data) {
    $('#sobiListTable thead').empty();
    var g = "";
    if (data.gender == 0)
        g = "여성";
    else
        g = "남성";
    $('thead').append(
        "<tr><th>카테고리</th>" +
        "<th>나의 현황</th><th>" +
        data.age + "대 " + g + " 평균금액" + "</th></tr>"
    )
}

function showGgongListTable(data) {
    $('#sobiListTable tbody').empty();

    $.each(data, function (index, item) {
        $('tbody').append(
            "<tr><td>" + item.ggong_cate + "</td>" +
            // "<td>" + calculateSobi(item.ggong_sobi, item.my_sobi) + "</td>" +
            calculateSobi(item.ggong_sobi, item.my_sobi) +
            "<td>" + item.ggong_sobi + "</td></tr>");
    });
}

function calculateSobi(ggs, mys) {
    var i = "";

    if (mys == 0)
        i = "<td><i class=\"minus icon\"/></td>";
    else if ((ggs - mys) < 0)
        i = "<td style='color: red;'><i class= \"red caret up icon\"/>" + String(mys - ggs) + "</td>";
    // i = "<i class= \"red caret up icon\">"+String(mys-ggs) +"</i>";
    else if ((ggs - mys) > 0)
        i = "<td style='color: dodgerblue'><i class = \"blue caret down icon\"/>" + String(ggs - mys) + "</td>";
    return i;
}

//여기부터
function showChartUpload(list) {
    var data = {
        labels: ["나의 소비", list[3] + "대 여성소비", list[3] + "대 남성소비"],
        datasets: [{
            label: '금액',
            data: [list[2], Math.round(Number(list[0])/12), Math.round(Number(list[1])/12)],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]

    };
    var options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        },
        legend: {
            display: false
        },
        elements: {
            point: {
                radius: 0
            }
        }

    };
// Get context with jQuery - using jQuery's .get() method.
    if ($("#ggongChart").length) {
        var barChartCanvas = $("#ggongChart").get(0).getContext("2d");
        // This will get the first returned node in the jQuery collection.
        var barChart = new Chart(barChartCanvas, {
            type: 'bar',
            data: data,
            options: options
        });
    }
}