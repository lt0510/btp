function [nf, mt, f, c] = flpData
nf = 5; % number of potential facility locations
mt = 6; % number of demand points
f = [12 5 3 7 9]; % fixed costs of establishing facilities
% variable costs of serving demand points
c = [2 3 6 7 1;
     0 5 8 4 12;
     11 6 14 5 8;
     19 18 21 16 13;
     3 9 8 7 10;
     4 7 9 6 0];