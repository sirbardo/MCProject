function H = BuildHouseholder(x)
    
    [n, ~] = size(x);

    sigma = norm(x,2);
    k = -(sign(x(1)))*sigma;
    
    ke1 = zeros(n,1);
    ke1(1) = k;
    
    two_wwt = ((x-ke1)*((x-ke1)'))/(sigma*(sigma+abs(x(1))));
    
    H = eye(n) - two_wwt;

end
