function [fval,controlador] = projetarControladorAlgoritmoGenetico(requisitos,planta)

PopSize = 100;
MaxGenerations = 30;

options = optimoptions('ga','PopulationSize',PopSize,'MaxGenerations',MaxGenerations); %ver myfun aqui
[xOtimo,fval] = ga(@(K)funcaoCustoTrMpGenerica(requisitos,planta,{'Ki','Kp','Kd'},@obterGf,true,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options); %fval é o valor minimo da função de custo 
controlador.Ki = xOtimo(1);
controlador.Kp = xOtimo(2);
controlador.Kd = xOtimo(3);
controlador.a = 100;

end 

function Gf = obterGf(controlador, planta)
% encapsulando obterMalhaTanque para retornar apenas Gf
    [~, Gf] = obterMalhaTanque(controlador, planta);

end