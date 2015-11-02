function s = sigmoid(a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete this function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s = 1./(1+(exp(-a)));
% pulled formula from Bishop text
% 1/(1+e^(-x))