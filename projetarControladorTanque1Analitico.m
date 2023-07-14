function controlador = projetarControladorTanque1Analitico(requisitos, planta)
% controlador = projetarControladorTanque1Analitico(requisitos, planta)
% projeta o controlador de altura do tanque 1 atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.tr: requisito de tempo de subida de 0 a 100 por cento.
% requisitos.Mp: requisito de sobressinal.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaReguladorNiveis().
% A saida da funcao eh a struct controlador:
% controlador.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.Kd: ganho do termo derivativo do controlador de altura PID.

R1 = planta.tanque_1.R; A1 = planta.tanque_1.A;
tr = requisitos.tanque_1.tr; Mp = requisitos.tanque_1.Mp; 

xi = -log(Mp)/sqrt(pi^2 + (log(Mp))^2);
wn = (pi - acos(xi))/(tr*sqrt(1-xi^2));

Kd = 1;
Ki = ((R1*Kd + A1*R1)*wn^2)/R1;
Kp = (2*(R1*Kd + A1*R1)*xi*wn - 1)/R1;


% algum termo vai ter que ficar em funcao de outro entao teria que tomar um valor
% arbitrario para um deles se resolver malha fechada e ignorar os zeros que surgem no
% denominador

controlador.Ki = Ki;
controlador.Kp = Kp;
controlador.Kd = Kd;

end