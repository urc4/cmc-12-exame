function controlador = obterControlador(tipo_de_projeto, requisitos, planta, display_mode)
% controlador = obterControlador(requisitos, planta, display_mode)
% A
% struct requisitos eh:
% requisitos.tr: requisito de tempo de subida de 0 a 100 por cento.
% requisitos.Mp: requisito de sobressinal para cada tanque
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlanta().
% A saida da funcao eh a struct controlador:
% controlador.Ki: ganho do termo integrativo do controlador de altura PID.
% controlador.Kp: ganho do termo proporcional do controlador de altura PID.
% controlador.Kd: ganho do termo derivativo do controlador de altura PID.

nome_da_funcao = ['projetarControlador', tipo_de_projeto];
[controlador,Jval,EXITFLAG,funccount] = eval([nome_da_funcao, '(requisitos,planta,', display_mode, ')'])

end