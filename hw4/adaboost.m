x=[xneg xpos]'
y=[yneg ypos]'

m=length([xneg xpos]);
D=(1/m)*ones(m,1);

idx=1;

y_pred = decision_stump(x,y,idx);

