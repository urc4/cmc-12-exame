function controlador = projetarControladorNelderMeadGenerico(requisitos, planta, controlador0, funcaoCusto)

% valores iniciais
% (transformar controlador0 em vetor de parametros)
x0 = [];
fn = fieldnames(controlador0);
for k=1:numel(fn)
    x0 = [x0 controlador0.(fn{k})];
end

% otimizacao
opcoes = optimset('Display', 'iter');
J = @(x) funcaoCusto(requisitos, planta, fn, x);
xOtimo = fminsearch(J, x0, opcoes);

% formar resposta
for k=1:numel(fn)
   controlador.(fn{k}) = xOtimo(k);
end

end
