% Put negative lexicon in Pre array
negVocabFID = fopen('opinion-lexicon-English/negative-words.txt');
negVocabPre = textscan(negVocabFID,'%s');
negVocabPre{1}(1:213) = [];

% Put positive lexicon in Pre array
posVocabFID = fopen('opinion-lexicon-English/positive-words.txt');
posVocabPre = textscan(posVocabFID,'%s');
posVocabPre{1}(1:213) = [];

% Construct full feature vector
featureVector = [ negVocabPre{1}(:) ; posVocabPre{1}(:) ];


% Get File List
% neg
file = dir('review_polarity/txt_sentoken/neg');
for i = 3:802%size(file)%only go from 000 to 799 for training
    negTrainList{i-2,1} = strcat('review_polarity/txt_sentoken/neg/',file(i).name);
    % first two spots were empty, so move em up.
end

% pos
file = dir('review_polarity/txt_sentoken/pos');
for i = 3:802%size(file)%only go from 000 to 799 for training
    posTrainList{i-2,1} = strcat('review_polarity/txt_sentoken/pos/',file(i).name);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start with negative reviews
countVector_neg=zeros(1,6789);
for i = 1:length(negTrainList);
   % Open Training File
   negTrainFID = fopen(negTrainList{i});
   negTrainTextPre = textscan(negTrainFID,'%s');
   negTrainText = negTrainTextPre{1}(1:length(negTrainTextPre{1}));
   fclose(negTrainFID);
 
   % Find words within feature vector that are in training doc
   [C,ia,ib] = intersect(negTrainText,featureVector);
   % Check Intersection of TrainingText and FeatureVector
   % Returns Intersection, indices for Train Text and indices for
   % featureVector (the most latter is what we care about)
   
   % Increment count for any feature vector word found in training doc
   % (both + and - words)
   for j=1:length(ib)
            countVector_neg(ib(j)) = countVector_neg(ib(j)) + 1;
   end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do Positive reviews
countVector_pos=zeros(1,6789);
for i = 1:length(posTrainList);
   % Open Training File
   posTrainFID = fopen(posTrainList{i});
   posTrainTextPre = textscan(posTrainFID,'%s');
   posTrainText = posTrainTextPre{1}(1:length(posTrainTextPre{1}));
   fclose(posTrainFID);
 
   % Find words within feature vector that are in training doc
   [C,ia,ib] = intersect(posTrainText,featureVector);
   
   % Increment count for any feature vector word found in training doc
   % (both + and - words)
   for j=1:length(ib)
            countVector_pos(ib(j)) = countVector_pos(ib(j)) + 1;
   end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%
% Neg Class, Neg Sentiment

%do this to split countVectors by word sentiment
countVector_negSent_neg = countVector_neg(1:4783);
countVector_posSent_neg = countVector_neg(4784:6789);
countVector_negSent_pos = countVector_pos(1:4783);
countVector_posSent_pos = countVector_pos(4784:6789);

[~, b] = sort(countVector_negSent_neg, 'descend');
featureVector(b(1:10))

%%
%Neg Class, Pos Sentiment

[~, b] = sort(countVector_posSent_neg, 'descend');
featureVector(4783+b(1:10))

%%
%Pos Class, Neg Sentiment

[~, b] = sort(countVector_negSent_pos, 'descend');
featureVector(b(1:10))

%%
%Pos Class, Pos Sentiment
[~, b] = sort(countVector_posSent_pos, 'descend');
featureVector(4783+b(1:10))