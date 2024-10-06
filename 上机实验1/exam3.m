% 差分方程系数
x = [1];
y = [1, -1, 0.9];

index = -20:100;

delta = zeros(size(index)); %脉冲输入
delta(index == 0) = 1;
mu = zeros(size(index)); % 阶跃输入
mu(index >= 0) = 1;

h1 = filter(y, x, delta); % 脉冲响应
h2 = filter(y, x, mu); % 阶跃响应

% 绘制脉冲响应
subplot(1, 2, 1); % 设置子图位置
stem(index, h1);
grid on; % 显示网格
axis square; % 设置坐标轴比例为1:1
axis([-21 101 -1.5 1.5]); % 设置坐标轴范围
legend("y"); %接受一个数组
title('脉冲响应');
xlabel('n');
ylabel('h(n)');

% 绘制脉冲响应
subplot(1, 2, 2); % 设置子图位置
stem(index, h2);
grid on; % 显示网格
axis square; % 设置坐标轴比例为1:1
axis([-21 101 -0.5 1.5]); % 设置坐标轴范围
legend("y"); %接受一个数组
title('脉冲响应');
xlabel('n');
ylabel('h(n)');

% 判断系统稳定性
poles = roots(y);

% 判断系统稳定性
if all(abs(poles) < 1)
    disp('系统是稳定的。');
elseif any(abs(poles) > 1)
    disp('系统是不稳定的。');
else
    disp('系统是临界稳定的。');
end
