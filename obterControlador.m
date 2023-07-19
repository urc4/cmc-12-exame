function controlador = obterControlador(tipo_de_projeto)
% controlador = obterControladorAnalitico(requisitos, planta)
% A
% struct requisitos eh:
% requisitos.tr: requisito de tempo de subida de 0 a 100 por cento.
% requisitos.Mp: requisito de sobressinal para cada tanque
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlanta().
% A saida da funcao eh a struct controlador:
% controlador.tanque_1.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.tanque_1.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.tanque_1.Kd: ganho do termo derivativo do controlador de altura PID.
% controlador.tanque_2.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.tanque_2.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.tanque_2.Kd: ganho do termo derivativo do controlador de altura PID.

planta = obterPlanta();
requisitos = obterRequisitos();
nome_da_funcao = ['projetarControlador', tipo_de_projeto];
controlador = eval([nome_da_funcao, '(requisitos,planta)']);

end