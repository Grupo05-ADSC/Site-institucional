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

// Função para atualizar dados da CPU
function updateCPUData(chart, data) {
    var time = new Date().toLocaleTimeString();
    chart.data.labels.push(time);
    if (chart.data.labels.length > 10) {
        chart.data.labels.shift();
        chart.data.datasets[0].data.shift();
    }
    chart.data.datasets[0].data.push(parseFloat(data.dado));
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

// Função para atualizar dados do Disco
function updateDiskData(chart, data) {
    var time = new Date().toLocaleTimeString();
    chart.data.labels.push(time);
    if (chart.data.labels.length > 10) {
        chart.data.labels.shift();
        chart.data.datasets[0].data.shift();
    }
    chart.data.datasets[0].data.push(parseFloat(data.dado));
    chart.update();
}

// Gráfico da RAM
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

// Função para atualizar dados da RAM
function updateRAMData(chart, data) {
    var time = new Date().toLocaleTimeString();
    chart.data.labels.push(time);
    if (chart.data.labels.length > 10) {
        chart.data.labels.shift();
        chart.data.datasets[0].data.shift();
    }
    chart.data.datasets[0].data.push(parseFloat(data.dado));
    chart.update();
}

// Função para simular a obtenção de dados a cada 10 segundos
function fetchDataAndUpdateCharts() {
    // Simulando a obtenção de dados (você deve substituir isso pela lógica real de busca de dados)
    var fakeData = [
        { idRegistro: 2, dado: '5.85' },
        { idRegistro: 3, dado: '617.1' },
        { idRegistro: 4, dado: '1.0' }
        // Adicione aqui os dados da RAM
    ];

    // Atualiza os gráficos com os novos dados
    updateCPUData(lineChart1, fakeData[0]);
    updateDiskData(lineChart2, fakeData[1]);
    updateRAMData(lineChart3, fakeData[2]);
}

// Chama a função de busca e atualização de dados a cada 10 segundos
setInterval(fetchDataAndUpdateCharts, 10000);
