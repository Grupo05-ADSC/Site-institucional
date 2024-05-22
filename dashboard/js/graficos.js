var ctx = document.getElementById('donutChart').getContext('2d');
var donutChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        datasets: [{
            data: [70, 30],
            backgroundColor: [
                'rgba(54, 122, 235, 0.8)',
                'rgba(153, 42, 255, 0.8)'
            ],
            borderWidth: 0
        }]
    },
    options: {
        title: {
            display: true,
            text: 'Espaço do Disco'
        },
        cutoutPercentage: 70
    }
});


// Gráfico da CPU
var ctx1 = document.getElementById('lineChart1').getContext('2d');
var lineChart1 = new Chart(ctx1, {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: 'Registros CPU',
            data: [],
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
            fill: true
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    min: 0,
                    max: 20,
                    stepSize: 5
                }
            }]
        }
    }
});

function updateCPUData(chart) {
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var time = (hour < 10 ? '0' : '') + hour + ':' + (minute < 10 ? '0' : '') + minute;

    chart.data.labels.push(time);
    if (chart.data.labels.length > 10) {
        chart.data.labels.shift();
        chart.data.datasets[0].data.shift();
    }
    chart.data.datasets[0].data.push(Math.floor(Math.random() * 70) + 25);
    chart.update();
}

// Gráfico do Disco
var ctx2 = document.getElementById('lineChart2').getContext('2d');
var lineChart2 = new Chart(ctx2, {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: 'Registros DISCO',
            data: [],
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
            fill: true
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    min: 0,
                    max: 20,
                    stepSize: 5
                }
            }]
        }
    }
});

function updateDiskData(chart) {
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var time = (hour < 10 ? '0' : '') + hour + ':' + (minute < 10 ? '0' : '') + minute;

    chart.data.labels.push(time);
    if (chart.data.labels.length > 10) {
        chart.data.labels.shift();
        chart.data.datasets[0].data.shift();
    }
    chart.data.datasets[0].data.push(Math.floor(Math.random() * 5));
    chart.update();
}

// Gráfico da RAM AQUI
var ctx3 = document.getElementById('lineChart3').getContext('2d');
var lineChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: 'Registros RAM',
            data: [],
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
            fill: true
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    min: 35,
                    max: 50,
                    stepSize: 5
                }
            }]
        }
    }
});


function updateRAMData(chart) {
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var time = (hour < 10 ? '0' : '') + hour + ':' + (minute < 10 ? '0' : '') + minute;

    chart.data.labels.push(time);
    if (chart.data.labels.length > 10) {
        chart.data.labels.shift();
        chart.data.datasets[0].data.shift();
    }
    chart.data.datasets[0].data.push(Math.floor(Math.random() * 16) + 35);
    chart.update();
}


// Gráfico da REDE
var ctx4 = document.getElementById('lineChart4').getContext('2d');
var lineChart4 = new Chart(ctx4, {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: 'Registros REDE',
            data: [],
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
            fill: true
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    min: 35,
                    max: 50,
                    stepSize: 5
                }
            }]
        }
    }
});


function updateREDEData(chart) {
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var time = (hour < 10 ? '0' : '') + hour + ':' + (minute < 10 ? '0' : '') + minute;

    chart.data.labels.push(time);
    if (chart.data.labels.length > 10) {
        chart.data.labels.shift();
        chart.data.datasets[0].data.shift();
    }
    chart.data.datasets[0].data.push(Math.floor(Math.random() * 3001) + 6000);
    chart.update();
}