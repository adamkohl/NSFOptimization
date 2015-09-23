function [x,fval,exitflag,output,population,score] = GA_sample_decomposed(nvars,lb,ub,intcon,PopulationSize_Data,Generations_Data,StallGenLimit_Data,TolFun_Data,TolCon_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'PopulationSize', PopulationSize_Data);
options = gaoptimset(options,'Generations', Generations_Data);
options = gaoptimset(options,'StallGenLimit', StallGenLimit_Data);
options = gaoptimset(options,'TolFun', TolFun_Data);
options = gaoptimset(options,'TolCon', TolCon_Data);
options = gaoptimset(options,'Display', 'final');
[x,fval,exitflag,output,population,score] = ...
ga(@satellite_objective,nvars,[],[],[],[],lb,ub,[],intcon,options);
end
