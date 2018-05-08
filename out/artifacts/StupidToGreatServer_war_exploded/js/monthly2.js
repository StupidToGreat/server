window.onload = function () {
    alldata();

    $(document).on('click', '.cateBtn', function () {
        var cate = $(this).attr('data-id');
        var year = $('#year').val();
        var month = $('#month').val();
        var param = "year=" + year + "&month=" + month + "&cate=" + cate;
        window.location.href = 'monthCategoryDetail.do?' + param;
    })

    $('#cateSelect').on('change', function () {
        var cate = this.value;
        var year = $('#year').val();
        var month = $('#month').val();
        var userPhone = $('#userPhone').val();

        if (cate == 'all') {
            var params = "year=" + year + "&month=" + month + "&userPhone=" + userPhone;

            $.ajax({
                url: 'getMonthlyChart.do',
                data: params,
                dataType: 'json',
                success: function (data) {
                    var sobiList = data.sobiList;
                    showSobiListTable(sobiList);
                }
            });
        } else {
            var params = "year=" + year + "&month=" + month + "&userPhone=" + userPhone + "&cate=" + cate;
            $.ajax({
                url: 'getMonthlyListByCate.do',
                data: params,
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        showSobiListTable(data);
                    }
                }
            });
        }
    });
}

function alldata() {
    var year = $('#year').val();
    var month = $('#month').val();
    var userPhone = $('#userPhone').val();
    var params = "year=" + year + "&month=" + month + "&userPhone=" + userPhone;

    $.ajax({
        url: 'getMonthlyChart.do',
        data: params,
        dataType: 'json',
        success: function (data) {
            var sobiChart = data.sobiChart;
            // var sobiList = data.sobiList;
            showchartUpload(sobiChart);
            //showSobiListTable(sobiList);
        }
    });
}

/*function showSobiListTable(data) {
	//소비리스트 테이블 값 뿌리기 
	$('#sobiListTable tbody').empty();

	$.each(data, function(index, item) {
		var d = new Date(item.date);

		$('tbody').append( 
			"<tr><td>" + item.cate + "</td>" +
			"<td>" + d.toLocaleString() + "</td>" +
			"<td>" + item.brand + "</td>" +
			"<td>" + item.balance + "</td>" +
			"<td>" + item.means + "</td></tr>");
	});
}*/

function showchartUpload(data) {
    var sum = 0;
    $.each(data, function (index, item) {
        sum += item.balance;
    });

    var doughnutPieData = {
        datasets: [{
            data: [Math.round((data[0].balance / sum) * 100),
                Math.round((data[1].balance / sum) * 100),
                Math.round((data[2].balance / sum) * 100),
                Math.round((data[3].balance / sum) * 100),
                Math.round((data[4].balance / sum) * 100),
                Math.round((data[5].balance / sum) * 100),
                Math.round((data[6].balance / sum) * 100)
            ],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(85, 209, 102,0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,0.4)',
                'rgba(54, 162, 235, 0.4)',
                'rgba(255, 206, 86, 0.4)',
                'rgba(75, 192, 192, 0.4)',
                'rgba(153, 102, 255, 0.4)',
                'rgba(255, 159, 64, 0.4)',
                'rgba(85, 209, 102,0.4)'
            ],
        }],
        labels: [data[0].cateName,
            data[1].cateName,
            data[2].cateName,
            data[3].cateName,
            data[4].cateName,
            data[5].cateName,
            data[6].cateName]
    };

    var doughnutPieOptions = {
        responsive: true,
        animation: {
            animateScale: true,
            animateRotate: true
        }
    };

    var barChartData = {
        labels: [data[0].cateName,
            data[1].cateName,
            data[2].cateName,
            data[3].cateName,
            data[4].cateName,
            data[5].cateName,
            data[6].cateName],
        datasets: [{
            data: [data[0].cateCount,
                data[1].cateCount,
                data[2].cateCount,
                data[3].cateCount,
                data[4].cateCount,
                data[5].cateCount,
                data[6].cateCount],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(228, 234, 236, 0.5)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(228, 234, 236, 1.3)'
            ],
            borderWidth: 1
        }]
    };

    var barChartoptions = {
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

    if ($("#barChart").length) {
        var barChartCanvas = $("#barChart").get(0).getContext("2d");
        // This will get the first returned node in the jQuery collection.
        var barChart = new Chart(barChartCanvas, {
            type: 'bar',
            data: barChartData,
            options: barChartoptions
        });
    }

    if ($("#pieChart").length) {
        var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
        var pieChart = new Chart(pieChartCanvas, {
            type: 'pie',
            data: doughnutPieData,
            options: doughnutPieOptions
        });
    }
}