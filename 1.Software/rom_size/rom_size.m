clc;
clear;
close all;

N = 24;
delta_y = 1 / (2^N);
delta_x = asin(delta_y);
L = 2 * pi / delta_x;
ram = N / 8 * L;

display(['lut RAM:',num2str(ram/1024/1024),'MB']);


taylor_bit = ceil(log2(1/pi/delta_x));
dsp =(ceil(taylor_bit/18)*6);
dsp_sum = 0
while dsp > 0
    dsp_sum = dsp_sum + dsp;
    dsp = dsp - 2;
end

display(['taylor DSP:',num2str(dsp_sum)]);
