function [controlador,Jval] = projetarControladorPSO (requisitos,planta)

% Define a função de custo
J = @(K) funcaoCustoTrMpGenerica(requisitos,planta,{'Ki','Kp','Kd'},@obterGf,true,K);

% Parâmetros do algoritmo PSO
num_particles = 40;
max_iterations = 100;

% Define os limites para os ganhos do controlador
lb = [0; 0; 0];
ub = [10; 10; 10];

% Otimização
options = optimoptions('particleswarm', 'SwarmSize', num_particles, 'MaxIterations', max_iterations);
[KOtimo, Jval] = particleswarm(J, 3, lb, ub); % Acrescentar options se quiser aqui

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