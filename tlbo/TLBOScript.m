clc
clear
close all

%% Problem settings
%[product,l,m,h,il,im,ih,cl,cm,ch,SP,rm1,rm2,rm3,nProcess] = ProductionPlanningData;
%lb = zeros(1,nProcess);
%ub = h';
[nf, mt, f, c] = flpData;
%lb = [zeros(1, nf), ones(1, mt)]; % zeros(1, nf+mt)
%ub = [ones(1, nf), nf*ones(1, mt)];
lb = [zeros(1, nf*mt + nf)];
ub = [ones(1, nf*mt + nf)];
prob = @flp1;     % Fitness function

%% Algorithm parameters
Np = 100;                            % Population Size
T = 100;                             % No. of iterations

rng(30,'twister')                % Controlling the random number generator used by rand, randi
[bestsol,bestfitness,BestFitIter, BestFitFE,~,~] = TLBO(prob,lb,ub,Np,T);

Stat(1,1) = min(bestfitness);             % Determining the best fitness function value
Stat(1,2) = max(bestfitness);             % Determining the worst fitness function value
Stat(1,3) = mean(bestfitness);            % Determining the mean fitness function value
Stat(1,4) = median(bestfitness);          % Determining the median fitness function value
Stat(1,5) = std(bestfitness);             % Determining the standard deviation

n = 0;
for j = 1:T+1
    if BestFitIter(j) <0
        n = n +1;
        y(n) = BestFitIter(j);
        x(n) = j;
    end
end
%plot(x,y,'*')
plot(BestFitFE)
hold on
xlabel('Function Evaluations')
ylabel('Best fitness function value')

