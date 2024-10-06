clear;

syms n omega;
x = exp(-0.3i * pi * n);
index_n = 0:7;
index_omega = -12 * pi:0.1:pi * 12;
X = sum(subs(x * exp(-1i * omega * n), n, index_n));
simplify(X) % 实际看来好像没啥用，但还是写上

% magnitude = subs(abs(X), omega, index_omega);
% phase = subs(angle(X), omega, index_omega);

% % 绘制幅度
% subplot(1, 2, 1); % 设置子图位置
% plot(index_omega, magnitude);
% grid on; % 显示网格
% axis square; % 设置坐标轴比例为1:1
% % axis([-11 11 -1 8]); % 设置坐标轴范围
% legend("幅度"); %接受一个数组
% title('幅度');
% xlabel('n');
% ylabel('|X(e^{-j\omega})|');

% % 绘制相位
% subplot(1, 2, 2); % 设置子图位置
% plot(index_omega, unwrap(phase));
% grid on; % 显示网格
% axis square; % 设置坐标轴比例为1:1
% % axis([-11 11 (-pi - 0.5) (pi + 0.5)]); % 设置坐标轴范围
% legend("相位"); %接受一个数组
% title('相位');
% xlabel('n');
% ylabel('∠X(e^{-j\omega})');

% % 自定义 y 轴刻度和标签
% yticks([-pi -pi / 2 0 pi / 2 pi]); % 设置 y 轴刻度
% yticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'}); % 设置 y 轴标签
