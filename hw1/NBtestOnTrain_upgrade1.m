% Get File List
% neg
file = dir('review_polarity/txt_sentoken/neg');
for i = 3:802%size(file)%only go from 800 to 999 for training
    negTestList{i-2,1} = strcat('review_polarity/txt_sentoken/neg/',file(i).name);
   
end

% pos
file = dir('review_polarity/txt_sentoken/pos');
for i = 3:802%size(file)%only go from 000 to 799 for training
    posTestList{i-2,1} = strcat('review_polarity/txt_sentoken/pos/',file(i).name);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Classify Neg Test Files

% Initialize counts for classification
count_predPos_actNeg = 0;
count_predNeg_actNeg = 0;


for z = 1:800
    % Open Test File
    negTestFID = fopen(negTestList{z});
    negTestTextPre = textscan(negTestFID,'%s');
    negTestText = negTestTextPre{1}(1:length(negTestTextPre{1}));
    fclose(negTestFID);


    % Create Occurance Vector for Test File
    % < 0, 0, 0, 1, 0, 1, ......, 0, 1, 0 >
    [C,ia,ib] = intersect(negTestText,featureVector);
    occVector = zeros(1,length(featureVector));
    for i=1:length(ib)
       occVector(ib(i)) = 1;
       
       %added this check to see if word is a negation
      %if so, ommit counting its sub-word by subtracting from its count
      if (ib(i) > 6789) && (ib(i) < 6789*2) %for 'not '
        occVector(ib(i-6789)) = 0;
      elseif (ib(i) > 6789*2) %for 'n't 
        occVector(ib(i-6789*2)) = 0;
      end
       
    end


    % Classify
    % use log to avoid numerical instability
    val = log(pi_pos/pi_neg);
    for i=1:length(occVector)
        val = val +  occVector(i)*log( thetaVector_pos(i)/thetaVector_neg(i) ) + (1-occVector(i))*log ( (1-thetaVector_pos(i))/(1-thetaVector_neg(i)) ) ;
    end

    % Increment counts based upon classification result
    % my strange naming just means its the count for pos or neg
    % prediction with a tag for the actual class after
    if  val>=0
        count_predPos_actNeg = count_predPos_actNeg + 1;
    else
        count_predNeg_actNeg = count_predNeg_actNeg + 1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classify Pos Test Files

count_predPos_actPos = 0;
count_predNeg_actPos = 0;

for z = 1:800
    % Open Test File
    posTestFID = fopen(posTestList{z});
    posTestTextPre = textscan(posTestFID,'%s');
    posTestText = posTestTextPre{1}(1:length(posTestTextPre{1}));
    fclose(posTestFID);


    % Create Occurance Vector for Test File
    % < 0, 0, 0, 1, 0, 1, ......, 0, 1, 0 >
    [C,ia,ib] = intersect(posTestText,featureVector);
    occVector = zeros(1,length(featureVector));
    for i=1:length(ib)
       occVector(ib(i)) = 1;
       
       %added this check to see if word is a negation
          %if so, ommit counting its sub-word by subtracting from its count
          if (ib(i) > 6789) && (ib(i) < 6789*2) %for 'not '
            occVector(ib(i-6789)) = 0;
          elseif (ib(i) > 6789*2) %for 'n't 
            occVector(ib(i-6789*2)) = 0;
          end
       
    end


    % Classify
    % use log to avoid numerical instability
    val = log(pi_pos/pi_neg);
    for i=1:length(occVector)
        val = val +  occVector(i)*log( thetaVector_pos(i)/thetaVector_neg(i) ) + (1-occVector(i))*log ( (1-thetaVector_pos(i))/(1-thetaVector_neg(i)) ) ;
    end

    % Increment counts based upon classification result
    % my strange naming just means its the count for pos or neg
    % prediction with a tag for the actual class after
    if  val>=0
        count_predPos_actPos = count_predPos_actPos + 1;
    else
        count_predNeg_actPos = count_predNeg_actPos + 1;
    end
end


% Tally scores
accuracyNeg = count_predNeg_actNeg/(count_predPos_actNeg + count_predNeg_actNeg);
accuracyPos = count_predPos_actPos/(count_predPos_actPos + count_predNeg_actPos);

%# of correct prediction / total # of predictions
accuracyTotal = (count_predNeg_actNeg + count_predPos_actPos)/(count_predPos_actNeg + count_predNeg_actNeg+count_predPos_actPos + count_predNeg_actPos)

