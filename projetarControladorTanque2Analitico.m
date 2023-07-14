function controlador = projetarControladorTanque2Analitico(requisitos, planta)
% controlador = projetarControladorTanque2Analitico(requisitos, planta)
% projeta o controlador de altura do tanque 2 atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.tr: requisito de tempo de subida de 0 a 100 por cento.
% requisitos.Mp: requisito de sobressinal.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaReguladorNiveis().
% A saida da funcao eh a struct controlador:
% controlador.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.Kd: ganho do termo derivativo do controlador de altura PID.

R1 = planta.tanque_1.R; R2 = planta.tanque_2.R; A1 = planta.tanque_2.A;
tr = requisitos.tanque_2.tr; Mp = requisitos.tanque_2.Mp; 

xi = -log(Mp)/sqrt(pi^2 + (log(Mp))^2);
wn = (pi - acos(xi))/(tr*sqrt(1-xi^2));

Kd = 1;
Ki = ((R2*Kd + R1*A2*R2)*wn^2)/R2;
Kp = (2*(R2*Kd + R1*A2*R2)*xi*wn - R1)/R2;


% algum termo vai ter que ficar em funcao de outro entao teria que tomar um valor
% arbitrario para um deles se resolver malha fechada e ignorar os zeros que surgem no
% denominador

controlador.Ki = Ki;
controlador.Kp = Kp;
controlador.Kd = Kd;

end