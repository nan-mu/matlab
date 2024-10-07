clear;

% 计算参数
sigma = 1; % 信道增益标准差
n_0 = 0.1; % 白噪声功率谱密度
data_size = 10 * 1014 * 1024; % 传输次数

% 计算公式
%% 瑞利信道和模拟输入
syms bit1 bit2 hi hq n;
qpsk = 1 / sqrt(2) * ((2 * bit1 - 1) + 1i * (2 * bit2 - 1));
h = hi + 1i * hq;

%% 信道输出
y = h * qpsk + n;

% 模拟信道传输
error_conut = 0; % 错误次数

for index = 1:data_size
    %% 带入信道增益
    y_temp = subs(y, hi, sigma * randn);
    y_temp = subs(y_temp, hq, sigma * randn);

    %% 带入噪声
    y_temp = subs(y_temp, n, sqrt(n_0 / 2) * (randn + 1i * randn));

    %% 带入输出
    temp_data = randi([0, 1], 1, 2);
    y_temp = subs(y_temp, bit1, temp_data(1));
    y_temp = subs(y_temp, bit2, temp_data(2));

    %% 计算信道输出并解调
    out = double(y_temp);
    out_bits = [real(out) > 0, imag(out) > 0]; % 解调

    error_conut = error_conut + (out_bits(1) ~= temp_data(1)) + (out_bits(2) ~= temp_data(2));

end

% 计算理论误码率
E_b = sigma ^ 2;
BER = 1/2 * (1 - sqrt(E_b / (E_b + n_0)));

disp(['理论误码率: ', num2str(BER)]);

disp(['仿真误码率：', num2str(error_conut / data_size / 2)]); % 输出错误率
