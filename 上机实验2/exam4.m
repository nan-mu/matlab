fid = fopen('XAN.BHZ.00.ori.SAC', 'r', 'ieee-le');
A = fread(fid, [70, 1], 'float32');
B = fread(fid, [40, 1], 'int32');
C = char(fread(fid, [1, 192], 'char'));
HR = fread(fid, 'float32');
A(A == -12345.0) = NaN;
B(B == -12345) = NaN;
fclose(fid);

% Compute the FFT of HR
HR_fft = fft(HR, 13);

% Create a new figure
figure;

% Plot the magnitude
plot(abs(HR_fft));
title('Magnitude of HR FFT');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
