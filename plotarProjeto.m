function plotarProjeto(tipo_de_projeto)

planta = obterPlanta();
controlador = obterControlador(tipo_de_projeto);
avaliarMalhaTanque(controlador, planta);

end