clear;

syms n;
x = cos(0.47 * pi * n) + cos(0.53 * pi * n);

x1 = double(subs(x, n, 0:10));
X1 = fft(x1, 11);

x2 = [x1, zeros(1, 90)];
X2 = fft(x2, 101);

x3 = double(subs(x, n, 0:499));
X3 = fft(x3, 500);

% 绘制在竖着的三张子图上
figure;

% 绘制 X1 的频谱
subplot(3, 1, 1);
stem(0:length(X1) - 1, abs(X1), 'filled');
title('X1 - 11点 FFT');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;

% 绘制 X2 的频谱
subplot(3, 1, 2);
plot(0:length(X2) - 1, abs(X2));
title('X2 - 零填充 101点 FFT');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;

% 绘制 X3 的频谱
subplot(3, 1, 3);
plot(0:length(X3) - 1, abs(X3));
title('X3 - 500点 FFT');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;
set(gca, 'XTick', []);
set(gca, 'YTick', []);
legend;
title('第三题');
hold off;
