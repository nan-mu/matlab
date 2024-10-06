clear;

syms x;
y = exp((-0.2 + 0.4i) * x);
n = -10:10;

% 幅度，相位，实部，虚部
magnitude = subs(abs(y), x, n);
phase = subs(angle(y), x, n);
real_part = subs(real(y), x, n);
imaginary_part = subs(imag(y), x, n);

% 绘制幅度
subplot(2, 2, 1); % 设置子图位置
stem(n, magnitude);
grid on; % 显示网格
axis square; % 设置坐标轴比例为1:1
axis([-11 11 -1 8]); % 设置坐标轴范围
legend("幅度"); %接受一个数组
title('幅度');
xlabel('n');
ylabel('|x(n)|');

% 绘制相位
subplot(2, 2, 2); % 设置子图位置
stem(n, phase);
grid on; % 显示网格
axis square; % 设置坐标轴比例为1:1
axis([-11 11 (-pi - 0.5) (pi + 0.5)]); % 设置坐标轴范围
legend("相位"); %接受一个数组
title('相位');
xlabel('n');
ylabel('∠x(n)');

% 自定义 y 轴刻度和标签
yticks([-pi -pi / 2 0 pi / 2 pi]); % 设置 y 轴刻度
yticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'}); % 设置 y 轴标签

% 绘制实部
subplot(2, 2, 3); % 设置子图位置
stem(n, real_part);
grid on; % 显示网格
axis square; % 设置坐标轴比例为1:1
axis([-11 11 -6 2]); % 设置坐标轴范围
legend("实部"); %接受一个数组
title('实部');
xlabel('n');
ylabel('Re(x(n))');

% 绘制虚部
subplot(2, 2, 4); % 设置子图位置
stem(n, imaginary_part);
grid on; % 显示网格
axis square; % 设置坐标轴比例为1:1
axis([-11 11 -3 6]); % 设置坐标轴范围
legend("虚部"); %接受一个数组
title('虚部');
xlabel('n');
ylabel('Im(x(n))');

sgtitle('y(n)=e^{(-0.2 + 0.4j)n}', 'Interpreter', 'latex')

% title("图标标题");
% legend("图例"); %接受一个数组
% xlabel("X轴说明");
% ylabel("Y轴说明");
% grid on; % 显示网格
% axis square; % 设置坐标轴比例为1:1
% axis([0 5 0 20]); % 设置坐标轴范围
% %ylim([0 20]); % 设置Y轴范围，这是可选的
