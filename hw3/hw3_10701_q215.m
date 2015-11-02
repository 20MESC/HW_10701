%% Setup data and parameters
input = importdata('SVR_dataset.txt');
x=input(:,1);
y=input(:,2);
nl=length(x);

h=0.5;
epsilon=0.1;
C=4;

%create kernel matrix contained in Lagrangian expression to be optimized
kern_mat = zeros(nl);
for i=1:nl
    for j=1:nl
        kern_mat(i,j) = rbfKernel(x(i),x(j),h);
    end
end

%% Optimization to find argmax w.r.t. a and a_hat
cvx_begin
    variables a(nl) a_hat(nl);
    maximize(-(1/2)*[a-a_hat]'*kern_mat*[a-a_hat] - epsilon*sum(a_hat+a)+sum((a-a_hat).*y));
    subject to;
        0 <= a;
        a <= C;
        0 <= a_hat;
        a_hat <= C;
cvx_end


%% Plotting
%plot all training examples
hold on;
plot(x,y,'rx')

%find and plot support vectors
support_idxs = find(a > epsilon & a < C - epsilon);
support_idxs = [support_idxs ; find(a_hat > epsilon & a_hat < C - epsilon)];
plot(x(support_idxs),y(support_idxs),'go');


pred_x = x;
pred_y = zeros(nl,1);

%calculate the predicted function f(x)
for i=1:nl
    for j=1:nl
        pred_y(i)=pred_y(i)+(  (a(j)-a_hat(j))  *  rbfKernel(x(i),x(j),h)   );
    end
end

[ pred_x, sort_idx] = sort(pred_x);
plot(pred_x,pred_y(sort_idx),'r-');
