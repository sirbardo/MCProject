function [Q, R] = QRHouseholderQuadrateOrlato(R)
    [n, m] = size(R);
    
    if (m ~= n)
        error("This function only accepts square matrices") %Can't use this particular QR implementation in this context
    end

    I = eye(n);
    Q = I;
    for i = 1:n-1
        H_i = BuildHouseholder(R(i:n,i));
        
        Hi = I;
        Hi(i:n,i:n) = H_i;
        
        Q = Q*Hi;
        R = Hi*R;
    end
end