% PCA-Based Multi-Category Classificaton Algorithm

% uj is the class average of the training data 
% Uq is the q principal axes vectors for each class

% x is the new data points to be classified (Te28.mat)
% labels = Lte28.mat

function [Accuracy] = PCA (uj, Uq, x, labels, k)


for i = 1:10 

    %imshow(reshape(x(:,k),[28 28]))
    
    f(:,:,i) = Uq(:,:,i)'* bsxfun(@minus, x, uj(:,i));
    
    xhat(:,:,i) = Uq(:,:,i)*f(:,:,i) + uj(:,i);
    
    e(:,:,i) = vecnorm( x - xhat(:,:,i) );
    

end

[E, I] = min(e,[],3);

I = I'; 
I = I -1;
n = 10000 - nnz(I == labels)

Accuracy = (10000 - n)/10000; 


