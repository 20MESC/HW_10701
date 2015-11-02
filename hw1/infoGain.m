% Rosario Scalise
% 9-20-15
% Calculates info gain between Y and A
% Give input probs in the form ( Y_pos, Abranch1_pos, Abranch2_pos, branch1weight)  
% will calculate other probs with 1-prob since this is only implemented for
% binary attribute/binary class config

function [ gain ] = infoGain( Y_pos, Abr1_pos, Abr2_pos, weight_pos )

    gain = entropy([Y_pos (1-Y_pos)])-(weight_pos)*entropy([Abr1_pos (1-Abr1_pos)])-(1-(weight_pos))*entropy([Abr2_pos (1-Abr2_pos)])
    
end

