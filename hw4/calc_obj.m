function obj = calc_obj(X,C,K)
    
    for k = 1:K
        idxs = find(C==k); % indexes of entries that are members of Ck
        nk = length(idxs); % number of entries that belong to Ck
    
        Xi = X(idxs,:); % subset of X that belongs to class Ck in compact matrix
        acc = 0;
        for i = 1:nk
            for j = 1:nk
                
                acc = acc + (norm(Xi(i,:)-Xi(j,:))).^2;
                
            end
        end
        
        obj_k(k) = acc/nk;
        
    end
    
    obj = sum(obj_k)
    

end