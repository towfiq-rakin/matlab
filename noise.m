% Parameter
fs = 1000; %Sampling frequency
t = 0:1/fs:1; %Time vector
f = 10; % Frequency of sin wave
signal = sin(2*pi*f*t); % Clean signal sin wave

noize = 0.5*randn(size(t));
noize_signal = signal + noize;

% Plot
figure;

subplot(3,1,1);
plot(t,signal,'b');
title('Clean Signal');
xlabel("Time (s)");
ylabel("Amplitude");

subplot(3,1,2);
plot(t,noize,'r');
title('Noise');
xlabel("Time (s)");
ylabel("Amplitude");

subplot(3,1,3);
plot(t,noize_signal,'g');
title('Noise Signal');
xlabel("Time (s)");
ylabel("Amplitude");
