requisitos = obterRequisitos();
planta = obterPlanta();
controlador = obterControladorNelderMead(requisitos, planta);
avaliarMalhasTanques(controlador, planta)

