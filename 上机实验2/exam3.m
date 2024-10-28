clear;

syms n;
x = cos(0.47 * pi * n) + cos(0.53 * pi * n);

x1 = double(subs(x, n, 0:10));
X1 = fft(x1, 11);

x2 = [x1, zeros(1, 90)];
X2 = fft(x2, 101);

x3 = double(subs(x, n, 0:499));
X3 = fft(x3, 500);

% Plotting
figure;
hold on;

stem(linspace(0, 500, length(X1)), abs(X1), 'DisplayName', 'X1-11点fft');
plot(linspace(0, 500, length(X2)), abs(X2), 'DisplayName', 'X2-零填充101点fft');
plot(linspace(0, 500, length(X3)), abs(X3), 'DisplayName', 'X3-500点fft');

set(gca, 'XTick', []);
set(gca, 'YTick', []);
legend;
title('第三题');
hold off;
