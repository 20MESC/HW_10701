function [proj] = rbfKernel(xi,xj,h)
%RBFKERNEL Summary of this function goes here
%   Detailed explanation goes here

num = norm(xi-xj,2)^2;
den = 2*h^2;
proj = exp(-1*(num/den));


end

