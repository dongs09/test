/**
 * 월간 매출 차트
 */

//ajax
$.ajax({
    url: "/statistics/salesSearch",
    method: "GET",
    success: function (result) {
        
    	var paymentDate = [];
    	var sumPrice = [];
    	
        for (var i in result.monthlyStatistics) {
            paymentDate.push(result.monthlyStatistics[i].PAYMENTDATE);
            sumPrice.push(result.monthlyStatistics[i].SUMPRICE);
        }
        
        var ctx = document.getElementById("myBarChart");
        var myLineChart = new Chart(ctx, {
          type: 'bar',
          data: {
              labels: paymentDate,
              datasets: [{
                 label: "총 매출액",
                 backgroundColor: getRandomColor(),
                 borderColor: getRandomColor(),
                 data: sumPrice,
              }],
           },
          options: {
            scales: {
              xAxes: [{
                time: {
                  unit: 'day'
                },
                gridLines: {
                  display: false
                },
                ticks: {
                  maxTicksLimit: 6
                }
              }],
              yAxes: [{
                ticks: {
                  min: 0,
                  max: 15000,
                  maxTicksLimit: 5
                },
                gridLines: {
                  display: true
                }
              }],
            },
            legend: {
              display: false
            }
          }
        });
    }
});
