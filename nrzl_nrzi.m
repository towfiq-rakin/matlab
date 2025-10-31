% Defines the bit sequence we want to encode
data = [1 0 1 1 0 0 1 0];

bitRate = 1;
Tb = 1/bitRate;
% bitRate = 1 means each bit lasts 1 second (arbitary time units)
% Tb is the time duration of the one bit. Here Tb = 1/1 = 1s

fs = 100;
% fs is how many same we record inside each bit interval. With fs = 100,
% each bit has 100 discrete samples
% The time resolution (sample interval) is dt = 1/fs = 0.01 second.

t = 0 : 1/fs : (length(data)*Tb - 1/fs);
% Builds the time vector t from 0 to length(data)*Tb -1/fs in steps of
% 1/fs.
% Numerical example: length(data)*Tb = 8*1 = 8. The last time is 7.99
% t = 0 : 0.01 : 7.99. That gives 800 samples
% length(t) = 800
% t(1) = 0.00,...,t(100)=0.99,...,t(800)=7.99

nrzl_signal = zeros(1,length(t));
nrzi_signal = zeros(1,length(t));


for i = 1 : length(data)
    if data(i) == 1
        nrzl_signal((i-1)*fs + 1 : i*fs) = 0;
    else
        nrzl_signal((i-1)*fs + 1 : i*fs) = 1;
    end
end

current_state = 0;
for i = 2 : length(data)
    if data(i) == 1
        current_state = ~current_state;
    end
    nrzi_signal((i-1)*fs + 1 : i*fs) = current_state;
end

figure;

subplot(2,1,1);
stairs(t, nrzl_signal, 'LineWidth', 2);
ylim([-0.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('NRZ-L Encoding');
grid on;

subplot(2,1,2);
stairs(t, nrzi_signal, 'LineWidth', 2);
ylim([-0.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('NRZ-I Encoding');
grid on;
