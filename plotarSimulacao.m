% Obtencao dos requisitos e planta
requisitos = obterRequisitos();
planta = obterPlantaMulticoptero();

% Obtencao do controladores de acordo com metodo analitico ou de otimizacao desejado
escolher_controlador = 'a';

if escolher_controlador == 'a'
   controlador = projetarControladorLambda(requisitos, planta);
elseif escolher_controlador == 'b'
   controlador = projetarControladorGenetico(requisitos,planta);
elseif escolher_controlador == 'c'
   controlador = projetarControladorNelderMead(requisitos,planta);
elseif escolher_controlador == 'd'
   controlador = projetarControladorPSO(requisitos,planta);
end

% Simulacao
experimento = 'a';
simulacao = simularExperimentoReguladorNiveis(controlador, planta, experimento);

% Tracar graficos da simulacao
tracarGraficosSimulacao(simulacao);
% acho que aqui teria que passar planta como argumento

% Fazer animacao
%fazerAnimacaoMulticoptero(simulacao, planta);



