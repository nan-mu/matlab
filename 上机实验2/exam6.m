fid = fopen('S0037-130419-120000-A', 'r', 'ieee-le');
para128 = fread(fid, [128, 1], 'char');
para128s = para128(para128 ~= 0); %Remove the unused bytes
[equmtname2, reststr1] = strtok(para128s, '-'); %Get instrument number in characters
[yymmdd2, reststr2] = strtok(reststr1, '-'); %Get yymmdd in characters
[hhmmss2, reststr3] = strtok(reststr2, '-'); %Get hhmmss in characters
%Get latitude(N)stla_N
[stla, reststr1] = strtok(reststr3, '-'); %Get latitude in characters
%'Nddmm.mmm'
%Characters to double
stla_1 = stla(2:length(stla)); %Remove 'N'
[stla_2, stla_3] = strtok(stla_1, '.'); %Get ddmm and mmm in characters
stla_4 = str2double(char(stla_2)); %String 'ddmm' to double
stla_3N = str2double(char(stla_3)); %String '.mmm' to double (decimal)
stla_N = floor(stla_4 / 100) + (mod(stla_4, 100) + stla_3N) / 60;
%Get longitude(E)stlo_E
[stlo, params] = strtok(reststr1, '-'); %Remove 'E'
%'Edddmm.mmm'??one more character than latitude??
%Characters to double
stlo_1 = stlo(2:length(stlo));
[stlo_2, stlo_3] = strtok(stlo_1, '.');
stlo_4 = str2double(char(stlo_2));
stlo_3E = str2double(char(stlo_3));
stlo_E = floor(stlo_4 / 100) + (mod(stlo_4, 100) + stlo_3E) / 60;
%Get n1~n8
[A, reststr1] = strtok(params, ',');
[n1, reststr2] = strtok(reststr1, ','); %n1_Num:working channel number
n1_Num = str2double(char(n1)); %string to double
[n2, reststr1] = strtok(reststr2, ','); %n2_Num:number of all the channels
n2_Num = str2double(char(n2));
[n3, reststr2] = strtok(reststr1, ','); %n3_Num:sampling frequency in Hz
n3_Num = str2double(char(n3));
[n4, reststr1] = strtok(reststr2, ','); %n4_Num:gain
n4_Num = str2double(char(n4));
[n5, reststr2] = strtok(reststr1, ','); %n5_Num:height
n5_Num = str2double(char(n5));
[n6, reststr1] = strtok(reststr2, ','); %n6_Num:humidity
n6_Num = str2double(char(n6));
[n7, reststr2] = strtok(reststr1, ','); %n7_Num:temperature
n7_Num = str2double(char(n7));
n8 = reststr2(2:length(reststr2)); %n8_Num:file length in byte
n8_Num = str2double(char(n8));
data_length = (n8_Num - 128) / 2; %Calculate the length of data
data_all = fread(fid, [data_length, 1], 'int16');

% 采样频率
fs = 1; % Hz

% 提取 43600 秒附近的信号数据
start_time = 43600 - 1000; % 开始时间
end_time = 43600 + 1000; % 结束时间
data_segment = data_all(start_time:end_time);

% 计算和绘制短时傅里叶变换
window = hamming(256); % 使用 Hamming 窗
noverlap = 128; % 重叠样本数
nfft = 512; % FFT 点数

% 规格
Wp = 0.3 / (fs / 2); % 通带截止频率 (归一化)
Ws = 0.4 / (fs / 2); % 阻带截止频率 (归一化)
Rp = 3; % 通带最大衰减 (dB)
Rs = 20; % 阻带最小衰减 (dB)

% 设计巴特沃斯低通滤波器
[n, Wn] = buttord(Wp, Ws, Rp, Rs); % 计算滤波器阶数和截止频率
[b, a] = butter(n, Wn, 'low'); % 设计滤波器

% 应用滤波器
data_filtered = filter(b, a, data_segment);

figure;
% 绘制滤波前的频谱图
subplot(2, 1, 1);
spectrogram(data_segment, window, noverlap, nfft, fs, 'yaxis');
title('滤波前的频谱图');
xlabel('时间 (秒)');
ylabel('频率 (Hz)');

% 绘制滤波后的频谱图
subplot(2, 1, 2);
spectrogram(data_filtered, window, noverlap, nfft, fs, 'yaxis');
title('滤波后的频谱图');
xlabel('时间 (秒)');
ylabel('频率 (Hz)');
