fid = fopen('XAN.BHZ.00.ori.SAC', 'r', 'ieee-le');
A = fread(fid, [70, 1], 'float32');
B = fread(fid, [40, 1], 'int32');
C = char(fread(fid, [1, 192], 'char'));
HR = fread(fid, 'float32');
A(A == -12345.0) = NaN;
B(B == -12345) = NaN;
fclose(fid);

% 采样频率
fs = 20; % Hz

% 计算 FFT
HR_fft = fft(HR);

% 计算频率轴
N = length(HR);
f = (0:N - 1) * (fs / N);

% 选择 0.01 Hz 到 10 Hz 范围内的频率分量
freq_range = (f >= 0.01) & (f <= 10);
f_selected = f(freq_range);
HR_fft_selected = HR_fft(freq_range);

% 绘制频谱
figure;
plot(f_selected, abs(HR_fft_selected));
title('信号的频谱');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;
