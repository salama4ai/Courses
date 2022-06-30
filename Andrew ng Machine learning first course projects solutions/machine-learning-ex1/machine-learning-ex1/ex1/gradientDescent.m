function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%num_iters = 1500;alpha = 0.01;
J_history = zeros(num_iters, 1);
%data = importdata('ex1data1.txt'); x = data(:,1); y = data(:,2); m = size(x,1);  X = [ones(m, 1), x(:,1)];
             %                                 X =[1, 5; 1, 2; 1, 4; 1, 5]; y = [1; 6; 4; 2];     theta = [0;0] 
 m = length(y); v = zeros(m,1); hix = zeros(m,1); f = size(theta,1); 
 
for iter = 1:num_iters
hix = X*(theta);
v(:,1)=hix(:,1)-y(:,1);
theta(1,1) = theta(1,1)+((-alpha/m)*((ones(1,m)*(v))));
%theta(2,1) = theta(2,1)+((-alpha/m)*((v.')*X(:,2)));
for q = 2:f ; theta(q,1) = theta(q,1)+((-alpha/m)*((v.')*X(:,q))); end  ;
    J_history(iter) = computeCost(X, y, theta);
end;       
%computeCost(X, y, [-1 ; 2])
%J_history.*1
%theta
end