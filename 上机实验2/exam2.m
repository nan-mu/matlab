clear;

x1 = [1, 2, 2];
x2 = [1, 2, 3, 4];

conv5 = cconv(x1, x2, 5);
conv8 = cconv(x1, x2, 8);
convline = conv(x1, x2);

% 绘制 5 点循环卷积
subplot(3, 1, 1);
stem(0:length(conv5) - 1, conv5, 'filled');
title('5 点循环卷积');
xlabel('n');
ylabel('幅值');
xlim([-1 7]);
ylim([0 15]);
grid on;

% 绘制 8 点循环卷积
subplot(3, 1, 2);
stem(0:length(conv8) - 1, conv8, 'filled');
title('8 点循环卷积');
xlabel('n');
ylabel('幅值');
xlim([-1 7]);
ylim([0 15]);
grid on;

% 绘制线性卷积
subplot(3, 1, 3);
stem(0:length(convline) - 1, convline, 'filled');
title('线性卷积');
xlabel('n');
ylabel('幅值');
xlim([-1 7]);
ylim([0 15]);
grid on;
