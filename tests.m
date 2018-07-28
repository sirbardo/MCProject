for n = [10 100 500 1000 2000 5000 10000] %different sizes

n
    
A = rand(n);
A = 100*A;
A = A'*A;
soluz = ones(n,1);
b = A*soluz;

%MATLAB QR
tic;
R = chol(A);
matlabchol_time = toc

y = R'\b;
x = R\y;
error_matlabchol = norm(x-soluz)

%MATLAB CHOL
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

G = eye(n);
for k = 1:n;
    for i = k+1:n;
        Gij = eye(n);
        Gij(k,k) = C(k, i);
        Gij(i,i) = C(k, i);
        Gij(k,i) = S(k, i);
        Gij(i,k) = -S(k, i);
        G = Gij*G;
    end
end
c = G*b;
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

