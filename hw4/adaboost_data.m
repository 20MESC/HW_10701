clear;
figure; hold on;
xpos = [1 2 5 5];
ypos = [2 3 1 2];
xneg = [3 3 3 4 5];
yneg = [1 2 4 4 4];
plot(xpos, ypos, 'b^', 'linewidth', 3, 'markersize', 17);
plot(xneg, yneg, 'mo', 'linewidth', 3, 'markersize', 17);
text(1-0.4, 2, 'x_1', 'fontsize', 20);
text(2-0.4, 3, 'x_2', 'fontsize', 20);
text(3-0.4, 4, 'x_3', 'fontsize', 20);
text(3-0.4, 2, 'x_4', 'fontsize', 20);
text(3-0.4, 1, 'x_5', 'fontsize', 20);
text(4-0.4, 4, 'x_6', 'fontsize', 20);
text(5-0.4, 4, 'x_7', 'fontsize', 20);
text(5-0.4, 2, 'x_8', 'fontsize', 20);
text(5-0.4, 1, 'x_9', 'fontsize', 20);
set(gca,'FontSize',20);
axis([0 6 0 5]);
set(gca, 'YTick', 0:1:5);

% Draw some axis
yL = get(gca,'YLim');
xL = get(gca,'XLim');
line([.5 .5],yL,'Color','r');
line([1.5 1.5],yL,'Color','r');
line([2.5 2.5],yL,'Color','r');
line([3.5 3.5],yL,'Color','r');
line([4.5 4.5],yL,'Color','r');
line([5.5 5.5],yL,'Color','r');

line(xL,[.5 .5],'Color','r');
line(xL,[1.5 1.5],'Color','r');
line(xL,[2.5 2.5],'Color','r');
line(xL,[3.5 3.5],'Color','r');
line(xL,[4.5 4.5],'Color','r');

