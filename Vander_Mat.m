function V_Matrix = Vander_Mat(x)
%Input: x is a vector s.t. x =[x_0, x_1,...,x_n]
%Output: Vandermonde matrix 
% Written on : 14\03\2022
n = length(x);
% V = zeros(n);
% V(:,1) = 1;
% for i=1:n-1
%         V(:,i+1) = x.^i;
% end
% V_Matrix = V;
%or :
V=[];
for i=1:n
        V = [V , x(:).^(i-1)];
end
V_Matrix = V;
