function err = grad_check(oracle, t, varargin)

h = 1e-6;
d = size(t,1)*size(t,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete the function
% Hint: Use [f,g] = oracle(t, varargin{:}) to call oracle with the rest of the
% parameters
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[f,g] = oracle(t, varargin{:});

ghat = zeros(size(t,1)*size(t,2),1);

err = 0;
for j = 1:d

     t1 = t;
     t2 = t;
     t1(j) = t1(j)+h;
     t2(j) = t2(j)-h;

    [f1 g1] = oracle(t1, varargin{:});
    [f2 g2] = oracle(t2, varargin{:});
    ghat = ( f1 - f2 ) / (2*h);
   
    err = err + abs ( ghat - g(j) );
    
end

err = err/d;

% for j=1:10 %d
% A=A + H(:,j)
% end