function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

data = importdata('ex1data1.txt'); x = data(:,1); y = data(:,2); m = size(x, 1); X = [ones(m,1),x];

theta = zeros(size(X, 2), 1);

for i=1:m
X_norm(i,:) = (X(i,:)-mu(1,:))/sigma(1,:)
end;
X=X_norm;
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%
% ---------------------- Sample Solution ----------------------
X= X*(theta)
% -------------------------------------------------------------
% ============================================================
end