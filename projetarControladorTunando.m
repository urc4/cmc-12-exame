function controlador = projetarControladorTunando(requisitos, planta,display_mode)
% controlador = projetarControladorTunado(requisitos, planta)
% projeta o controlador de altura do tanque atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.tr: requisito de tempo de subida de 0 a 100 por cento.
% requisitos.Mp: requisito de sobressinal.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlanta().
% display_mode está lá por compatibilidade com outros scripts, mas é
% ignorado
% A saida da funcao eh a struct controlador:
% controlador.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.Kd: ganho do termo derivativo do controlador de altura PID.

R1 = planta.R1; A1 = planta.tanque_1.A;
R2 = planta.R2; A2 = planta.tanque_2.A;

s = tf('s');
G1 = R1/(A1*R1*s + 1);
G2 = R2/(R1*(A2*R2*s + 1));
G = G1*G2;
G = minreal(G);

[y,t] = step(G);
y_inf = y(end);
porcentagem = 0.632*y_inf;
indice_porcentagem = min(find(y >= porcentagem, 1));

Tp = t(indice_porcentagem);
T_DT = t(min(find(y > 0.1) - t(1)));
lambda = Tp/3;
Kp = (lambda / Tp) * (1 + 0.5 * T_DT / Tp);
Ti = lambda * (1 + 0.5 * T_DT / Tp);
Td = lambda * (0.125 * T_DT / Tp);
Kd = Kp*Td;
Ki = Kp/Ti;

controlador.Ki = Ki;
controlador.Kp = Kp;
controlador.Kd = Kd;
controlador.a = 100;
end