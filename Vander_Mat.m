function V_Matrix = Vander_Mat(x)
n = length(x);
% V = zeros(n);
% V(:,1) = 1;
% for i=1:n-1
%         V(:,i+1) = x.^i;
% end
% V_Matrix = V;
V=[];
for i=1:n
        V = [V , x(:).^(i-1)];
end
V_Matrix = V;
