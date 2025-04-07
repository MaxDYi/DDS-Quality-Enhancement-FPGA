clc;
clear;
close all;

n = 65536/4; % 点数
N_bits = 17; % 位宽（正弦波输出的位数）

% 定义是否生成有符号数：'signed' 或 'unsigned'
number_type = 'unsigned'; % 可选择 'signed' 或 'unsigned'

% 定义生成的周期类型：'quarter' 为四分之一周期，'half' 为半周期，'full' 为整个周期
cycle_type = 'quarter'; % 可选择 'quarter', 'half', 或 'full'

% 根据位宽计算振幅
amplitude = 2^N_bits

% 根据选择的周期类型调整生成的正弦波
switch cycle_type
    case 'quarter'
        sine_wave = amplitude / 2 * sin(2 * pi * (0:n-1) / (4 * n)); % 四分之一周期正弦波
        cycle_label = 'quarter_cycle';
    case 'half'
        sine_wave = amplitude / 2 * sin(2 * pi * (0:n-1) / (2 * n)); % 半周期正弦波
        cycle_label = 'half_cycle';
    case 'full'
        sine_wave = amplitude / 2 * sin(2 * pi * (0:n-1) / (1 * n)); % 整周期正弦波
        cycle_label = 'full_cycle';
    otherwise
        error('无效的周期类型，请选择 "quarter", "half", 或 "full"');
end

% 有符号数需要移出直流分量
if strcmp(number_type, 'unsigned')
    offset = 2^(N_bits - 1);
    sine_wave = sine_wave + offset;
end


% 将正弦波数据四舍五入为整数
sine_wave = round(sine_wave);
for i = 1:n-1
    if strcmp(number_type, 'signed')
        if sine_wave(i) >= 2^(N_bits - 1)
            sine_wave(i) = sine_wave(i) -1;
        end
    else
        if sine_wave(i) >= 2^(N_bits)
            sine_wave(i) = sine_wave(i) -1;
        end
    end
    sine_wave(i) = sine_wave(i)-65536;
end
max_value = max(sine_wave)
min_value = min(sine_wave)

% 动态生成文件名，包含点数、周期类型和数值类型
file_name = sprintf('sine_wave_%d_%s_%s.coe', n, cycle_label, number_type);

% 将数据写入 COE 文件以用于 Vivado 的 ROM 初始化
fileID = fopen(file_name,'w');
fprintf(fileID, 'memory_initialization_radix=10;\n');
fprintf(fileID, 'memory_initialization_vector=\n');

% 循环遍历正弦波数据并写入 COE 文件
for i = 1:n-1
    fprintf(fileID, '%d,\n', sine_wave(i));
end
fprintf(fileID, '%d;\n', sine_wave(n)); % 最后一个值没有逗号

fclose(fileID);

% 绘制生成的正弦波以进行可视化
figure;
plot(sine_wave);
title([num2str(n), ' 点周期正弦波 (', num2str(N_bits), '-bit, ', cycle_label, ', ', number_type, ')'], 'Interpreter', 'none');
xlabel('索引');
ylabel('振幅');
xlim([0 n]);
if strcmp(number_type, 'signed')
    ylim([-amplitude / 2, amplitude / 2]);
else
    ylim([0, amplitude]);
end
