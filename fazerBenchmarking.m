rng(42);  % seed para os numeros aleatorios
N = 20; % numero de simulações

% inicializando listas de métricas
for metodo = ["NelderMead", "Genetico", "PSO"]
    Jvals.(metodo) = [];
    funccounts.(metodo) = [];
    EXITFLAGs.(metodo) = [];
    Mps.(metodo) = []; %  ! APESAR DO NOME, SERÁ |Mp-Mp_ref|/Mp_ref
    trs.(metodo) = []; %  ! APESAR DO NOME, SERÁ |tr-tr_ref|/tr_ref
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
            info = stepinfo(Gf, "RiseTimeLimits", [0,1]);
            Mps.(metodo) = [Mps.(metodo) abs(requisitos.Mp - info.Overshoot/100)/requisitos.Mp];
            trs.(metodo) = [trs.(metodo) abs(requisitos.tr - info.RiseTime)/requisitos.tr];
            funccounts.(metodo) = [funccounts.(metodo) funccount];
        end
        EXITFLAGs.(metodo) = [EXITFLAGs.(metodo) EXITFLAG];
    end
end

% plot


% converte metodos para categoricos com msm tamanho que os vetores de
% metricas (exceto EXITFLAGs que teoricamente poderia ser maior) e faz um
% "flatten" manual nos vetores de métricas. O objetivo é ter os dados nos
% formatos usados pelas funçoes de plot.
grupos = [];
Jvals_all = [];
funccounts_all = [];
Mps_all = [];
trs_all = [];
for metodo = ["NelderMead", "Genetico", "PSO"]
    for x = 1:numel(Jvals.(metodo))
        grupos = [grupos, metodo];
        Jvals_all = [Jvals_all Jvals.(metodo)(x)];
        funccounts_all = [funccounts_all funccounts.(metodo)(x)];
        Mps_all = [Mps_all Mps.(metodo)(x)];
        trs_all = [trs_all trs.(metodo)(x)];
    end
end
metodos = categorical(grupos, ["NelderMead", "Genetico", "PSO"]);
% é diferente paa EXITFLAGs pois a gnt só acrecenta elementos nas outras
% metricas qd EXITFLAG >= 0, logo os vetores EXITGLAGs podem ser maiores
EXITFLAGs_all = [];
for metodo = ["NelderMead", "Genetico", "PSO"]
    EF_0_1 = [0 0 0];
    for x = EXITFLAGs.(metodo)
        if x == 0 || x == 1
            EF_0_1(round(x) + 1) = EF_0_1(round(x) + 1) + 1;
        else
            EF_0_1(3) = EF_0_1(3) + 1;
        end
    end
    EXITFLAGs_all = [EXITFLAGs_all; EF_0_1];
end



% Jvals
figure;
boxchart(metodos, log(Jvals_all));
set(gca, 'FontSize', 14);
title("log_e(J(x_{opt}))");
print -dpng -r400 logJopts.png % para usuarios de Word
print -depsc2 logJopts.eps % para usuarios de LaTeX
figure;
boxchart(metodos, Jvals_all);
set(gca, 'FontSize', 14);
title("J(x_{opt})");
print -dpng -r400 Jopts.png % para usuarios de Word
print -depsc2 Jopts.eps % para usuarios de LaTeX

% funccounts
figure;
boxchart(metodos, log(funccounts_all));
set(gca, 'FontSize', 14);
title("log_e(Núm. Avaliações da função de custo)");
print -dpng -r400 logfunccounts.png % para usuarios de Word
print -depsc2 logfunccounts.eps % para usuarios de LaTeX
figure;
boxchart(metodos, funccounts_all);
set(gca, 'FontSize', 14);
title("Núm. Avaliações da função de custo");
print -dpng -r400 funccounts.png % para usuarios de Word
print -depsc2 funccounts.eps % para usuarios de LaTeX

% Overshoots
figure;
stem(1:length(Mps.NelderMead), [Mps.NelderMead' Mps.Genetico' Mps.PSO']);
legend(["NelderMead", "Genetico", "PSO"], Location="best");
set(gca, 'FontSize', 14);
title("|Overshoot - Overshoot_{ref}|/Overshoot_{ref}");
xlabel('experimento', 'FontSize', 14);
print -dpng -r400 relativeMpsErrors.png % para usuarios de Word
print -depsc2 relativeMpsErrors.eps % para usuarios de LaTeX

% Rising Times
figure;
stem(1:length(trs.NelderMead), [trs.NelderMead' trs.Genetico' trs.PSO']);
legend(["NelderMead", "Genetico", "PSO"], Location="best");
set(gca, 'FontSize', 14);
title("|tr - tr_{ref}|/tr_{ref}");
xlabel('experimento', 'FontSize', 14);
print -dpng -r400 relativeTrsErrors.png % para usuarios de Word
print -depsc2 relativeTrsErrors.eps % para usuarios de LaTeX

% EXITFLAG
% --
