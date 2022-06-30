function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
C_set = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];%0.001; 0.003; 
sigma_set =  [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
predictions = zeros(size(yval));
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
e = 10000000; %max_passes=50;tol=0.0001;K=1;
for i=1:length(sigma_set);
    for j=1:length(C_set);
        C = C_set(j,1) ; sigma = sigma_set(i,1) ; 
         model = svmTrain(X, y,C, @(x1, x2) gaussianKernel(x1, x2,sigma));
       %[model] = svmTrain(X, y, C, sim, tol, max_passes) ;
        predictions = svmPredict(model, Xval); 
        J = mean(double(predictions ~= yval));
        if e>J; e = J; c = C_set(j,1) ;s = sigma_set(i,1) ; end;
    end;
end;
C = c ;sigma = s ; 

% =========================================================================

end
