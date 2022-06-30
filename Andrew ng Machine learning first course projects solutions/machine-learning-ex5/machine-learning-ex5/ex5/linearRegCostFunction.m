function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
hix = X*(theta);
v(:,1)=hix(:,1)-y(:,1)
thetad=[0;theta([2:end],1)];
%o = ((theta.')*theta)-((theta(1,1)).^2)
o = thetad.'*thetad;
%J = 0; J = ((1/(2*m))*(ones(1,m)*(v.^2)))+((lambda/(2*m))*o); another solution
J = 0; J = ((1/(2*m))*(v.'*v))+((lambda/(2*m))*o);
for i=1:length(theta); grad(i,1) = ((1/m)*(X(:,i).'*v))+(lambda/m)*thetad(i,1);end;
grad = grad(:);
end