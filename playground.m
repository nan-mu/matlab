numBits = 1e5;
SNR_dB = 0:2:20;
M = 4;
k = log2(M);

ber = zeros(1, length(SNR_dB));
modObj = @(bits) pskmod(bits, M, pi / M, 'gray', 'InputType', 'bit');
demodObj = @(rxSig) pskdemod(rxSig, M, pi / M, 'gray', 'OutputType', 'bit');

for snr_idx = 1:length(SNR_dB)
    bits = randi([0 1], numBits, 1);

    txSig = modObj(bits);

    h = (randn(numBits / k, 1) + 1j * randn(numBits / k, 1)) / sqrt(2);

    rxSig = h .* txSig;

    noisePower = 10 ^ (-SNR_dB(snr_idx) / 10);
    noise = sqrt(noisePower / 2) * (randn(numBits / k, 1) + 1j * randn(numBits / k, 1));
    rxSig = rxSig + noise;

    rxSig_eq = rxSig ./ h;

    rxBits = demodObj(rxSig_eq);

    [numErrs, ber(snr_idx)] = biterr(bits, rxBits);
end

% 绘制 BER 曲线
semilogy(SNR_dB, ber);
