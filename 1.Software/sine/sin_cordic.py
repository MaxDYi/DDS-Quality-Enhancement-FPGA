import math

# 定义CORDIC算法计算正弦和余弦
def sin_cordic(theta, iterations=16):
    # 初始值
    K = 0.6072529350088812561694  # CORDIC增益常数，适用于高精度计算
    x = 1.0  # 初始值
    y = 0.0
    z = theta  # 输入角度，单位为弧度

    # 角度表（用来进行旋转的角度，每一步的旋转角度为 2^(-i)）
    angle_table = [math.atan(2 ** -i) for i in range(iterations)]

    # CORDIC迭代过程
    for i in range(iterations):
        if z < 0:
            x_new = x + y * 2 ** -i
            y_new = y - x * 2 ** -i
            z_new = z + angle_table[i]
        else:
            x_new = x - y * 2 ** -i
            y_new = y + x * 2 ** -i
            z_new = z - angle_table[i]

        x, y, z = x_new, y_new, z_new

    # 计算正弦和余弦，注意要乘以 K 来补偿增益
    sin_theta = y * K
    # cos_theta = x * K

    return sin_theta