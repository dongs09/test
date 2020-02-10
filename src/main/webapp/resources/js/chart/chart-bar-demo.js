// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

function getBarChart(barChart){
	
	console.log(barChart);

	var labels = [];
	var data = [];

	for(var i in barChart){
		labels.push(barChart[i].WEEK);
		if(barChart[i].SUMPRICE == null) data.push(0);
		else data.push(barChart[i].SUMPRICE);
	}

	//	Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myLineChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: labels,
			datasets: [{
				label: "총 매출액",
				backgroundColor: getRandomColor(),
				data: data,
			}],
		},
		options: {
			scales: {
				xAxes: [{
					gridLines: {
						display: false
					},
					ticks: {
						maxTicksLimit: 6
					}
				}],
				yAxes: [{
					ticks: {
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
