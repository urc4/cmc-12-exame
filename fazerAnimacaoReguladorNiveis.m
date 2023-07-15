function fazerAnimacaoReguladorNiveis(simulacao, planta)

% Resultados da simulacao
% Por enquanto vamos gerar dados

% Obter resultados da simulacao
% t = simulacao.phi_in.time;
% phi_in = simulacao.phi_in.signals.values; % sera q poderia fazer tipo autoplioto pra alterar phi_in
% r2 = simulacao.r2.signals.values;
% c1 = simulacao.c1.signals.values;
% h1 = simulacao.h1.signals.values;
% c2 = simulacao.c2.signals.values;
% h2 = simulacao.h2.signals.values;

% Conversao em fluxos
% R1 = planta.R1; R2 = planta.R2;
% phi_1 = h1/R1; phi_2/R2;

% Teste manual
t = 0:0.01:pi;
phi_in = abs(sin(t));
% achar uma forma de na saida pegar os fluxos pois basta multicplicar H por
% R
phi_1 = abs(cos(t));
phi_2 = abs(sin(t));
delta_h1 = phi_in - phi_1;
delta_h2 = phi_1 - phi_2;

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
    
   % Valvula de entrada
   rectangle('Position', [minX - 0.5*planta.tanque_1.largura, 0.9*planta.tanque_1.altura, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_1.altura*phi_in(i)/max(phi_in)], 'FaceColor', 'blue');
   rectangle('Position', [minX - 0.5*planta.tanque_1.largura, 0.9*planta.tanque_1.altura, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_1.altura], 'EdgeColor', 'black');
   
   % Valvula de acoplamento
   rectangle('Position', [0, 0, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_2.altura*phi_1(i)/max(phi_1)], 'FaceColor', 'blue');
   rectangle('Position', [0, 0, 0.5*planta.tanque_1.largura, 0.1*planta.tanque_2.altura], 'EdgeColor', 'black');

   % Valvula de saida
   rectangle('Position', [0.5*planta.tanque_1.largura + planta.tanque_2.largura, minY + 0.1*planta.tanque_2.altura, 0.5*planta.tanque_2.largura, 0.1*planta.tanque_2.altura*phi_2(i)/max(phi_2)], 'FaceColor', 'blue');
   rectangle('Position', [0.5*planta.tanque_1.largura + planta.tanque_2.largura, minY + 0.1*planta.tanque_2.altura, 0.5*planta.tanque_2.largura, 0.1*planta.tanque_2.altura], 'EdgeColor', 'black');

   % Tanque 1
    rectangle('Position', [minX, 0, planta.tanque_1.largura, planta.tanque_1.altura_inicial+delta_h1(i)], 'FaceColor', 'blue');
    % rectangle('Position', [minX, 0, planta.tanque_1.largura, h1(i)], 'FaceColor', 'blue');
    rectangle('Position', [minX, 0, planta.tanque_1.largura, planta.tanque_1.altura], 'EdgeColor', 'black');
   
    % Tanque 2
    rectangle('Position', [0.5*planta.tanque_1.largura, minY + 1, planta.tanque_2.largura, planta.tanque_2.altura_inicial+delta_h2(i)], 'FaceColor', 'blue');
    % rectangle('Position', [0.5*planta.tanque_1.largura, minY + 1, planta.tanque_2.largura, h2(i)], 'FaceColor', 'blue');
    rectangle('Position', [0.5*planta.tanque_1.largura, minY + 1, planta.tanque_2.largura, planta.tanque_2.altura], 'EdgeColor', 'black');
    

    drawnow; 
    
end

% Adicionar opcao de salvar aqui

end