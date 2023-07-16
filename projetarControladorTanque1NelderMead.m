function controlador = projetarControladorTanque1NelderMead(requisitos, planta)

% chute inicial obtido analiticamente
controlador0 = projetarControladorTanque1Analitico(requisitos, planta);
% otimizacao
controlador = projetarControladorNelderMeadGenerico(requisitos.tanque_1, planta, controlador0, @custoControladorTanque1);

end


function J = custoControladorTanque1(requisitos, planta, params_controlador, parametros)

J = funcaoCustoTrMpGenerica(requisitos, planta, params_controlador, @obterGfTanque1, true, parametros);

end


function Gf = obterGfTanque1(controlador, planta)
% apenas encapsulando obterMalhaTanque1 para retornar apenas Gf
    [~, Gf] = obterMalhaTanque1(controlador, planta);
end