function simulacao = simularExperimentoReguladorNiveis(controlador, planta, experimento)
% simulacao = simularExperimentoReguladorNiveis(controlador, planta,
% experimento) simula um experimento do regulador de niveis. As entradas da funcao
% controlador, planta e experimento. As structs controlador e planta contem
% os ganhos do controlador e os parametros da planta, respectivamente. O
% caractere experimento indica qual experimento deve ser executado.
% A struct controlador eh dada por:
% controlador.Kp: ganho proporcional do controlador.
% controlador.Ki: ganho integrativo do controlador.
% controlador.Kd: ganho derivativo do controlador.
% controlador.a: frequencia de passagem do termo derivativo do controlador.
% A struct planta eh dada por:
% planta.tanque_1.A: area da secao transversal do primeiro tanque.
% planta.tanque_1.altura: altura do primeiro tanque.
% planta.tanque_1.largura: largura do primeiro tanque.
% planta.tanque_2.A: area da secao transversal do segundo tanque.
% planta.tanque_2.altura: altura do segundo tanque.
% planta.tanque_2.largura: largura do segundo tanque.
% planta.R1 = resistencia da primeira valvula de fluxo
% planta.R2 = resistencia da segunda valvula de fluxo
% A saida eh a struct simulacao com as alturas geradas pela simulacao.

tf = 100;
h2r.signals.dimensions = 1;
dt = 1e-3;

if experimento == 'a'
   h2r.time = [0; tf];
   h2r.signals.values = [1; 1];
   simulacao = simularMulticoptero(controlador, planta, tf, h2r);
elseif experimento == 'b'
   h2r.time = [0; tf];
   h2r.signals.values = [1; 1];
   planta.R1 = 3;
   simulacao = simularMulticoptero(controlador, planta, tf, h2r);
end

% Armazenando qual experimento foi executado
simulacao.experimento = experimento;

end
