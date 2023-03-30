function  PC_Mode_P_EC_m(a,b,h,IC,ySol,f)
%%Sara Alkiswani - 30 March 2023
n = length(a:h:b);
y_exact=@(x) ySol(x);%Exact solution
x = linspace(a,b,n);
yExact = double(y_exact(x));
y0 = IC;
y(1)=y0; %Initial condition
% Using RK2 to find y_2
K1 = f(x(1),y(1));
K2 = f(x(1)+ (h/2),y(1)+(h/2)*K1);
y(2) = y(1) + h*0.5*(K1+K2);
m = [1,2,3]; %times the corrector is applied 
for j = 1:length(m)
   for i=1:n-2
       % Predictor AB2:
       f1 = f(x(i+1),y(i+1));
       y(i+2)= y(i+1) + h/2*(3*f1-f(x(i),y(i)));
       for s=1:m(j)
          f2 = f(x(i+2),y(i+2));
          y(i+2) = y(i+1) +(h/2)*(f1+f2);      
       end    
   end
   Error{j} = abs(y-yExact);
end
% % Plotting the errors
figure;hold on;
semilogy(x,Error{1},'r-o',LineWidth=1.75);hold on;
semilogy(x,Error{2},'b-*',LineWidth=1.75);hold on;
semilogy(x,Error{3},'g-^',LineWidth=1.57);hold on
legend('Error with m=1',' Error with m=2','Error with m=3',Location='northwest')
title(['Comparison of the Errors with h=' num2str(h)])
xlabel('x','FontSize',14)
ylabel('|Error|','FontSize',14)
set(gca, 'YScale', 'log')
hold off
end
