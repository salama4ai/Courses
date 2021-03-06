function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
% Setup some useful variables
m = size(X, 1);
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
K = size(Theta2,1); Y = zeros(K,length(y)); % I PUTTED G INSTEAD OF X ; ONLY BECAUSE I FEEL THAT THERE IS WRONG IN PROGRAM , AND IT LOOP 4 TIMES!!!!! ; SO G===X;
G = [ones(m,1),X]; z2 = Theta1*(G.'); a2 = sigmoid(z2); a2 = [ones(1,size(a2,2));a2]; z3 = Theta2*(a2); a3 = sigmoid(z3); for j = 1:length(y); if y(j,1)==0; y(j,1)=10; end; Y(y(j,1),j) = 1; end;
H = ((-Y*(log(a3.')))+((Y-ones(size(Y)))*log(ones(size(a3.'))-a3.'))) ;  J =0;for o = 1:K J=J+H(o,o);end;   J = (J/(m)) ;
%H = ((-Y.*(log(a3)))+((Y-ones(size(Y))).*log(ones(size(a3))-a3))) ; J=(ones(1,K)*H)*ones(length(y),1); J = (J/m) ;
Th1 = Theta1(:,[2:end]); The1 = Th1.*Th1;  cTh1 = (ones(1,size(The1,1))*The1)*ones(size(The1,2),1); Th2 = Theta2(:,[2:end]); The2 = Th2.*Th2; cTh2 = (ones(1,size(The2,1))*The2)*ones(size(The2,2),1); 
reg = (lambda/(2*m))*(cTh1+cTh2); J = J + reg;
% Unroll gradients

grad = [Theta1_grad(:) ; Theta2_grad(:)];
end  %                                        clc; clear ; close all; submit;