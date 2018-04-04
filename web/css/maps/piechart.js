$(function() {
  /* ChartJS
   * -------
   * Data and config for chartjs
   */
  'use strict';
  

  var doughnutPieData = {
		    datasets: [{
		      data: [20, 10, 10,20,10,10,20],
		      backgroundColor: [
		        'rgba(255, 177, 54 ,0.2)',
		        'rgba(231, 74, 37, 0.2)',
		        'rgba(46, 204, 113, 0.2)',   
		        'rgba(0, 187, 217,  0.2)',
		        'rgba(25, 118, 210, 0.2)',
		        'rgba(228, 234, 236, 0.5)',
		        'rgba(58, 63, 81, 0.2)'
		      ],   
		      borderColor: [ 
		        'rgba(255, 177, 54, 0.3)',
		        'rgba(231, 74, 37, 0.3)',
		        'rgba(46, 204, 113, 0.3)',  
		        'rgba(0, 187, 217, 0.3)',
		        'rgba(25, 118, 210, 0.3)',
		        'rgba(228, 234, 236, 1)',
		        'rgba(58, 63, 81, 0.2)'
		      ],
		    }],

    // These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [
      '외식',
      '마켓/편의점',
      '쇼핑',
      '교통',
      '생활비',
      '문화생활',
      '기타'
  
    ]
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

  

 
});
