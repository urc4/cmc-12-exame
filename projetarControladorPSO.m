function [fval, controlador] = projetarControladorPSO (requisitos,planta)

% Define the cost function
J = @(x) funcaoCustoTrMpGenerica(requisitos,planta,{'Ki','Kp','Kd'},@obterGf,true,x);

% PSO parameters
num_particles = 40;
max_iterations = 100;
%c1 = 2; % cognitive parameter
%c2 = 2; % social parameter
%w = 0.7; % inertia weight

% Define the bounds for the PID parameters
lb = [0.01 0.01 0.01];
ub = [10 10 10];

% Run PSO optimization
options = optimoptions('particleswarm', 'SwarmSize', num_particles, 'MaxIterations', max_iterations);
[xOtimo, fval] = particleswarm(J, 3, lb, ub, options);

% Extract the optimized PID parameters
controlador.Ki = xOtimo(1);
controlador.Kp = xOtimo(2);
controlador.Kd = xOtimo(3);
controlador.a = 100;

end

function Gf = obterGf(controlador, planta)
% encapsulando obterMalhaTanque para retornar apenas Gf
    [~, Gf] = obterMalhaTanque(controlador, planta);

end