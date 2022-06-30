function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples and o for the negative examples. X is assumed to be a Mx2 matrix.
% Create New Figure
clc; clear; close all; data = load('ex2data1.txt'); X = data(:, [1, 2]); y = data(:, 3); 
%% you must remove the previous line if you will use this function in different place, to exchange the values for X.y ;
figure;xlabel('EXAM 1 score'); ylabel('EXAM 2 score'); title('Figure 1: Scatter plot of training data'); axis([30 100 30 100]);  hold on;
px = []; nx = [];    % positive & negative element matrices
pc = []; nc = [];    % index of positive & negative elements;
m = length(y);
% ====================== YOUR CODE HERE ======================% Instructions: Plot the positive and negative examples on a 2D plot, using the option 'k+' for the positive examples and 'ko' for the negative examples.
for i = 1:m
    if(y(i,1) >= 0.5)
px = [px;X(i,:)]; pc = [pc;i]
else 
        nx = [nx;X(i,:)]; nc = [nc;i]
    end
end
    for p = 1:length(pc)
plot(px(p,1),px(p,2), 'k+', 'linewidth', 2,'MarkerSize', 7);
    end
    for n = 1:length(nc)
plot(nx(n,1),nx(n,2),'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);
    end
hold off;
legend('Admitted','Not admitted');
end