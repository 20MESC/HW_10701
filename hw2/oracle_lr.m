% Returns the function and gradient evaluated at w. 
% w: (d+1) x 1
% X: (d+1) x n
% y: 1 x n
function [f, g] = oracle_lr(w, X, y)

f = 0;
g = zeros(size(w));
lambda = ones(size(w)) * 10; % used in Q2.2.7
lambda(1) = 0; % do not penalize the bias term

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete the function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mu = sigmoid(w'*X); % mu = 1/(1+e^-(wT*Xi)) %this is our predicted label

% bishop form f = -1*sum(label*log(predictedLabel)+(1-label)*log(1-predictedLabel)
% this is negative log likelihood
% f is scalar
f = -1*sum( y.*log(mu) + (1-y).*(log(1-mu)) ) + (1/2)*(dot(lambda,w.^2));
% regularization constant at end

% bishop form g = sum(predictedLabel-Label)*(f.v. for individual label)
% g is (d+1) x 1
g = X*(mu - y)';
