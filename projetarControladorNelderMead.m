function [controlador,Jval] = projetarControladorNelderMead(requisitos, planta)

% chute inicial
controlador0 = projetarControladorTunando(requisitos, planta);
% otimizacao
K0 = [controlador0.Ki, controlador0.Kp, controlador0.Kd];
opcoes = optimset('Display', 'iter');
J = @(K) funcaoCustoTrMpGenerica(requisitos, planta, {'Ki','Kp','Kd'}, @obterGf, true, K);
KOtimo = fminsearch(J, K0, opcoes);
Jval = J(xOtimo);
controlador.Ki = KOtimo(1);
controlador.Kp = KOtimo(2);
controlador.Kd = KOtimo(3);
controlador.a = 100;

end


function Gf = obterGf(controlador, planta)
% encapsulando obterMalhaTanque1 para retornar apenas Gf
    [~, Gf] = obterMalhaTanque(controlador, planta);
end