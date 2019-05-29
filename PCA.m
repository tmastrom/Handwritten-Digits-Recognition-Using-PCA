% PCA-Based Multi-Category Classificaton Algorithm

% uj is the class average of the training data 
% Uq is the q principal axes vectors for each class

% x is the new data points to be classified (Te28.mat)
% labels = Lte28.mat

function [class] = PCA (uj, Uq, x, labels, k)


for i = 1:10 

    imshow(reshape(x(:,k),[28 28]))
   
    xpt = x(:,k);
    
   
    % only for 1 element
    f1 = Uq(:,:,i)'* ( x(:,k) - uj(:,i) );
    
    x1 = Uq(:,:,i)*f1 + uj(:,i);
    
    e1(:,i) =  norm( xpt - x1 ); 




end

[e1, i] = min(e1);

class = i -1;
