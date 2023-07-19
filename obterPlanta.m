function planta = obterPlanta(noise)
% planta = obterPlanta()
% Obtem os parametros da planta tanque de dois niveis desacoplado regulador
% de niveis de altura.

planta.tanque_1.A = 1;
planta.tanque_1.altura = 1.2;
planta.tanque_1.largura = 1;

planta.tanque_2.A = 1;
planta.tanque_2.altura = 1.2;
planta.tanque_2.largura = 1;

planta.R1 = 1.5;
planta.R2 = 1.5;

if noise
    planta.tanque_1.A = planta.tanque_1.A + .5*randn;
    planta.tanque_1.A = max(0.1, planta.tanque_1.A); % truncar a minimo razoavel
    
    %planta.tanque_1.largura = planta.tanque_1.largura + .2*randn;
    %planta.tanque_1.largura = max(0.1, planta.tanque_1.largura); % truncar a minimo razoavel

    planta.tanque_2.A = planta.tanque_2.A + .5*randn;
    planta.tanque_2.A = max(0.1, planta.tanque_2.A); % truncar a minimo razoavel
    
    %planta.tanque_2.largura = planta.tanque_2.largura + .2*randn;
    %planta.tanque_2.largura = max(0.1, planta.tanque_2.largura); % truncar a minimo razoavel

    planta.R1 = planta.R1 + .5*randn;
    planta.R2 = planta.R2 + .5*randn;
end