data = []  # 这里声明了一个全局数据列表


def sin_lut(index):
    # 检查索引是否有效
    index = index % 65536
    return int(data[index])  # 直接将数据转换为整数，因为是十进制格式


def read_coe_file(file_path):
    global data  # 使用全局变量 data
    with open(file_path, 'r') as file:
        lines = file.readlines()

    radix = None
    data = []
    for line in lines:
        line = line.strip()
        if line.startswith("memory_initialization_radix"):
            radix = int(line.split('=')[1].replace(';', '').strip())
        elif line.startswith("memory_initialization_vector"):
            continue  # 跳过初始化向量这一行
        elif line == ';':
            break  # 遇到结束符号;时停止
        else:
            # 去掉逗号和分号，并将数据加入到列表中
            cleaned_line = line.replace(',', '').replace(';', '')
            if cleaned_line:  # 确保清理后不为空
                data.append(cleaned_line)

    return radix



# 使用示例
file_path = 'sine_wave_65536_full_cycle_unsigned.coe'  # 修改为您的 .coe 文件路径
radix = read_coe_file(file_path)  # 读取文件，设置全局 data
