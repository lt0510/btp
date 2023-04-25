clc                                 % To clear the command window
clear                               % To clear the workspace

%% Problem settings
[nf, mt, f, c] = flpData;
lb = [zeros(1, nf*mt + nf)];
ub = [ones(1, nf*mt + nf)];
prob = @flp1;                  % Fitness function


%% Parameters for Genetic Algorithm
Np = 50;                            % Population Size
T = 100;                            % No. of iterations
etac = 20;                         % Distribution index for crossover
etam = 20;                         % Distribution index for mutation
Pc = 0.8;                          % Crossover probability
Pm = 0.2;                          % Mutation probability


rng(2,'twister')

[bestsol,bestfitness] = GeneticAlgorithm(prob,lb,ub,Np,T,etac,etam,Pc,Pm);