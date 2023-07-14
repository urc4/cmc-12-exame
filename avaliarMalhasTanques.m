function avaliarMalhasTanques(controlador, planta)
% avaliarMalhaTanque1(controlador, planta) avalia a malha de 
% altura do tanque 1 para verificar atendimento aos requisitos. 
% A struct controlador eh dada por:
% controlador.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.Kd: ganho do termo derivativo do controlador de altura PID.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlanta().

[Ga.tanque_1, Gf.tanque_1] = obterMalhaTanque1(controlador.tanque_1, planta);
[Ga.tanque_2, Gf.tanque_2] = obterMalhaTanque2(controlador.tanque_2, planta);

%% Tracando graficos

figure;
% Caso queira configurar resposta ao degrau manualmente para tanque 1
t = 5;
[y1, t1] = step(Gf.tanque_1, t); 
% [y1, t1] = step(Gf.tanque_1); 
plot(t1, y1, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('h_1 (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
% Caso queira que plote automaticamente
% step(Gf.tanque_1);
info.tanque_1 = stepinfo(Gf.tanque_1, 'RiseTimeLimits', [0, 1]);
title(sprintf('Resposta Degrau Tanque 1\nRiseTime = %g s\nOvershoot = %g', info.tanque_1.RiseTime, info.tanque_1.Overshoot));
grid on;
% print -dpng -r400 tanque_1_step.png % para usuarios de Word
% print -depsc2 tanque_1_step.eps % para usuarios de LaTeX

figure;
% Caso queira configurar resposta ao degrau manualmente para tanque 2
t = 5;
[y2, t2] = step(Gf.tanque_2, t); 
% [y2, t2] = step(Gf.tanque_2); 
plot(t2, y2, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('h_2 (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
% Caso queira que plote automaticamente
% step(Gf.tanque_2);
info.tanque_2 = stepinfo(Gf.tanque_2, 'RiseTimeLimits', [0, 1]);
title(sprintf('Resposta Degrau Tanque 2\nRiseTime = %g s\nOvershoot = %g', info.tanque_2.RiseTime, info.tanque_2.Overshoot));
grid on;
% print -dpng -r400 tanque_2_step.png % para usuarios de Word
% print -depsc2 tanque_2_step.eps % para usuarios de LaTeX

figure;
% Caso queira configurar resposta ao degrau manualmente para acoplamento de tanques
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('h_2 (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
% kh eh a relacao de niveis do tanque 1 e do tanque 2 
kh = 1;
h2r = y1*kh;
[ya,ta] = lsim(Gf.tanque_2,h2r,t1);
plot(ta, ya, 'LineWidth', 2);
info.acoplamento.RiseTime = interp1(ya, ta, 1*kh, "linear"); % tem um erro no risetime aqui
info.acoplamento.Overshoot = max(ya) - 1*kh; % assumindo que as osilacoes sao amortecidas, isto eh overshoot equivale ao maximo
title(sprintf('Resposta Tanque 2 para Entrada Degrau Tanque 1\nRiseTime = %g s\nOvershoot = %g', info.acoplamento.RiseTime, info.acoplamento.Overshoot));
grid on;
% print -dpng -r400 tanque_2_step_acoplamento.png % para usuarios de Word
% print -depsc2 tanque_2_step_acoplamento.eps % para usuarios de LaTeX


end