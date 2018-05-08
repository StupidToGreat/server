window.onload = function() {

    var day = new Date();
    var year = day.getFullYear();
    var month = day.getMonth();
     alldata(year, month);

}



function alldata(year, month) {

    var params = "year="+year+"&month="+month;

    $.ajax({
        url : 'getCardChartValue.do',
        data : params,
        dataType : 'json',
        success : function(data) {
        showchartUpload(data);
        showTable(data);
        }
    });
}



function showTable(data){

    $.each(data, function(index, item) {

        $('#cardRankTable').find('tbody').append(
            "<tr>" +
            "<td>" + (index+1) + "</td>" +
            "<td>" + item.sobi_means2 +"카드"+ "</td>" +
            "<td>" + "&#8361;"+item.sum.toLocaleString() + "</td>" +
            "</tr>");
    });

}


function showchartUpload(data) {

    sumAmount = [];
    card= [];
    for( i in data )
    {
        sumAmount.push(data[i].sum);
        card.push(data[i].sobi_means2);
    }


    var doughnutPieData = {
        datasets: [{
            data: sumAmount,
            backgroundColor: [
                'rgba(91,154,160, 0.2)',
                'rgba(184,169,201, 0.2)',
                'rgba(135,189,216, 0.2)',
                'rgba(102,114,146, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(228, 234, 236, 0.3)'
            ],
            borderColor: [
                'rgba(91,154,160,0.4)',
                'rgba(184,169,201, 0.4)',
                'rgba(135,189,216,0.4)',
                'rgba(102,114,146, 0.4)',
                'rgba(153, 102, 255, 0.4)',
                'rgba(255, 159, 64, 0.4)',
                'rgba(228, 234, 236, 0.8)'
            ],
        }],

        // These labels appear in the legend and in the tooltips when hovering different arcs
        labels: card
    };
    var doughnutPieOptions = {
        responsive: true,
        animation: {
            animateScale: true,
            animateRotate: true
        }
    };




    if ($("#doughnutChart").length) {
        var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
        var doughnutChart = new Chart(doughnutChartCanvas, {
            type: 'doughnut',
            data: doughnutPieData,
            options: doughnutPieOptions
        });
    }


}