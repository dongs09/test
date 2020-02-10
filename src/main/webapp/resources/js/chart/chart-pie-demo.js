// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

function getPieChart(pieChart){
	
	console.log(pieChart);
	
	var labels = [];
	var datasets = [];
	var backgroundColor = [];
	
	for(var i in pieChart){
		labels.push(pieChart[i].PRODUCTNAME);
		datasets.push(pieChart[i].CNT);
		backgroundColor.push(getRandomColor());
	}

	//	Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: labels,
			datasets: [{
				data: datasets,
				backgroundColor: backgroundColor,
			}],
		},
});

}