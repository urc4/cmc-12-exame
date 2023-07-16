function controlador = projetarControladorTanque2NelderMead(requisitos, planta)

% chute inicial obtido analiticamente
controlador0 = projetarControladorTanque2Analitico(requisitos, planta);
% otimizacao
controlador = projetarControladorNelderMeadGenerico(requisitos.tanque_2, planta, controlador0, @custoControladorTanque2);

end


function J = custoControladorTanque2(requisitos, planta, params_controlador, parametros)

J = funcaoCustoTrMpGenerica(requisitos, planta, params_controlador, @obterGfTanque2, true, parametros);

end


function Gf = obterGfTanque2(controlador, planta)
% apenas encapsulando obterMalhaTanque1 para retornar apenas Gf
    [~, Gf] = obterMalhaTanque2(controlador, planta);
end