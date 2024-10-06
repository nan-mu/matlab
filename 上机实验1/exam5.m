clear;
clf;

syms n;
x = (0.8) ^ n * heaviside(n);
h = (-0.9) ^ n * heaviside(n);
% 第一小问
y1 = conv(double(subs(x, n, 0:25)), double(subs(h, n, 0:25)));
% 第二小问
y2 = filter(double(subs(h, n, 0:25)), 1, double(subs(x, n, 0:25)));

% 尝试使用符号函数计算卷积

syms nn;
% 翻折与替换
x3 = subs(x, n, nn);
h3 = subs(h, n, n - nn);
% 积分并化简
y3 = int(x3 * h3, nn, -inf, inf);
y3 = simplify(real(y3)); % 实际应用中，应该好好抉择一下如何处理这个包含虚数的y3
y3 = double(subs(y3, n, -25:25));

stem(-25:25, y1);
hold on;
stem(0:25, y2, 'r^');
stem(-25:25, y3, 'b*');

grid on;
title('卷积结果');
legend('conv', 'filter', 'symbol');
axis square; % 设置坐标轴比例为1:1
axis([-26 26 -0.2 1.1]); % 设置坐标轴范围
xlabel('n');
ylabel('y[n]');

hold off;
