function plotarProjeto(tipo_de_projeto)

planta = obterPlanta();
controlador = obterControlador(tipo_de_projeto, '"iter"'); % '"iter"' or '"final"'
avaliarMalhaTanque(controlador, planta);

end