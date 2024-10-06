syms n omega;
x = exp(-0.3i * pi * n);
index_n = 0:7;
index_omega = -2 * pi:0.01:pi * 2;

% 生成离散信号 x
x_discrete = double(subs(x, n, index_n));

% 计算傅里叶变换
X_fft = fft(x_discrete);

% 计算频率轴
N = length(x_discrete);
f = (0:N - 1) * (2 * pi / N);

% 计算幅度和相位
magnitude = abs(X_fft);
phase = angle(X_fft);

% 绘制幅度
subplot(2, 1, 1);
stem(f, magnitude);
grid on;
title('幅度');
xlabel('频率 (rad/sample)');
ylabel('|X(\omega)|');

% 绘制相位
subplot(2, 1, 2);
stem(f, phase);
grid on;
title('相位');
xlabel('频率 (rad/sample)');
ylabel('∠X(\omega)');
