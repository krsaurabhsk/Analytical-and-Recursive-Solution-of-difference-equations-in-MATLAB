clc
clear all
close all
n=0:1:15;
%code by saurabh 19EE01008 :DSP LAB EXP 4
u_n = [n>=0];
y = (26/25)*(4.^n).*(u_n) + (6/5)*n.*(4.^n).*u_n - (((-1).^n).*u_n)/25;
figure()
stem(n,y)
title('analytical')
xlabel('n');
ylabel('Output');
grid on
axis tight


out =[];
for i=0:1:15
    out = [out y_output(i)];
end
figure()
stem(n,out)
title('recursive')
xlabel('n');
ylabel('Output');
grid on
axis tight

e = ((y-out)./out)* 100;
figure()
stem(n,e);
xlabel('n');
ylabel('Percentage error');
title('Error between recursive and analytical solution')

figure()
stem(n,log10(out));
xlabel('n')
ylabel('log_1_0(y)');
title('Output using recursive function taken on a log scale');

figure()
stem(n,log10(y));
xlabel('n')
ylabel('log_1_0(y)');
title('Output using analytical function taken on a log scale');

%Recursive Code
function p = x_input(n)
if(n<0)
    p = 0;
else
    p = 4^n;
end
end


function q = y_output(n)
if(n<0)
    q=0;
else
    q = 3*y_output(n-1) +4*y_output(n-2) + x_input(n) + 2*x_input(n-1);
end
end




