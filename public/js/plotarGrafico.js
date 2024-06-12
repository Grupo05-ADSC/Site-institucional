
    var opts = {
        angle: 0,
        lineWidth: 0.5,
        radiusScale: 0.8, // Raio relativo
        pointer: {
            length: 0.7, // Relativo ao raio do Gauge
            strokeWidth: 0.04, // Largura do traço
            color: '#00000' // Cor do ponteiro
        },
        generateGradient: true,
        highDpiSupport: true,
        staticZones: [
            { strokeStyle: "#1EA614", min: 0, max: 30 }, // Ótimo (Verde)
            { strokeStyle: "#9FCC00", min: 30, max: 50 }, // Bom (Amarelo)
            { strokeStyle: "#FFF001", min: 50, max: 70 }, // Atenção (Laranja)
            { strokeStyle: "#FFAF00", min: 70, max: 90 }, // Alerta (Vermelho)
            { strokeStyle: "#FE2B00", min: 90, max: 100 } // Crítico (Vermelho escuro)
        ],
        staticLabels: {
            font: "12px sans-serif", // Especifica a fonte dos rótulos
            labels: [0, 30, 50, 70, 90, 100], // Rótulos nas divisórias das cores
            color: "#b6b6b6", // Cor do texto do rótulo
            fractionDigits: 0 // Precisão numérica. 0 = arredondar
        }
    };
    var target = document.getElementById('gauge1'); // Elemento onde o gauge deve ser criado
    var gauge1 = new Gauge(target).setOptions(opts); // Criar gauge
    gauge1.maxValue = 100; // Valor maximo
    gauge1.setMinValue(0);  // Valor minimo
    gauge1.animationSpeed = 32; // Velocidade da animacao

    function atualizarValor() {
        var novoUso = (Math.floor(Math.random() * 70) + 25) // Gerar valor aleatório entre 0 e 100
        gauge1.set(novoUso); // Atualizar valor do gráfico
        document.getElementById('uso_atual1').innerHTML = novoUso + '<b> % CPU </b>'; // Atualizar texto
    }

    // Chamar a função a cada 1 segundos

    var opts = {
        angle: 0,
        lineWidth: 0.5,
        radiusScale: 0.8, // Raio relativo
        pointer: {
            length: 0.7, // Relativo ao raio do Gauge
            strokeWidth: 0.04, // Largura do traço
            color: '#00000' // Cor do ponteiro
        },
        generateGradient: true,
        highDpiSupport: true,
        staticZones: [
            { strokeStyle: "#1EA614", min: 0, max: 40 }, // Ótimo (Verde)
            { strokeStyle: "#9FCC00", min: 40, max: 60 }, // Bom (Amarelo)
            { strokeStyle: "#FFF001", min: 60, max: 80 }, // Atenção (Laranja)
            { strokeStyle: "#FFAF00", min: 80, max: 90 }, // Alerta (Vermelho)
            { strokeStyle: "#FE2B00", min: 90, max: 100 } // Crítico (Vermelho escuro)
        ],
        staticLabels: {
            font: "12px sans-serif", // Especifica a fonte dos rótulos
            labels: [0, 40, 60, 80, 90, 100], // Rótulos nas divisórias das cores
            color: "#b6b6b6", // Cor do texto do rótulo
            fractionDigits: 0 // Precisão numérica. 0 = arredondar
        }
    };
    var target = document.getElementById('gauge2'); // Elemento onde o gauge deve ser criado
    var gauge2 = new Gauge(target).setOptions(opts); // Criar gauge
    gauge2.maxValue = 100; // Valor maximo
    gauge2.setMinValue(0);  // Valor minimo
    gauge2.animationSpeed = 32; // Velocidade da animacao

    function atualizarValor() {
        var novoUso = (Math.floor(Math.random() * 16) + 35) // Gerar valor aleatório entre 0 e 100
        gauge2.set(novoUso); // Atualizar valor do gráfico
        document.getElementById('uso_atual2').innerHTML = novoUso + '<b> % RAM </b>'; // Atualizar texto
    }

    // Chamar a função a cada 1 segundos

    var opts = {
        angle: 0,
        lineWidth: 0.5,
        radiusScale: 0.8, // Raio relativo
        pointer: {
            length: 0.7, // Relativo ao raio do Gauge
            strokeWidth: 0.04, // Largura do traço
            color: '#00000' // Cor do ponteiro
        },
        generateGradient: true,
        highDpiSupport: true,
        staticZones: [
            { strokeStyle: "#1EA614", min: 0, max: 40 }, // Ótimo (Verde)
            { strokeStyle: "#9FCC00", min: 40, max: 60 }, // Bom (Amarelo)
            { strokeStyle: "#FFF001", min: 60, max: 80 }, // Atenção (Laranja)
            { strokeStyle: "#FFAF00", min: 80, max: 90 }, // Alerta (Vermelho)
            { strokeStyle: "#FE2B00", min: 90, max: 100 } // Crítico (Vermelho escuro)
        ],
        staticLabels: {
            font: "12px sans-serif", // Especifica a fonte dos rótulos
            labels: [0, 40, 60, 80, 90, 100], // Rótulos nas divisórias das cores
            color: "#b6b6b6", // Cor do texto do rótulo
            fractionDigits: 0 // Precisão numérica. 0 = arredondar
        }
    };
    var target = document.getElementById('gauge3'); // Elemento onde o gauge deve ser criado
    var gauge = new Gauge(target).setOptions(opts); // Criar gauge
    gauge.maxValue = 100; // Valor maximo
    gauge.setMinValue(0);  // Valor minimo
    gauge.animationSpeed = 32; // Velocidade da animacao

    function atualizarValor() {
        var novoUso = (Math.floor(Math.random() * 5)) // Gerar valor aleatório entre 0 e 100
        gauge.set(novoUso); // Atualizar valor do gráfico
        document.getElementById('uso_atual3').innerHTML = novoUso + '<b> % Disco </b>'; // Atualizar texto
    }


    
    // Chamar a função a cada 1 segundos

