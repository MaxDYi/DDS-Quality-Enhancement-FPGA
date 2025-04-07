clc;
clear;
close all;

% 参数项
n = 4;
t = 2 * n;

% 使用符号计算来定义方程 g(x)
syms x
f_sym = x^(t+1) - (t+1) * ((pi/2 - x)^t);

% 将符号方程转为匿名函数
f = matlabFunction(f_sym);

% 绘制方程 g(x) 在区间 [0, pi/2] 上的图像
figure
fplot(f, [0, pi/2], 'r');  

% 使用 fzero 找到方程的零点
x_solution = fzero(f, [0, pi/2]);

% 显示结果
disp(['The solution is: ', num2str(x_solution)]);

% 计算
R = x_solution^(t+1)/factorial(t+1)
