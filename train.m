% D is the trainin data set with 10 classes
% q is the number of principal axes to be used 

% returns 
% the class average u, 
% Uq is the q principal axes vectors for each class
function [u, U] = train (D, q) 

close all
% create subsets
% each subset is a different class 
d0 = D(1:784,1:1600);
d1 = D(1:784,1601:3200);
d2 = D(1:784, 3201:4800);
d3 = D(1:784, 4801:6400);
d4 = D(1:784, 6401:8000);
d5 = D(1:784, 8001:9600);
d6 = D(1:784, 9601:11200);
d7 = D(1:784, 11201:12800);
d8 = D(1:784, 12801:14400);
d9 = D(1:784, 14401:16000);

Dj(:,:,1) = d0;
Dj(:,:,2) = d1;
Dj(:,:,3) = d2;
Dj(:,:,4) = d3;
Dj(:,:,5) = d4;
Dj(:,:,6) = d5;
Dj(:,:,7) = d6;
Dj(:,:,8) = d7;
Dj(:,:,9) = d8;
Dj(:,:,10) = d9;


% mean values 
for i = 1:10
    
    % u matrix of mean vectors 
    u(:,i) = mean(Dj(:,:,i)'); 
    
     figure()
     imshow(reshape(u(:,i),[28,28]));

    
    % data matrix A
    A = bsxfun(@minus, Dj(:,:,i), u(:,i));
    A = A';
    % use c to compute the covariance of the class 
    C(:,:,i) = cov(A(:,:));   % size of C is 1600 by 1600
    
%     figure
%     imshow(C(:,:,i),[]);

    [Uq, Sq] = eigs(C(:,:,i), q);
    
    U(:,:,i) = Uq;
    
end % training the data









