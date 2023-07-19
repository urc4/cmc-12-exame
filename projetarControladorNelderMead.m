function [controlador,Jval] = projetarControladorNelderMead(requisitos, planta)

% Define a função de custo
J = @(K) funcaoCustoTrMpGenerica(requisitos, planta, {'Ki','Kp','Kd'}, @obterGf, true, K);

% Chute inicial
controlador0 = projetarControladorTunando(requisitos, planta);

% Otimização
K0 = [controlador0.Ki, controlador0.Kp, controlador0.Kd];
opcoes = optimset('Display', 'iter');
KOtimo = fminsearch(J, K0, opcoes);

% Extrai os parâmetros ótimos
Jval = J(KOtimo);
controlador.Ki = KOtimo(1);
controlador.Kp = KOtimo(2);
controlador.Kd = KOtimo(3);
controlador.a = 100;

end


function Gf = obterGf(controlador, planta)
% encapsulando obterMalhaTanque1 para retornar apenas Gf
    [~, Gf] = obterMalhaTanque(controlador, planta);
end