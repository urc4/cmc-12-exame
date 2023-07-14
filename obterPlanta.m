function planta = obterPlanta()
% planta = obterPlanta()
% Obtem os parametros da planta tanque de dois niveis desacoplado regulador
% de niveis de altura.

planta.tanque_1.A = 10;
planta.tanque_1.altura_inicial = 5; % onde coloca no simulink, talvez aqui estariamos complicando ...
planta.tanque_1.altura = 10; % aqui como faria para considerar: bloco de saturacao
planta.tanque_1.largura = 10; 

planta.tanque_2.A = 10;
planta.tanque_2.altura_inicial = 5; % onde coloca no simulink
planta.tanque_2.altura = 10; % aqui como faria para considerar: bloco de saturacao
planta.tanque_2.largura = 10; 

planta.R1 = 5;
planta.R2 = 5;

planta.rho = 1000;

end