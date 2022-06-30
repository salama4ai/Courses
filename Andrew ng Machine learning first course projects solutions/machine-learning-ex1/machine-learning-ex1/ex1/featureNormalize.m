function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
m = size(X, 2);
X_norm = X;
mu = zeros(1, m);
sigma = zeros(1, m);


% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma.     
mu = mean(X_norm,1);
sigma = std(X_norm,0,1);
for i=1:m
X_norm(i,:) = (X(i,:)-mu(1,:))/sigma(1,:)
end;
%X = X_norm;
% ============================================================
end