rng(42);  % seed para os numeros aleatorios
N = 5; % numero de simulações

% inicializando listas de métricas
for metodo = ["NelderMead", "Genetico", "PSO"]
    Jvals.(metodo) = [];
    funccounts.(metodo) = [];
    EXITFLAGs.(metodo) = [];
    Mps.(metodo) = [];
    trs.(metodo) = [];
end

% preenchendo as listas de métricas
for i = 1:N
    requisitos = obterRequisitos(true);  % true = "com aleatoriedade"
    planta = obterPlanta(true); % true = "com aleatoriedade"
    for metodo = ["NelderMead", "Genetico", "PSO"]
        [controlador, Jval, EXITFLAG, funccount] = obterControlador(char(metodo), requisitos, planta, '"final"');
        if EXITFLAG >= 0
            Jvals.(metodo) = [Jvals.(metodo) Jval];
            [~, Gf] = obterMalhaTanque(controlador, planta);
            info = stepinfo(Gf);
            Mps.(metodo) = [Mps.(metodo) info.Overshoot/100];
            trs.(metodo) = [trs.(metodo) info.RiseTime];
            funccounts.(metodo) = [funccounts.(metodo) funccount];
        end
        EXITFLAGs.(metodo) = [EXITFLAGs.(metodo) EXITFLAG];
    end
end

% plot
Jvals
funccounts
EXITFLAGs
Mps
trs