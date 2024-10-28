n = 0:3;
x = ones(1, 4);
omega = linspace(0, 2 * pi, 1000);
N4 = 2 * pi * (0:3) / 4;
N8 = 2 * pi * (0:7) / 8;

% 计算DTFT
DFTF = x * exp(-1j * n' * omega);
% 计算四点DFT
DFT4 = x * exp(-1j * n' * N4);
% 计算八点DFT
DFT8 = x * exp(-1j * n' * N8);

% 绘图
subplot(3, 2, 1);
plot(omega, abs(DFTF));
title('Magnitude of DTFT X(e^{j\omega})');
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
xticks(0:pi / 4:2 * pi);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi', '5\pi/4', '3\pi/2', '7\pi/4', '2\pi'});
xlim([0 2 * pi]);
grid on;

subplot(3, 2, 2);
plot(omega, angle(DFTF));
title('Phase of DTFT X(e^{j\omega})');
xlabel('\omega');
ylabel('∠X(e^{j\omega})');
xticks(0:pi / 4:2 * pi);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi', '5\pi/4', '3\pi/2', '7\pi/4', '2\pi'});
xlim([0 2 * pi]);
yticks(-pi:(pi / 4):pi);
yticklabels({'-\pi', '-3\pi/4', '-\pi/2', '-\pi/4', '0', '\pi/4', '\pi/2', '3\pi/4', '\pi'});
ylim([-pi pi]);
grid on;

subplot(3, 2, 3);
stem(N4, abs(DFT4), 'filled');
title('Magnitude of 4-point DFT');
xlabel('Frequency (rad/sample)');
ylabel('|DFT4|');
xticks(0:(pi / 4):2 * pi);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi', '5\pi/4', '3\pi/2', '7\pi/4', '2\pi'});
xlim([0 2 * pi]);
grid on;

subplot(3, 2, 4);
stem(N4, angle(DFT4), 'filled');
title('Phase of 4-point DFT');
xlabel('Frequency (rad/sample)');
ylabel('∠DFT4');
xticks(0:pi / 4:2 * pi);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi', '5\pi/4', '3\pi/2', '7\pi/4', '2\pi'});
xlim([0 2 * pi]);
yticks(-pi:(pi / 4):pi);
yticklabels({'-\pi', '-3\pi/4', '-\pi/2', '-\pi/4', '0', '\pi/4', '\pi/2', '3\pi/4', '\pi'});
ylim([-pi pi]);
grid on;

subplot(3, 2, 5);
stem(N8, abs(DFT8), 'filled');
title('Magnitude of 8-point DFT');
xlabel('Frequency (rad/sample)');
ylabel('|DFT8|');
xticks(0:pi / 4:2 * pi);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi', '5\pi/4', '3\pi/2', '7\pi/4', '2\pi'});
xlim([0 2 * pi]);
grid on;

subplot(3, 2, 6);
stem(N8, angle(DFT8), 'filled');
title('Phase of 8-point DFT');
xlabel('Frequency (rad/sample)');
ylabel('∠DFT8');
xticks(0:pi / 4:2 * pi);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi', '5\pi/4', '3\pi/2', '7\pi/4', '2\pi'});
xlim([0 2 * pi]);
yticks(-pi:(pi / 4):pi);
yticklabels({'-\pi', '-3\pi/4', '-\pi/2', '-\pi/4', '0', '\pi/4', '\pi/2', '3\pi/4', '\pi'});
ylim([-pi pi]);
grid on;
