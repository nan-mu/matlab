% 设置参数
numBits = 1e5; % 生成的比特数
SNR_dB = 0:2:20; % 信噪比范围 (dB)
M = 4; % 调制阶数 (QPSK)
k = log2(M); % 每个符号的比特数

% 初始化误码率数组
ber = zeros(1, length(SNR_dB));

% 定义调制和解调对象
modObj = @(bits) pskmod(bits, M, pi / M, 'gray', 'InputType', 'bit');
demodObj = @(rxSig) pskdemod(rxSig, M, pi / M, 'gray', 'OutputType', 'bit');

% 循环遍历不同的 SNR 值
for snr_idx = 1:length(SNR_dB)
    % 生成随机比特
    bits = randi([0 1], numBits, 1);

    % QPSK 调制
    txSig = modObj(bits);

    % 瑞利信道增益
    h = (randn(numBits / k, 1) + 1j * randn(numBits / k, 1)) / sqrt(2);

    % 信道输出
    rxSig = h .* txSig;

    % 添加噪声
    noisePower = 10 ^ (-SNR_dB(snr_idx) / 10);
    noise = sqrt(noisePower / 2) * (randn(numBits / k, 1) + 1j * randn(numBits / k, 1));
    rxSig = rxSig + noise;

    % 信道均�
    rxSig_eq = rxSig ./ h;

    % QPSK 解调
    rxBits = demodObj(rxSig_eq);

    % 计算误码率
    [numErrs, ber(snr_idx)] = biterr(bits, rxBits);
end

% 绘制 BER 曲线
semilogy(SNR_dB, ber);
xlabel('信噪比 (dB)');
ylabel('误码率 (BER)');
title('瑞利信道下 QPSK 的误码率');
grid on;
