# main.py

# 导入
import sympy as sp
import numpy as np
from sin_cos_taylor import sin_cos_taylor
from sin_taylor import sin_taylor
from sin_cordic import sin_cordic
from sin_lut import sin_lut

# 放大因子
bitLength = 16
scaleFactor = 2 ** bitLength

# 输入角度
x = sp.pi / 6

# 使用NumPy计算实际的sin值
actual_sin = np.sin(float(x))

# 使用泰勒级数计算sin值
phase_taylor = sp.Integer(x * scaleFactor)
taylor_sin_int = sin_taylor(phase_taylor)
taylor_sin_float = float((taylor_sin_int - 32768) / scaleFactor) * 2
# taylor_sin_int, taylor_cos_int = sin_cos_taylor(phase_taylor)
# taylor_sin_float = float(taylor_sin_int / scaleFactor)
# taylor_cos_float = float(taylor_cos_int / scaleFactor)
# print(f"sin_taylor_phase = {phase_taylor}")
# print(f"sin_taylor_int = {hex(taylor_sin_int)}")
# print(f"cos_taylor_int = {hex(taylor_cos_int)}")

# 调用cordic计算sin值
cordic_sin_float = sin_cordic(x)

# 调用LUT查找表[0, scaleFactor-1]
lut_index = int((x / (2 * np.pi)) * (scaleFactor - 1))
print("Lut: ", lut_index)
lut_sin_int = sin_lut(lut_index)
lut_sin_float = float((lut_sin_int - 32768) / (scaleFactor / 2))
# print(f"lut_index = {lut_index}")
print(f"lut_sin_int = {lut_sin_int}")

# 打印结果
print(f"sin_actual({(x)}) = {actual_sin}")
print(f"sin_taylor({(x)}) = {taylor_sin_float}")
print(f"sin_cordic({(x)}) = {cordic_sin_float}")
print(f"sin_lut({(x)}) = {lut_sin_float}")

# 误差计算
err_taylor = abs(actual_sin - taylor_sin_float)
err_cordic = abs(actual_sin - cordic_sin_float)
err_lut = abs(actual_sin - lut_sin_float)
print(f"err_taylor({(x)}) = {err_taylor}")
print(f"err_cordic({(x)}) = {err_cordic}")
print(f"err_lut({(x)}) = {err_lut}")
