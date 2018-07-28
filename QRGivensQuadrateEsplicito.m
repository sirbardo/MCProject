function [Q, R] = QRGivensQuadrateEsplicito(R)

    [n, ~] = size(R);

    G = eye(n);
    
    for k = 1:n
        for i = k+1:n
            [c, s] = GivensParameters(R(k, k), R(i,k));
            for j = k:n
                t = c*R(k, j) + s*R(i, j);
                R(i,j) = -s*R(k,j)+c*R(i,j);
                R(k,j) = t;
            end
            Gij = eye(n);
            Gij(k,k) = c;
            Gij(i,i) = c;
            Gij(k,i) = s;
            Gij(i,k) = -s;
            G = Gij*G;
        end
    end
    Q = G';
    
end