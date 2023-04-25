clc; clear;
rng(35,'twister')
[nf, mt, f, c] = flpData;
fun = @flp_cost; % Objective function handle
%Aeq = [1 -1]; % Coefficients of equality constraints
Aeq = [zeros(1, nf), ones(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf);
       zeros(1, nf), zeros(1, nf), ones(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf);
       zeros(1, nf), zeros(1, nf), zeros(1, nf), ones(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf);
       zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), ones(1, nf), zeros(1, nf), zeros(1, nf);
       zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), ones(1, nf), zeros(1, nf);
       zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf), zeros(1, nf),ones(1, nf)];
Beq = [1;1;1;1;1];
%beq = 3; % RHS of equality constraints
lb = [zeros(1, nf*mt + nf)];
ub = [ones(1, nf*mt + nf)];
nvar = length(lb); % No. of decision variables
%nonlcon = @NLConstraints;% Nonlinear constraint 
%function handle
% Calling the solver
intcon = [1:nf*mt + nf];
%options = optimoptions('fminsearch');
[x, fval] = ga(fun, nvar, [], [], [], [], lb, ub, [], intcon); 