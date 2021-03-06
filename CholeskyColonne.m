function [R] = CholeskyColonne(A)

    [m, n] = size(A);
    
    if (m ~= n)
        error("This function only accepts positive definite symmetric matrices") %Can't use Cholesky in this context
    end
    
    
    R = zeros(n);

    for j=1:n
        for i=1:j-1
            sum_of_r = 0;
            for k = 1:i-1
                sum_of_r = sum_of_r + R(k,i)*R(k,j);
            end
            
            R(i,j) = 1/R(i,i)*((A(i,j))-sum_of_r);
        end
        
        sum_of_r = 0;
        for k = 1:j-1
            sum_of_r = sum_of_r + R(k,j)*R(k,j);
        end
        R(j,j) = sqrt(A(j,j) - sum_of_r);
    end
end

    
    