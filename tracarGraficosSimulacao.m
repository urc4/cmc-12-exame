function tracarGraficosSimulacao(simulacao)
% tracarGraficosSimulacao(simulacao) traca graficos de uma simulacao de
% regulagem dos niveis dos tanques.

formato = 'png'; % para usuarios de Word
% formato = 'eps'; % para usuarios de LaTeX

figure;
hold on;
plot(simulacao.h2r.time, simulacao.h2r.signals.values, 'r', 'LineWidth', 2);
plot(simulacao.h1.time, simulacao.h1.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Altura (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Referencia h_2r', 'Executado h_1');
grid on;
axis equal;
%salvarGrafico(sprintf('h1_%c', simulacao.experimento), formato);

figure;
hold on;
plot(simulacao.h2r.time, simulacao.h2r.signals.values, 'r', 'LineWidth', 2);
plot(simulacao.h2.time, simulacao.h2.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Altura (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Referencia h_2r', 'Executado h_2');
grid on;
axis equal;
%salvarGrafico(sprintf('h2_%c', simulacao.experimento), formato);

figure;
hold on;
plot(simulacao.c.time, simulacao.c.signals.values, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Fluxo de entrada comandado (m^3/s)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Executado phi_in');
grid on;
axis equal;
%salvarGrafico(sprintf('phi_in_%c', simulacao.experimento), formato);

figure;
hold on;
plot(simulacao.h1.time, simulacao.h1.signals.values/planta.R1, 'r', 'LineWidth', 2);
plot(simulacao.h2.time, simulacao.h2.signals.values/planta.R2, 'b', 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Fluxos Altura (m^3/s)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend('Fluxo phi_1', 'Fluxo phi_2');
grid on;
axis equal;
%salvarGrafico(sprintf('fluxos_%c', simulacao.experimento), formato);

end

function salvarGrafico(nome, formato)
% Salva o grafico corrente.
% nome: nome do arquivo.
% formato: formato do arquivo ('png' ou 'eps').

if strcmp(formato, 'png')
   print('-dpng', '-r400', nome);
else
   print('-depsc2', nome);
end

end