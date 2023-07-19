function planta = obterPlanta()
% planta = obterPlanta()
% Obtem os parametros da planta tanque de dois niveis desacoplado regulador
% de niveis de altura.

planta.tanque_1.A = 1;
planta.tanque_1.altura = 1;
planta.tanque_1.largura = 1;

planta.tanque_2.A = 1;
planta.tanque_2.altura = 1;
planta.tanque_2.largura = 1;

planta.R1 = 1.5;
planta.R2 = 1.5;

end