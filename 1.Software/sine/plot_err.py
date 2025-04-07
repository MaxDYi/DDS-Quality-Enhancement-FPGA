import math
import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
from sin_taylor import sin_taylor
from sin_lut import sin_lut

# 设置点数 N
N = 65536 * 2
bitLength = 16
scaleFactor = 2 ** bitLength  # 放大因子(确保角度转为整数)

# 生成0到2π的N个均匀点，不包括2π
index = np.arange(N)
x = index * 2 * np.pi / N  # 生成均匀的角度点，x 现在包含 [0, 2π) 的点

# 初始化结果数组
sin_actual_float = np.zeros(N)
sin_lut_float = np.zeros(N)
sin_lut_int = np.zeros(N)
sin_taylor_float = np.zeros(N)
sin_taylor_int = np.zeros(N)

# 使用for循环逐个计算每个点的正弦值
for i in range(N):
    # 使用NumPy计算实际的sin值
    sin_actual_float[i] = np.sin(x[i])

    # 使用泰勒级数计算sin值
    phase_taylor = int(x[i] * scaleFactor)
    sin_taylor_int[i] = sin_taylor(phase_taylor)
    sin_taylor_float[i] = float((sin_taylor_int[i] - 32768) / scaleFactor) * 2

    # 使用LUT查找表计算sin值
    lut_index = int(index[i])
    sin_lut_int[i] = sin_lut(lut_index)  # 这里需要传入索引
    sin_lut_float[i] = float(sin_lut_int[i] - 0x8000) / (scaleFactor / 2)  # 将整数值映射到 [-1, 1] 范围内

    # 打印每次计算的实际值和LUT计算的结果
    # print(
    #   f"Index: {i}, x: {x[i]}, actual: {sin_actual_float[i]}, taylor: {sin_taylor_float[i]}, lut: {sin_lut_float[i]}")

# 计算误差
err_lut = np.abs(sin_lut_float - sin_actual_float)
err_taylor = np.abs(sin_taylor_float - sin_actual_float)

# 绘制误差图
plt.figure(figsize=(10, 6))

# 绘制LUT误差
plt.plot(x, err_lut, label="LUT Error", linewidth=1.5)

# 绘制Taylor级数误差
plt.plot(x, err_taylor, label="Taylor Error", linewidth=1.5)

# 设置图形的标签和标题
plt.xlabel("x (radians)", fontsize=12)
plt.ylabel("Error", fontsize=12)
plt.title("Error Comparison of LUT and Taylor sin Calculation", fontsize=14)
plt.legend()
plt.grid(True)
plt.show()
