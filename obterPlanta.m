function planta = obterPlanta()
% planta = obterPlanta()
% Obtem os parametros da planta tanque de dois niveis desacoplado regulador
% de niveis de altura.

planta.tanque_1.A = 10;
planta.tanque_1.h_max = 10; % aqui como faria para considerar: bloco de saturacao

planta.tanque_2.A = 10;
planta.tanque_2.h_max = 10; % aqui como faria para considerar: bloco de saturacao

planta.R1 = 5;
planta.R2 = 5;

planta.rho = 1000;

end