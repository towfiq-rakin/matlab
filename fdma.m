Fs = 20000; % sampling frequency (Hz)
T = 0.2; % signal duration (s)
t = 0:1/Fs:T-1/Fs; % time vector
numChannels = 4; % number of FDMA channels/stations
baseband_freqs = [50, 120, 200, 300]; % baseband tone frequencies (Hz)
amp = [1.0, 0.8, 0.6, 0.5]; 
guard_band = 400; % guard band between channels (Hz)
channel_bw = 300; % approximate bandwidth allocated to each channel (Hz)
start_fc = 1000; % starting carrier freq (Hz)

% Calculate carrier frequencies
fc = zeros(1,numChannels);
for k = 1:numChannels
    fc(k) = start_fc + (k-1)*(channel_bw + guard_band);
end

% Create baseband messages and modulate onto carriers (DSB-SC)
baseband = zeros(numChannels, length(t));
modulated = zeros(numChannels, length(t));
for k = 1:numChannels
    baseband(k,:) = amp(k)*sin(2*pi*baseband_freqs(k)*t); % simple sine as message
    modulated(k,:) = baseband(k,:).*cos(2*pi*fc(k)*t); % DSB-SC modulation
end

% Multiplex: sum all modulated signals to form composite FDMA signal
composite = sum(modulated,1);

% Add small noise (optional) to simulate channel noise
SNRdB = 40; % high SNR
composite_noisy = awgn(composite, SNRdB, 'measured');

nfft = 2^nextpow2(length(t));
f = Fs*(0:(nfft/2))/nfft;
COM_fft = fft(composite_noisy, nfft);
COM_Pxx = abs(COM_fft(1:nfft/2+1));

figure('Name','FDMA Demonstration','NumberTitle','off','Position',[100 100 1100 700]);
subplot(3,2,1)
plot(t(1:1000), composite_noisy(1:1000));
xlabel('Time (s)'); ylabel('Amplitude'); title('Composite FDMA signal (time segment)');

subplot(3,2,2)
plot(f, 20*log10(COM_Pxx+eps)); % amplitude in dB
xlim([0 6000]);
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
title('Spectrum of composite FDMA signal'); grid on;

% Show each modulated channel time and spectrum
for k = 1:numChannels
    subplot(3,2,2+k)
    plot(t(1:800), modulated(k,1:800));
    xlabel('Time (s)'); ylabel('Amplitude');
    title(sprintf('Channel %d modulated (carrier = %d Hz)', k, fc(k)));
    end
    
