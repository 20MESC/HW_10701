% Returns the accuracy of multiclass classifier W
% W: (d+1) x c
% X: (d+1) x n
% y: 1 x n
function acc = multiclass_accuracy(W, X, y)

pred = zeros(size(y));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete this function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=W'*X;
ea=exp(a);

mu = bsxfun(@rdivide, ea, sum(ea,1));

[~, pred] = max(mu,[],1);


nacc = sum(y == pred);
acc = nacc / length(y);
