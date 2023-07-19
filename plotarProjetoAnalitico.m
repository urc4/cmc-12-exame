requisitos = obterRequisitos();
planta = obterPlanta();
controlador = projetarControladorTunando(requisitos, planta);
avaliarMalhasTanques(controlador, planta)

