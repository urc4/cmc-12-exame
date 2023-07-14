function [planta, requisitos] = obterVariantesSistema(planta, requisitos, variante)
% [planta, requisitos] = obterVariantesSistema(planta, requisitos, variante) retorna uma
% variante do problema
% Melhorar documentacao indicando como functiona cada struct
% Acredito que a ideia dessa funcao ate seja valida, mas gerar um script que 
% avalia os resultados para um conjunto de valores possiveis de tr para cada tanque seja mais 
% valido como o caso da funcao avaliarIndutor.m do lab 3
% gerar resultados da otimizacao para diferentes valores de tr por exemplo

if variante == 'a'
   requisitos.tanque_1.tr = 10;
elseif variante == 'b'
   planta.tanque_1.A = 5;
end

end