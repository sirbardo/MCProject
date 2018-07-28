n = 1000

A = rand(n);
A = A'*A;
soluz = ones(n,1);
b = A*soluz;

%MATLAB
tic;
[Q, R] = qr(A);
matlabqr_time = toc

c = Q'*b;
x = R\c;
error_matlabqr = norm(x-soluz)

tic;
R = chol(A);
matlabchol_time = toc

y = R'\b;
x = R\y;
error_matlabchol = norm(x-soluz)


%HOUSEHOLDER
tic;
[Q, R] = QRHouseholderQuadrate(A);
qrhouseholdertime = toc
c = Q'*b;
x = R\c;
error_householder = norm(x-soluz)

%GIVENSDIRETTO
%tic;
%[Qgivens, Rgivens] = QRGivensQuadrateEsplicito(A);
%qrgivensdirettotime = toc

%GIVENSIMPLICITO

tic;
[Rgivensimpl, C, S] = QRGivensQuadrate(A);
qrgivensimplicito = toc

%CHOLESKY
tic;
[R] = CholeskyColonne(A);
choltime = toc

y = R'\b;
x = R\y;
error_chol = norm(x-soluz)


