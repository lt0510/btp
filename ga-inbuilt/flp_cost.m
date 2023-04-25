function f = flp_cost(x)
% Define problem parameters
[n, m, fc, c] = flpData;
% Extract decision variables
y = x(1:n); % binary variable indicating whether facility i is established (y_i = 1 if facility i is established, and 0 otherwise)
%z = reshape(x(n+1:end), n, m); % binary variable indicating whether demand point j is served by facility i 
z = x(n+1:2*n);
for j = 1:m-1
    z = [z; x(n+ j*n +1: n+ (j+1)*n)];
end
% (x_ij = 1 if demand point j is served by facility i, and 0 otherwise)
% Calculate total cost
cost = sum(sum(c.*z)) + sum(fc.*y);

%constraint 1: Each demand point is assigned to exactly one facility
P1 = 0; % penalty parameter for constraint 1
of = zeros(m, 1);
for j = 1:m
    of(j) = (sum(z(j)) - 1)^2;
end
P1 = sum(of);
%constraint 2: The assigned facility is open
P2 = 0; % penalty parameter for constraint 2
for j = 1:n
    fj = z(:, j);
    for k = 1:m
        if fj(k) > y(j)
            P2 = 1;
            break;
        end
    end
end
f = cost + (1000)*(P1+P2);



