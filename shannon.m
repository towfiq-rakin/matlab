% Parameters
B = 1000 : 1000 : 100000; % Bandwith from 1kHz to 10kHz
SNR_dB = 0 : 10 : 40; % Different SNR Values

% Convert SNR from dB to linear
SNR_linear = 10.^(SNR_dB/10);

% Plot Shannon Capacity vs Bandwidth for different SNR
figure;
hold on; grid on;
colors = ['r', 'g', 'b', 'w', 'y'];

for i = 1 : length(SNR_linear)
    C = B.*log2(1+SNR_linear(i));
    plot(B, C/1e3, colors(i), 'LineWidth', 2);
end

xlabel('Bandwidth (Hz)');
ylabel('Channel Capacity (kbps)');
title('Shannon Capacity vs Bandwidth');
