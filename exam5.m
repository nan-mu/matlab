syms n;
x = (0.8) ^ n;
h = (-0.9) ^ n;
% 第一小问
y1 = conv(double(subs(x, n, 0:25)), double(subs(h, n, 0:25)));
% 第二小问
y2 = filter(double(subs(h, n, 0:25)), 1, double(subs(x, n, 0:25)));
% 对齐y1
y2_padded = [y2, zeros(1, length(-25:25) - length(y2))];

hold on;
stem(-25:25, y1);
stem(-25:25, y2_padded, 'r^');
hold off;

grid on;
title('卷积结果');
legend('conv', 'filter');
axis square; % 设置坐标轴比例为1:1
axis([-26 26 -0.2 1.1]); % 设置坐标轴范围
xlabel('n');
ylabel('y[n]');
