import sympy as sp
import numpy as np

def sin_cos_taylor(phase, bitLength=16, taylorLength=4):
    scaleFactor = 2 ** (bitLength)
    # 定义一个长度为 taylorLength*2 的数组
    x = sp.zeros(taylorLength * 2)
    fact = sp.zeros(taylorLength * 2)
    sin_k = sp.zeros(taylorLength)
    cos_k = sp.zeros(taylorLength)
    sin_kx = sp.zeros(taylorLength)
    cos_kx = sp.zeros(taylorLength)
    sin_sum = sp.zeros(taylorLength)
    cos_sum = sp.zeros(taylorLength)

    for i in range(taylorLength * 2):
        # 计算x的i次方
        x[i] = (phase ** i)
        # print(f"x^{i} = {hex(x[i])}")
        # 计算阶乘
        fact[i] = sp.factorial(i)
        # print(f"fact[{i}] = {hex(fact[i])}")

    for i in range(taylorLength):
        sin_k[i] = round(scaleFactor / fact[2 * i + 1])
        # print(f"sin_k[{i}] = {sin_k[i]}")
        cos_k[i] = round(scaleFactor / fact[2 * i])
        # print(f"cos_k[{i}] = {cos_k[i]}")

        sin_kx[i] = sin_k[i] * x[2 * i + 1]
        cos_kx[i] = cos_k[i] * x[2 * i]
        # print(f"sin_kx[{i}] = {hex(sin_kx[i])}")
        # print(f"cos_kx[{i}] = {hex(cos_kx[i])}")
        moveBit = 16 * (2 * (taylorLength - i - 1))
        if (i == 0):
            sin_sum[i] = sin_kx[i] << moveBit
            cos_sum[i] = cos_kx[i] << moveBit
        else:
            sin_sum[i] = sin_sum[i - 1] + (-1) ** i * (sin_kx[i] << moveBit)
            cos_sum[i] = cos_sum[i - 1] + (-1) ** i * (cos_kx[i] << moveBit)
        # print(f"sin_sum[{i}] = {hex(sin_sum[i])}")
        # print(f"cos_sum[{i}] = {hex(cos_sum[i])}")

    # 计算最终的sin(x)的结果
    sin_move_bit = 16 * (2 * taylorLength - 1)
    cos_move_bit = 16 * (2 * taylorLength - 2)
    if sin_sum[taylorLength - 1] < 0:
        sin_out_int = ((-sin_sum[taylorLength - 1]) >> sin_move_bit)
    else:
        sin_out_int = sin_sum[taylorLength - 1] >> sin_move_bit
    if cos_sum[taylorLength - 1] < 0:
        cos_out_int = ((-cos_sum[taylorLength - 1]) >> cos_move_bit)
    else:
        cos_out_int = cos_sum[taylorLength - 1] >> cos_move_bit
    # print(f"sin_out = {hex(sin_out_int)}")
    # print(f"cos_out = {hex(cos_out_int)}")

    return sin_out_int, cos_out_int
