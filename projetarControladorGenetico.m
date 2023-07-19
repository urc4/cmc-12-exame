function [controlador,Jval] = projetarControladorGenetico(requisitos,planta)

% Define a função de custo
J = @(K)funcaoCustoTrMpGenerica(requisitos,planta,{'Ki','Kp','Kd'},@obterGf,true,K);

% Parâmetros do algoritmo genético
PopSize = 100;
MaxGenerations = 30;

% Otimização
options = optimoptions('ga','PopulationSize',PopSize,'MaxGenerations',MaxGenerations); %ver myfun aqui
[KOtimo,Jval] = ga(J,3,-eye(3),zeros(3,1),[],[],[],[],[],options); %Jval é o valor minimo da função de custo

% Extrai os parâmetros ótimos
controlador.Ki = KOtimo(1);
controlador.Kp = KOtimo(2);
controlador.Kd = KOtimo(3);
controlador.a = 100;
end 

function Gf = obterGf(controlador, planta)
% encapsulando obterMalhaTanque para retornar apenas Gf
    [~, Gf] = obterMalhaTanque(controlador, planta);

end