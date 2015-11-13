function [ class ] = decision_stump(x,y,iter)

    switch iter
        case 1
            class = arrayfun(@zeroToNegOne,bsxfun(@lt, x, 2.5*ones(length(1),1)));
            
        case 2
            class = arrayfun(@zeroToNegOne,bsxfun(@lt, y, 3.5*ones(length(1),1)));
            
        case 3
           class = arrayfun(@zeroToNegOne,bsxfun(@lt, y, 2.5*ones(length(1),1)));
            
        otherwise
            
    end

end

function [out] = zeroToNegOne(in)
    if in == 1
        out = 1;
    else
        out = -1;
    end
end


