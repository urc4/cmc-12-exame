function [fval,controlador] = projetarControladorNelderMead(requisitos, planta)

% chute inicial
controlador0 = projetarControladorTunando(requisitos, planta);
% otimizacao
x0 = [controlador0.Ki, controlador0.Kp, controlador0.Kd];
opcoes = optimset('Display', 'iter');
J = @(x) funcaoCustoTrMpGenerica(requisitos, planta, {'Ki','Kp','Kd'}, @obterGf, true, x);
xOtimo = fminsearch(J, x0, opcoes);
fval = J(xOtimo);
controlador.Ki = xOtimo(1);
controlador.Kp = xOtimo(2);
controlador.Kd = xOtimo(3);
controlador.a = 100;

end


function Gf = obterGf(controlador, planta)
% encapsulando obterMalhaTanque1 para retornar apenas Gf
    [~, Gf] = obterMalhaTanque(controlador, planta);
end