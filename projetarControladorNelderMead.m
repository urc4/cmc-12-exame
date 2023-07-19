function [controlador,Jval,EXITFLAG,funccount] = projetarControladorNelderMead(requisitos, planta, display_mode)

% Define a função de custo
J = @(K) funcaoCustoTrMpGenerica(requisitos, planta, {'Ki','Kp','Kd'}, @obterGf, true, K);

% Chute inicial
controlador0 = projetarControladorTunando(requisitos, planta);

% Otimização
K0 = [controlador0.Ki, controlador0.Kp, controlador0.Kd];
opcoes = optimset('Display', display_mode);
[KOtimo, Jval, EXITFLAG, OUTPUT] = fminsearch(J, K0, opcoes);
funccount = OUTPUT.funcCount;

% Extrai os parâmetros ótimos
controlador.Ki = KOtimo(1);
controlador.Kp = KOtimo(2);
controlador.Kd = KOtimo(3);
controlador.a = 100;

end


function Gf = obterGf(controlador, planta)
% encapsulando obterMalhaTanque1 para retornar apenas Gf
    [~, Gf] = obterMalhaTanque(controlador, planta);
end