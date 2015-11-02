% Rosario Scalise
% 9-20-15
% Calculates entropy of r.v. X given the list of probabilities of possible
% values
function [ ntrpy ] = entropy( probs )
    
    %probs = numsOfprobs./(sum(numsOfprobs));

    sum=0;
    
    %Expected Value weighted by # of bits needed to encode
    for i = 1:length(probs)
        sum = sum + probs(i)*log2(probs(i)); 
    end
    
    ntrpy = -1*sum;

end

