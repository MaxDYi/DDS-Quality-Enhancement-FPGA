clc;
clear;
close all;

% 设置参数
N = 16;  % 取点的个数
x = linspace(0, 2*pi, 1000);   % x 轴数据，范围从 0 到 2π
y = sin(x);                    % 正弦函数

% 将正弦函数的值从 [-1, 1] 映射到 [0, 1]
y_normalized = (y + 1) / 2;

% 画正弦函数
figure;
plot(x, y_normalized, 'b-', 'LineWidth', 2);  % 蓝色线，宽度为 2
hold on;

% 计算取点位置（均匀分布 N 个点）
x_points = linspace(0, 2*pi, N);   % 在 [0, 2π] 区间均匀分布的 N 个点
y_points = sin(x_points);          % 对应的正弦值
y_points_normalized = (y_points + 1) / 2;  % 将取点的正弦值映射到 [0, 1] 范围

% 在正弦曲线上用空心圆圈标出 N 个点
plot(x_points, y_points_normalized, 'ro', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'r'); % 红色空心圆圈

% 绘制竖线
for i = 1:N
    plot([x_points(i) x_points(i)], [0 y_points_normalized(i)], 'r--');  % 竖线，从点到 x 轴，虚线
end

% 设置图形标题和轴标签
title(['Sine Wave']);
xlabel('x (radians)');
ylabel('sin(x)');

% 设置横坐标为弧度制
xticks(0:pi/2:2*pi);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});

% 设置横纵坐标范围
xlim([0 2*pi]);  % 横坐标范围 [0, 2π]
ylim([0 1.2]);    % 纵坐标范围 [0, 1]，稍微大一点以确保显示完整

% 显示网格
% grid on;
