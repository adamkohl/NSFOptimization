clc
clear all
format longEng
tic;
nvars = 36;
lb = [10^9 10^9 10 5 300 0.1 0.1 2 2 0 66 25 66 25 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
ub = [100*10^9 100*10^9 100 300 10000 5 5 20 20 360 125 50 125 50 2 2 4 3 3 4 4 4 4 2 2 2 2 4 3 3 4 2 2 2 2 2];
% For constrained optimization
        % lb = [10^9 10^9 10 5 300 0.5 0.5 2 2 0 66 25 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
        % ub = [100*10^9 100*10^9 100 100 10000 2.5 2.5 20 20 360 125 50 2 2 4 3 3 4 4 4 4 2 2 2 2 4 3 3 4 2 2 2 2 2];
intcon = [3 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36];
PopulationSize_Data = 300;
TolFun_Data = 1e-10;
TolCon_Data = 1e-10;
Generations_Data = 10000;
StallGenLimit_Data = 50;
[x,fval,exitflag,output] = ...
    GA_sample_decomposed(nvars,lb,ub,intcon,PopulationSize_Data,Generations_Data,StallGenLimit_Data,TolFun_Data,TolCon_Data)
toc;
% 
% 
% x =
% 
%   Columns 1 through 5
% 
%     94.2806426937676e+009    61.4887633649283e+009    61.0000000000000e+000    5.03146517346528e+000    1.00407673072119e+003
% 
%   Columns 6 through 10
% 
%     203.831021358923e-003    105.867953279194e-003    7.02506103355743e+000    3.81335484289127e+000    300.120917587131e+000
% 
%   Columns 11 through 15
% 
%     103.095823450746e+000    42.5375543101341e+000    108.885140504621e+000    37.5773000925750e+000    2.00000000000000e+000
% 
%   Columns 16 through 20
% 
%     2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000
% 
%   Columns 21 through 25
% 
%     2.00000000000000e+000    3.00000000000000e+000    2.00000000000000e+000    2.00000000000000e+000    1.00000000000000e+000
% 
%   Columns 26 through 30
% 
%     2.00000000000000e+000    2.00000000000000e+000    4.00000000000000e+000    1.00000000000000e+000    3.00000000000000e+000
% 
%   Columns 31 through 35
% 
%     3.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
% 
%   Column 36
% 
%     1.00000000000000e+000
% 
% 
% fval =
% 
%    -318.968228279062e+006
% 
% 
% exitflag =
% 
%     1.00000000000000e+000
% 
% 
% output = 
% 
%       problemtype: 'integerconstraints'
%          rngstate: [1x1 struct]
%       generations: 354.000000000000e+000
%         funccount: 106.501000000000e+003
%           message: 'Optimization terminated: average change in the penalty fitness value less than options.TolFun
% and constraint...'
%     maxconstraint: 0.00000000000000e+000
% 
% Elapsed time is 339.762324 seconds.