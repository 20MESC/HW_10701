addpath helper

images = load_mnist_images('data/train-images-idx3-ubyte');
labels = load_mnist_labels('data/train-labels-idx1-ubyte');
display_network(images(:,1:100)); % print first 100 images

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Explore the data
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. Size of each image:
    display_network(images(:,1));
    size(images(:,1)); % 1 x 784


% 2. Range of labels:
    min(labels); % = 0
    max(labels); % = 9
    
    
% 3. Range of pixel values:
    min(images); % = 0
    max(images); % = 1
    
% 4. Max and Min L2-norm of the images
    for i = 1:size(images,2)
        L2(i) = norm(images(:,i),2);
    end
    min(L2); % = 3.5698
    max(L2); % = 17.1790
    
% 5. Check whether data is sparse or dense
    % Sparsity is defined by: # of nonzero elements / total # of elements
    nonzero = nnz(images);
    nonzero/(size(images,1)*size(images,2)); % = .192
    % around 19% of matrix entries are nonzero
    % according to my research on the internet a density of 19% is still
    % not sparse enough to warrant using the sparse storage format in
    % MATLAB. By observation, I would say it looks sparse, but from a
    % computational standpoint, 19% density is stil pretty high.
    
% 6. Labels distribution skewness
    histfit(labels)
    skewness(labels),kurtosis(labels); % skewness = .0259 (fairly uniform with slight right skew)
    