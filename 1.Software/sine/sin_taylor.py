import sympy as sp
import numpy as np
from sin_cos_taylor import sin_cos_taylor


def sin_taylor(phase, bitLength=16, taylorLength=4):
    scaleFactor = 2 ** (bitLength)
    PI_2_VALUE = int(2 * sp.pi * scaleFactor)  # 2PI
    PI_3_2_VALUE = int(1.5 * sp.pi * scaleFactor)  # 3*PI/2
    PI_1_VALUE = int(1 * sp.pi * scaleFactor)  # PI
    PI_1_2_VALUE = int(0.5 * sp.pi * scaleFactor)  # PI/2
    PI_1_4_VALUE = int(0.25 * sp.pi * scaleFactor)  # PI/4
    SIN_COS_MID = PI_1_4_VALUE  # PI/4作为sin与cos的分界线

    """
    print(f"2pi = {PI_2_VALUE}")
    print(f"1.5pi = {PI_3_2_VALUE}")
    print(f"1pi = {PI_1_VALUE}")
    print(f"0.5pi = {PI_1_2_VALUE}")
    print(f"0.25pi = {PI_1_4_VALUE}")
    """
    if (phase > PI_2_VALUE):
        phase = phase - PI_2_VALUE
    else:
        if (phase < PI_1_2_VALUE):
            phase_tdata = phase
            dout_symbol = 0
        elif (phase < PI_1_VALUE):
            phase_tdata = PI_1_VALUE - phase
            dout_symbol = 0
        elif (phase < PI_3_2_VALUE):
            phase_tdata = phase - PI_1_VALUE
            dout_symbol = 1
        else:
            phase_tdata = PI_2_VALUE - phase
            dout_symbol = 1
    if phase_tdata > SIN_COS_MID:
        sin_cos_flag = 1
    else:
        sin_cos_flag = 0
    sin_out, _ = sin_cos_taylor(phase_tdata)
    _, cos_out = sin_cos_taylor(PI_1_2_VALUE - phase_tdata)
    if dout_symbol == 0:
        dds_sin_out = 0x8000 + (sin_out >> 1)
        dds_cos_out = 0x8000 + (cos_out >> 1)
    else:
        dds_sin_out = 0x7fff - (sin_out >> 1)
        dds_cos_out = 0x7fff - (cos_out >> 1)
    if sin_cos_flag == 0:
        dds_out = dds_sin_out
    else:
        dds_out = dds_cos_out
    return dds_out
