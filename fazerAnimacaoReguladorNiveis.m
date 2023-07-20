function fazerAnimacaoReguladorNiveis(simulacao, planta)

% Obter resultados da simulacao
t = simulacao.h2.time;
phi_in = simulacao.c.signals.values;
h1 = simulacao.h1.signals.values;
h2 = simulacao.h2.signals.values;

% Conversao em fluxos
R1 = planta.R1; R2 = planta.R2;
phi_1 = h1/R1; phi_2 = h2/R2;

% Iniciar ambiente de animacao
figure;
maxX = 0.5*(planta.tanque_1.largura + planta.tanque_2.largura);
minX = - maxX;
maxY = 0.5*(planta.tanque_1.altura + planta.tanque_2.altura);
minY = -maxY;
axis([minX maxX+5 minY maxY+5]);

title('Animacao de sistema de dois tanques');
grid on;

% Animar os tanques
for i = 1:length(t)
    clf; % limpar para poder atualizar
    % caso ocorra undershoot vamos plotar de vermelho o fluido
    % Valvula de entrada
    if phi_in(i) >= 0
        rectangle('Position', [minX - 0.5*planta.tanque_1.largura, 0.9*planta.tanque_1.altura, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_1.altura*phi_in(i)/max(phi_in)], 'FaceColor', 'blue');
    else
        rectangle('Position', [minX - 0.5*planta.tanque_1.largura, 0.9*planta.tanque_1.altura, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_1.altura*abs(phi_in(i)/max(phi_in))], 'FaceColor', 'red');
    end
    rectangle('Position', [minX - 0.5*planta.tanque_1.largura, 0.9*planta.tanque_1.altura, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_1.altura], 'EdgeColor', 'black');
    
    % Valvula de acoplamento
    if phi_1(i) >= 0
        rectangle('Position', [0, 0, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_2.altura*phi_1(i)/max(phi_1)], 'FaceColor', 'blue');
    else
        rectangle('Position', [0, 0, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_2.altura*abs(phi_1(i)/max(phi_1))], 'FaceColor', 'red');
    end
    rectangle('Position', [0, 0, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_2.altura], 'EdgeColor', 'black');
    
    % Valvula de saida
    if phi_2(i) >= 0
        rectangle('Position', [0.5*planta.tanque_1.largura + planta.tanque_2.largura, minY + 0.1*planta.tanque_2.altura, 0.5*planta.tanque_2.largura, 0.1*planta.tanque_2.altura*phi_2(i)/max(phi_2)], 'FaceColor', 'blue');
    else
        rectangle('Position', [0.5*planta.tanque_1.largura + planta.tanque_2.largura, minY + 0.1*planta.tanque_2.altura, 0.5*planta.tanque_2.largura, 0.1*planta.tanque_2.altura*abs(phi_2(i)/max(phi_2))], 'FaceColor', 'red');
    end
    rectangle('Position', [0.5*planta.tanque_1.largura + planta.tanque_2.largura, minY + 0.1*planta.tanque_2.altura, 0.5*planta.tanque_2.largura, 0.1*planta.tanque_2.altura], 'EdgeColor', 'black');
    
    % Tanque 1
    if h1(i) >= 0
        rectangle('Position', [minX, 0, planta.tanque_1.largura, h1(i)], 'FaceColor', 'blue');
    else
        rectangle('Position', [minX, 0, planta.tanque_1.largura, abs(h1(i))], 'FaceColor', 'red');
    end
    rectangle('Position', [minX, 0, planta.tanque_1.largura, planta.tanque_1.altura], 'EdgeColor', 'black');
    
    % Tanque 2
    if h2(i) >= 0
        rectangle('Position', [0.5*planta.tanque_1.largura, minY + 0.1*planta.tanque_2.altura, planta.tanque_2.largura, h2(i)], 'FaceColor', 'blue');
    else
        rectangle('Position', [0.5*planta.tanque_1.largura, minY + 0.1*planta.tanque_2.altura, planta.tanque_2.largura, abs(h2(i))], 'FaceColor', 'red');
    end
    rectangle('Position', [0.5*planta.tanque_1.largura, minY + 0.1*planta.tanque_2.altura, planta.tanque_2.largura, planta.tanque_2.altura], 'EdgeColor', 'black');
    
    
    drawnow;
    
end

% Adicionar opcao de salvar aqui

end