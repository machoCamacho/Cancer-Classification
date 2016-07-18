% addpath('C:\Users\Alejandro\Desktop\Cancer-Classification\DNA Data')
addpath(genpath(pwd))
%%
% load data 
[X, Y ] = readData('imputed_prostate.xls');
[n, m ] =size(X);
lambda = 1;
B = zeros(1, m)';
U = ones(1,n);
W = eye(n)*.25;
P = logfcn(B,X)';
alpha_tilde = log(mean(Y)/(1-mean(Y)));

eta = alpha_tilde + X*B;

% Equation 12
gamma_tilde = [alpha_tilde ;B]';
Z = [U' X];
R = eye(m+1,m+1); R(1,1) =0;
AA = (Z'*W*Z+lambda*R);
BB = Z'*((Y-P)+W*Z*gamma_tilde');

result = AA\BB;

