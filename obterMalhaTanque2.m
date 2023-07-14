function [Ga, Gf] = obterMalhaTanque2(controlador, planta)
% [Ga, Gf] = obterMalhaCorrente(controlador, planta) obtem as funcoes de 
% transferencia de malha aberta Ga e fechada Gf da malha de altura do tanque 2.
% A struct controlador eh dada por:
% controlador.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.Kd: ganho do termo derivativo do controlador de altura PID.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlanta().

s = tf('s');

R1 = planta.R1; R2 = planta.R2; A2 = planta.tanque_2.A; 
Ki = controlador.Ki; Kp = controlador.Kp; Kd = controlador.Kd;

G = R2/(R1*(A2*R2*s + 1));
C = (Ki + Kp*s + Kd*s^2)/s;

Ga = C*G;
Ga = minreal(Ga);

Gf = Ga/(1 + Ga);
Gf = minreal(Gf);

end
