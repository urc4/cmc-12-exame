function fazerAnimacaoReguladorNiveis(simulacao, planta)

% Resultados da simulacao
% Por enquanto vamos gerar dados

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
   rectangle('Position', [minX - 5, planta.tanque_1.altura - 1, 5, phi_in(i)/max(phi_in)], 'FaceColor', 'blue');
   rectangle('Position', [minX - 5, planta.tanque_1.altura - 1, 5, 1], 'EdgeColor', 'black');
   
   % Valvula de acoplamento
   rectangle('Position', [0, 0, 5, phi_1(i)/max(phi_1)], 'FaceColor', 'blue');
   rectangle('Position', [0, 0, 5, 1], 'EdgeColor', 'black');

   % Valvula de saida
   rectangle('Position', [5 + planta.tanque_1.largura, minY + 1, 5, phi_2(i)/max(phi_2)], 'FaceColor', 'blue');
   rectangle('Position', [5 + planta.tanque_1.largura, minY + 1, 5, 1], 'EdgeColor', 'black');

   % Tanque 1
    rectangle('Position', [minX, 0, planta.tanque_1.largura, planta.tanque_1.altura_inicial+delta_h1(i)], 'FaceColor', 'blue');
    rectangle('Position', [minX, 0, planta.tanque_1.largura, planta.tanque_1.altura], 'EdgeColor', 'black');
   
    % Tanque 2
    rectangle('Position', [5, minY + 1, planta.tanque_2.largura, planta.tanque_2.altura_inicial+delta_h2(i)], 'FaceColor', 'blue');
    rectangle('Position', [5, minY + 1, planta.tanque_2.largura, planta.tanque_2.altura], 'EdgeColor', 'black');
    

    drawnow; 
    
end

% Adicionar opcao de salvar aqui

end