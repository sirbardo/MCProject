function [c, s] = GivensParameters(xi, xj)

    if (xj == 0)
        c = 1;
        s = 0;

    elseif (abs(xj) > abs(xi))
        t = xi/xj;
        z = sqrt(1+t^2);

        s = 1/z;
        c = t*s;
    else
        t = xj/xi;
        z = sqrt(1+t^2);

        c = 1/z;
        s = t*c;
    end

end