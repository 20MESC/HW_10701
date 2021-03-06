% Oracle mlr returns the function and gradient evaluated at w. 
% W: (d+1) x c
% X: (d+1) x n
% y: 1 x n
function [f, g] = oracle_mlr(W, X, y)

f = 0;
g = zeros(size(W));
Lambda = ones(size(W)) * 10;
Lambda(1,:) = 0; % do not penalize the bias term

% Y(i,j) = 1 if y(j) == i, otherwise 0
Y = full(sparse(y, 1:length(y), 1)); % c x n

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete this function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=W'*X;
ea=exp(a);

mu = bsxfun(@rdivide, ea, sum(ea,1));
lmu = log(mu);

%(bish: y) mu: (cxn)
%(bish: t) Y: (cxn)

%objective function
f = -1*sum(sum(Y.*lmu)) + (1/2)*(sum(dot(Lambda,W.^2)));

%with regularization constant added

% gradient
g = X*(mu-Y)';