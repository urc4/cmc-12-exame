function simulacao = simularReguladorNiveis(controlador, planta, tf, h2r)
% simulacao = simularReguladorNiveis(controlador, planta, tf, h2r)
% simula os niveis de fluido em cada um dos tanques para uma entrada h2r.
% A entrada controlador eh dada por:
% controlador.Kp: ganho proporcional do controlador.
% controlador.Ki: ganho integrativo do controlador.
% controlador.Kd: ganho derivativo do controlador.
% controlador.a: frequencia de passagem do termo derivativo do controlador.
% A entrada planta eh dada por:
% planta.tanque_1.A: area da secao transversal do primeiro tanque.
% planta.tanque_1.altura: altura do primeiro tanque.
% planta.tanque_1.largura: largura do primeiro tanque.
% planta.tanque_2.A: area da secao transversal do segundo tanque.
% planta.tanque_2.altura: altura do segundo tanque.
% planta.tanque_2.largura: largura do segundo tanque.
% planta.R1 = resistencia da primeira valvula de fluxo
% planta.R2 = resistencia da segunda valvula de fluxo
% tf eh o tempo final da simulacao.
% h2r eh a referencia de altura h2 (usada num bloco From Workspace).
% A saida eh a struct simulacao com as alturas geradas pela simulacao.

% Configurando as variaveis usadas no Simulink
assignin('base', 'h2r', h2r);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);

% Carregando o Simulink
load_system('regulador_niveis');

% Configurando o tempo final de simulacao
set_param('regulador_niveis', 'StopTime', sprintf('%g', tf));

% Rodando a simulacao
simulacao = sim('regulador_niveis');

end