function p = Neville_Aitken(x,y,interp_x)
%%%%%% Input Arguments: 
%%%%%% x as independent variable
%%%%%% y as dependent variable
%%%%%% interp_x as the point to be interpolated
%%%%%% Output:
%%%%%% p_n(xx) the interpolating polynomial value
%%%%%% Written by Sara Alkiswani
n = length(x);
p=zeros(n,n);
t=zeros(n,1);
for i =1:n
    p(i,1) = y(i);
    t(i) = interp_x-x(i);
end
for k = 1:(n-1)
    for j = 1 :(n-k)
        p(j,k+1) = ((t(j)*p(j+1,k))-(t(j+k)*p(j,k)))/(t(j)-t(j+k));
    end
end
p = p(1,n);
end 