function plotarProjeto(tipo_de_projeto)
requisitos = obterRequisitos();
planta = obterPlanta();
controlador = obterControlador(tipo_de_projeto, requisitos, planta, '"iter"'); % '"iter"' or '"final"'
avaliarMalhaTanque(controlador, planta);

end