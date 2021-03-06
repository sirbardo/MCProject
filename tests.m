for n = [10 100 500 1000 2000 5000 10000] %different sizes

n
    
A = rand(n);
A = 100*A;
A = A'*A;
soluz = ones(n,1);
b = A*soluz;

%MATLAB CHOL
tic;
R = chol(A);
matlabchol_time = toc

y = R'\b;
x = R\y;
error_matlabchol = norm(x-soluz)

%MATLAB QR
tic;
[Q, R] = qr(A);
matlabqr_time = toc

c = Q'*b;
x = R\c;
error_matlabqr = norm(x-soluz)


%CHOLESKY
tic;
[R] = CholeskyColonne(A);
choltime = toc

y = R'\b;
x = R\y;
error_chol = norm(x-soluz)

%GIVENSIMPLICITO
tic;
[R, C, S] = QRGivensQuadrate(A);
qrgivensimplicito = toc

c = b;
for i = 1:n
    for j = i+1:n
        sin = S(i,j);
        cos = C(i,j);
        csupp = c;
        xi = csupp(i);
        xj = csupp(j);
        
        c(i) = cos*xi+sin*xj;
        c(j) = -sin*xi+cos*xj;
    end
end  
x = R\c;
error_givens = norm(x-soluz)


%HOUSEHOLDER
tic;
[Q, R] = QRHouseholderQuadrate(A);
qrhouseholdertime = toc
c = Q'*b;
x = R\c;
error_householder = norm(x-soluz)

end

