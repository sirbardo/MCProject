function [Q, R] = QRHouseholderQuadrate(R)
    [n, m] = size(R);
    
    if (m ~= n)
        error("This function only accepts square matrices") %Can't use this particular QR implementation in this context
    end

    Q = eye(n);
    
    for i = 1:n-1
        Hi = BuildHouseholder(R(i:n,i));
        
        Q(i:n,i:n) = Q(i:n,i:n) * Hi;
        
        for j = 1:i-1
            Q(j, i:n) = Q(j, i:n) * Hi;
        end
        R(i:n,i:n) = Hi*R(i:n,i:n);
    end
end