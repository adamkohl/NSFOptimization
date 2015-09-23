clc
clear all
format longEng
tic;
nvars = 34;
lb = [10^9 10^9 10 5 300 0.5 0.5 2 2 0 66 25 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
ub = [100*10^9 100*10^9 100 100 10000 2.5 2.5 20 20 360 125 50 2 2 4 3 3 4 4 4 4 2 2 2 2 4 3 3 4 2 2 2 2 2];
intcon = [3 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34];
PopulationSize_Data = 300;
TolFun_Data = 1e-10;
TolCon_Data = 1e-10;
Generations_Data = 10000;
StallGenLimit_Data = 50;


[x,fval] = GA_sample_decomposed_constrained(nvars,lb,ub,intcon,PopulationSize_Data,...
    Generations_Data,StallGenLimit_Data,TolFun_Data,TolCon_Data)
toc;

