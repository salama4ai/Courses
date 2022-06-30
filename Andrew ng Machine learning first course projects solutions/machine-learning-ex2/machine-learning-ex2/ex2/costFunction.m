function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost w.r.t. to the parameters.
 grad = zeros(size(theta)); m = length(y);    %lg = zeros(size(X,1),1);  lgn = zeros(size(X,1),1); z = zeros(size(X,1),1); % number of training examples% You need to return the following variables correctly 
lg = zeros(m,1); lgn = zeros(m,1); z = zeros(m,1); hix = zeros(m,1); J = 0; f = ones(m,1); Y = zeros(m,1); Y = (y.'); B = zeros(1,m);  B(1,:) = Y(1,:)-1
% ====================== YOUR CODE HERE ======================% Instructions: Compute the cost of a particular choice of theta.%               You should set J to the cost.
%Compute the partial derivatives and set grad to the partial derivatives of the cost w.r.t. each parameter in theta% Note: grad should have the same dimensions as theta
z = X*theta; hix = sigmoid(z);
lg = log(hix); k = (f-hix); lgn = log(k);  J = (1/m)*((-Y*lg)+(B*lgn));
% J = (1/m)*((-(y.')*(log10(hix)))+(((y.')-ones(1,m))*log10((ones(size(hix))-hix))));
    for j = 1:length(theta); grad(j,1) = (1/m).*(((hix-y).')*X(:,j));  end; 
end
%                                        clc; clear ; close all; submit;