% Obtencao dos requisitos e planta
requisitos = obterRequisitos(0);
planta = obterPlanta(0);

% Obtencao do controladores de acordo com metodo analitico ou de otimizacao desejado
escolher_controlador = 'a';
display_mode = 'iter';
if escolher_controlador == 'a'
   controlador = projetarControladorTunando(requisitos, planta, display_mode);
elseif escolher_controlador == 'b'
   controlador = projetarControladorGenetico(requisitos,planta, display_mode);
elseif escolher_controlador == 'c'
   controlador = projetarControladorNelderMead(requisitos,planta,display_mode);
elseif escolher_controlador == 'd'
   controlador = projetarControladorPSO(requisitos,planta, display_mode);
end

% Simulacao
experimento = 'a';
simulacao = simularExperimentoReguladorNiveis(controlador, planta, experimento);

% Tracar graficos da simulacao
tracarGraficosSimulacao(simulacao, simulacao.planta);

% Fazer animacao
fazerAnimacaoReguladorNiveis(simulacao, simulacao.planta);


