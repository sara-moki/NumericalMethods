function [y_num,OutPut] = NumEulerMethod(a,b,n,f,y,y0)
% % Euler method - Sara Alkiswani
% % Inputs:
% % a: the intial point in interval [a,b]
% % b: the terminal point in interval [a,b]
% % n: number of points in [a,b]
% % f: the gradiant as y' = f(x1,x2)
% % y0: initial condition at a
% % y: exact solution
% % Output: table of numerical solutions at the points x_i, i=0,...,n ,
% %         error, plots of numerical, exact values and error 

x_node = linspace(a,b,n);
h = (b - a)/(n-1);
y_num = zeros(1,n);
y_num(1) = y0;
for i = 1:n-1
    y_num(i+1) = y_num(i) + h*f(x_node(i),y_num(i));
end
xfine = linspace(a,b,100);
Error = abs(y(x_node) - y_num);
% Plotting the numercal values and exact values at the points x_i
figure; hold on
subplot(2,1,1)
plot(xfine,y(xfine),'g')
hold on;
plot(x_node,y(x_node),'bo',x_node,y_num,'ro-', ...
    LineWidth=0.7,MarkerSize=8)
grid on
legend('','Exact','Numerical')
hold on
% Plotting the error 
subplot(2,1,2)
plot(x_node,Error,LineWidth=0.7)
grid on
OutPut = array2table([x_node',y_num',y(x_node)',Error'], ...
         'VariableNames', {'x nodes','Numerical Value','Exact','Error'});
end
