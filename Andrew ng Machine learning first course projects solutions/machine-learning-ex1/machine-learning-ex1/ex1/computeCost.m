function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y
% Initialize some useful values
m = length(y);
%theta = [theta(1,1);theta(2,1)]
hix = zeros(m,1); 
hix = X*(theta);
v(:,1)=hix(:,1)-y(:,1)
J = 0;
J = ((1/(2*m))*(ones(1,m)*(v.^2)));
%J_history = J
end
