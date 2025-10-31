fs = 1000; % Sampling frequency
t = 0 : 1/fs : 1-1/fs; % Time duration
f1 = 6; % Frequency of first signal
f2 = 3; % Frequency of second signal
f3 = 9;
A1 = 1.5; % Amplitude of first signal
A2 = 1.1; % Amplitude of second signal
A3 = 0.5;
x1 = A1*sin(2*pi*f1*t) % first signal
x2 = A2*sin(2*pi*f2*t) % first signal
x3 = A3*sin(2*pi*f3*t)
%Ploting both signal in time domain
plot(t,x1,'k-x','LineWidth',1.5)
hold on
plot(t,x2,'b-x','LineWidth',2)
hold on
plot(t,x3,'r-x', 'LineWidth',1)
hold off
xlabel('Time in second')
ylabel('Amplitude in volts')
title('Signal of different frequency')
