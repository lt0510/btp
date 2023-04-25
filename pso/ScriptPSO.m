clc
clear


rng(34,'twister')
%dim = 2;
%[lb,ub,dim,FITNESSFCN] = FunctionDetails(F,dim);
FITNESSFCN = @flp1;
[nf, mt, f, c] = flpData;
%lb = zeros(1, nf);
%ub = ones(1, nf);
lb = [zeros(1, nf*mt + nf)];
ub = [ones(1, nf*mt + nf)];
NPop = 100;
Maxiter = 500;
w = 0.7; c1 = 2; c2 = 2;

[Xbest,Fbest] = PSOfunc(FITNESSFCN,NPop,lb,ub,Maxiter,w,c1,c2)

%[Xbest,Fbest] = PSOfunc1(FITNESSFCN,NPop,lb,ub,Maxiter,w,c1,c2)