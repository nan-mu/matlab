clear;

x = [1, 2, 3, 4, 5];
h = [1, -2, 1, 3];
y = conv(x, h);

subplot(3, 1, 1);
stem(0:(length(x) + length(h) - 2), y);
grid on; % 显示网格
axis square;
axis([-1 9 -1 20]); % 设置坐标轴范围
title('卷积结果');
legend("y");
xlabel('n');
ylabel('y[n]');

% 第二项
subplot(3, 1, 2);
stem(0:(length(x) - 1), x);
grid on; % 显示网格
axis square;
axis([-1 9 0 6]); % 设置坐标轴范围
title('输入信号');
legend("x");
xlabel('n');
ylabel('x[n]');

% 第三项
subplot(3, 1, 3);
stem(0:(length(h) - 1), h);
grid on; % 显示网格
axis square;
axis([-1 9 -3 4.5]); % 设置坐标轴范围
title('系统响应');
legend("h");
xlabel('n');
ylabel('h[n]');
