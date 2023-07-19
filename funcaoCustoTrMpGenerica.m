function J = funcaoCustoTrMpGenerica(requisitos, planta, params_controlador, funcao_obter_Gf, normalize, parametros)
% calcula o custo do controlador usando requisitos de rising time (tr)
% e overshoot (Mp) com entrada step
% ARGUMENTOS:
% requisitos:
%   A struct requisitos eh:
%       requisitos.tr: rising time
%       requisitos.Mp: overshoot
% planta:
%   A struct planta contem os parametros da planta e pode ser obtida atraves
%   de planta = obterPlantaServoPosicao().
% params_controlador:
%   cell array com nomes dos campos do controlador
%   Pode ser obtida e.g. via fieldnames(minha_struct_controlador)
% funcao_obter_Gf:
%   Funcao que recebe uma struct controlador e uma struct planta como
%   entradas e retorna APENAS Gf. É necessário encapsular sua função que
%   calcula Ga, Gf (se houver) de forma que ela retorne apenas Gf. Você
%   também pode usar Ga se quiser apesar do nome deste argumento.
% normalize:
%   Valor logico: true para usar a versao normalizada da funcao custo (a
%   qual atribui mesma importancia a tr e Mp) e false para a versão não
%   normalizada (veja o código para entender a diferença se não estiver claro)
% parametros:
%   O vetor parametros eh dado por [Ki Kp Kd].

% transforma formato vetor em struct
for k=1:numel(params_controlador)
    controlador.(params_controlador{k}) = parametros(k);
end
controlador.a = 100;

% Implementar
Gf = funcao_obter_Gf(controlador, planta);
sinfo = stepinfo(Gf, 'RiseTimeLimits', [0, 1]);

if normalize == true
    J = (sinfo.RiseTime/requisitos.tr - 1)^2 + (sinfo.Overshoot/(100*requisitos.Mp) - 1)^2;
else
    J = (sinfo.RiseTime - requisitos.tr)^2 + (sinfo.Overshoot/100 - requisitos.Mp)^2;
end

end