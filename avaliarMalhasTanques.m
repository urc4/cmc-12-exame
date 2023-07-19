function avaliarMalhasTanques(controlador, planta)
% avaliarMalhaTanque1(controlador, planta) avalia a malha de
% altura do tanque 1 para verificar atendimento aos requisitos.
% A struct controlador eh dada por:
% controlador.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.Kd: ganho do termo derivativo do controlador de altura PID.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlanta().

[~, Gf] = obterMalhaTanque(controlador, planta);

%% Tracando graficos
figure;
[y, t] = step(Gf);
plot(t, y, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('h_2 (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
info = stepinfo(Gf, 'RiseTimeLimits', [0, 1]);
title(sprintf('Resposta Degrau\nRiseTime = %g s\nOvershoot = %g', info.RiseTime, info.Overshoot/100));
grid on;
% print -dpng -r400 analitico_step.png % para usuarios de Word
% print -depsc2 analitico_step.eps % para usuarios de LaTeX

end