clear
clc
data = load('kmeans_data.csv');

K = 5;    % # of means
M = 50;   % max # of iterations
X = data; % feature vector

num_exs = size(X,1);
num_fts = size(X,2);


% initialize with K 'means' (5 training exs randomly sampled uniformly)
for i = 1:K
    
    means_k(i,:) = X(randi(num_exs),:);
    
end

iter = 0;
prev_obj = 0; % initialize prev_obj to high unlikely value
cur_obj = -10e10; % dummy initialization

% while current iteration is less than max iterations and objective
% function has different value than last iteration
while (iter < M) && (cur_obj ~= prev_obj)

    % assign class membership to each of the training examples
    for i = 1:num_exs

        class = 0; % default classification, 0 = no class assigned
        best_norm = 1e10; % set a default high norm value

        for j = 1:K
            jth_norm = norm((means_k(j,:)-X(i,:))); % calculate norm for each mean
            if  jth_norm < best_norm
                best_norm = jth_norm; % take best norm (smallest)
                class = j; % save which class (mean) it belonged to
            end
        end

        C(i,:) = class; % classes for each traning example Ck

    end
    
    %%% DEBUG
    
    for i = 1:K
        idxs = find(C==i); % indexes of entries that are members of Ck
        fprintf('class %i',i);
        nk = length(idxs)
    end
    %%%%    
        

    % for each k, recalculate means for all features for training examples of
    % class k
    for i = 1:K
        idxs = find(C==i); % indexes of entries that are members of Ck
        nk = length(idxs); % number of entries that belong to Ck

        means_k(i,:) = mean(X(idxs,:)); % calculate means for each feature for training example members of Ck

    end
    disp(iter);
    iter = iter + 1;
    prev_obj = cur_obj;
    cur_obj = calc_obj(X,C,K);
    
    
end