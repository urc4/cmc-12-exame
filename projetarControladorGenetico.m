function [controlador,Jval,EXITFLAG,funccount] = projetarControladorGenetico(requisitos,planta,display_mode)

% Define a função de custo
J = @(K)funcaoCustoTrMpGenerica(requisitos,planta,{'Ki','Kp','Kd'},@obterGf,true,K);

% Parâmetros do algoritmo genético
PopSize = 100;
MaxGenerations = 30;

% Define os limites para os ganhos do controlador
lb = [0; 0; 0];
ub = [10; 10; 10];

% Se quiser adicionar isso
%hybridopts = optimoptions('fmincon','OptimalityTolerance',1e-10);
%options = optimoptions('ga','HybridFcn',{'fmincon',hybridopts});
%[KOtimo,Jval] = ga(J,3,-eye(3),zeros(3,1),[],[],lb,ub,[],options);

% Otimização
options = optimoptions('ga','PopulationSize',PopSize,'MaxGenerations',MaxGenerations, 'Display',display_mode); %ver myfun aqui
[KOtimo, Jval, EXITFLAG, OUTPUT] = ga(J,3,-eye(3),zeros(3,1),[],[],lb,ub,[],options); %Jval é o valor minimo da função de custo
funccount = OUTPUT.funccount;

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