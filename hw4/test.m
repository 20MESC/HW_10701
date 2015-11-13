K=5; 
class = 0; % default classification, 0 = no class assigned
    best_norm = 1e10; % set a default high norm value
    for j = 1:K
        diff = means(j,:)-X(1,:);
        res = norm(diff);
        if res < best_norm
            best_norm = res;
            class = j;
        end
    end