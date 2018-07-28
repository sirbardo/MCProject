function [R, C, S] = QRGivensQuadrate(R)

    [n, ~] = size(R);

    C = zeros(n);
    S = zeros(n);
    
    for k = 1:n
        for i = k+1:n
            [c, s] = GivensParameters(R(k, k), R(i,k));
            for j = k:n
                t = c*R(k, j) + s*R(i, j);
                R(i,j) = -s*R(k,j)+c*R(i,j);
                R(k,j) = t;
            end
            C(k, i) = c;
            S(k, i) = s;
        end
    end
end