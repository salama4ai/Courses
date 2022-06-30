function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.
num_iters = 1500;
alpha = 0.01;
data = importdata('ex1data1.txt'); x = data(:,1); y = data(:,2); m = size(x,1); X = [ones(m, 1), x(:,1)];
theta = zeros(size(X, 2), 1);
X_norm = featureNormalize(X);
X = X_norm
theta = gradientDescent(X, y, theta, alpha, num_iters)

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------




% -------------------------------------------------------------


% ============================================================

end
