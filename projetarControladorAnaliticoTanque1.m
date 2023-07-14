function controlador = projetarControladorAnaliticoTanque1(requisitos, planta)
% controlador = projetarControladorAnaliticoTanque1(requisitos, planta)
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

xi = 2;
wn = 3;

Kd = 1;
Kp = 4*Kd;
Ki = 5*Kd;


% algum termo vai ter que ficar em funcao de outro entao teria que tomar um valor
% arbitrario para um deles se resolver malha fechada e ignorar os zeros que surgem no
% denominador

controlador.Ki = Ki;
controlador.Kp = Kp;
controlador.Kd = Kd;



end