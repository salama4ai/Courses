function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 
% Initialize some useful values
m = length(y); % number of training examples
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
%lg = zeros(m,1); lgn = zeros(m,1); z = zeros(m,1); hix = zeros(m,1);
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
z = X*theta; hix = sigmoid(z);
o = ((theta.')*theta)-theta(1,1)*theta(1,1)
%lg = log(hix); k = (f-hix); lgn = log(k);  J = ((1/m)*((-Y*lg)+(B*lgn)))+((lambda/(2*m))*o);
 J = (1/m)*((-(y.')*(log(hix)))+(((y.')-ones(1,m))*log((ones(size(hix))-hix))))+((lambda/(2*m))*o);
    for j = 1:length(theta); grad(j,1) = (1/m).*(((hix-y).')*X(:,j));  end; 
    for j = 2:length(theta); grad(j,1) = grad(j,1)+(lambda/m)*theta(j,1); end;
end
%                                        clc; clear ; close all; submit;