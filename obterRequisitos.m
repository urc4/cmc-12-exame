function requisitos  = obterRequisitos(noise)
% requisitos = obterRequisitos() obtem os requisitos das malhas de altura de tanque 1
% e malha de altura de tanque 2,

if noise
    requisitos.tr = 3 + 7*rand; % U[3, 10]
    requisitos.Mp = 0.1 + .1*rand; % U[0.1, 0.2]
else
    requisitos.tr = 10;
    requisitos.Mp = 0.1;
end

end