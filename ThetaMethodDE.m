function [T , x_node, y_num, y_exact, G_Error] = ThetaMethodDE(a,b,h,theta,M,f,y,y0,tolerance,option)
% % Theta methods for solving ODE using iteration method to solve the non-linear equation as
% % sub-problem which is defined in Numerical Solution of Ordinary Differential Equations
% % By Kendall E. Atkinson, Weimin Han, and David E. Stewart © 2009 John Wiley & Sons, Inc.
% % ISBN 978-0470-04294-6
% % Inputs:
% % a: the intial point in interval [a,b]
% % b: the terminal point in interval [a,b]
% % h: stepsize of subinterval
% % theta: value of a parameter theta
% % tolerance: the stopping criteria for iteration method 
% % M : number of different h
% % f: the gradiant of y as y' = f(x1,x2)
% % y0: initial condition at a x0
% % y: exact solution
% % option : 'true' display table of outputs
% %           'false' hide table of outputs
% % Outputs: T: table of numerical solutions at the points x_i, i=0,...,n ,
% %         x_node: Array of mesh points
% %         y_num: Array of numerical values at x_node
% %         y_exact: Array of exact solutions at x_node
% %         G_Error: Array of absolute globel error e_n = |(y(x_n)-y_n)|
% % Sara Alkiswani- 13 Feb 2023
StepSize = zeros(1,M);
for k = 1:M
     n= (b-a)/h;
     x_node = linspace(a,b,n+1);
     y_num = zeros(1,n+1);
     y_num(1) = y0;
     for i = 1:n         
         if theta == 0
             y_num(i+1) = y_num(i) + h*f(x_node(i),y_num(i));
         else     
            fun_val = f(x_node(i),y_num(i));
            expEuler = y_num(i) + h*fun_val; 
            count = 0;
            Iter_diff = 1;
            while Iter_diff > tolerance && count < 10 
                 y_num(i+1) = y_num(i) + h*((1-theta)*fun_val + theta*f(x_node(i+1),expEuler));
                 Iter_diff = abs(expEuler-y_num(i+1));
                 expEuler = y_num(i+1);
                 count = count +1;
            end
         end   
     end 
     % computing absolute global error e_n =|y(x_n)- y_n|
     y_exact = y(x_node);
     G_Error = abs(y_exact - y_num);
     % Table of Outputs
     switch(option)
      case('true')
        Ttitle = string( ['       ' ...
         '               Output for theta = ' num2str( theta ) ] );
        disp(Ttitle)
        T = unique(array2table([x_node',y_num',y(x_node)', G_Error'], ...
                'VariableNames', ...
                {'x nodes','Numerical Value','Exact','|Error|'}));
        display(T)
       case('false')
         T =[];
     end
     %Update stepsize
     StepSize(k) = h;
     h = h/2;
end