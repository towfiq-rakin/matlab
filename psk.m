data = [1 0 1 1 0 0 1 0]; 
bitRate = 1; 
Tb = 1/bitRate;

fs = 100; 
t = 0:1/fs:Tb-1/fs;

% Full time axis for entire signal
timeAxis = 0:1/fs:(length(data)*Tb - 1/fs);

% Expand digital data for plotting
dataExpanded = repelem(data, fs);


% PSK carrier for full duration
fc = 2;
carrierBase = sin(2*pi*fc*t);

% PSK Modulation
pskSignal = [];
for i = 1:length(data)
    if data(i) == 1
        pskSignal = [pskSignal carrierBase]; % 0 degree frequency
    else
        pskSignal = [pskSignal -carrierBase]; % 180 degree frequency
    end
end


subplot(2,1,1);
plot(timeAxis, dataExpanded, 'LineWidth', 1.5);
ylim([-0.5 1.5]);
title('Input Digital Data');
xlabel('Time (s)'); 
ylabel('Amplitude');

% 3. PSK Modulated Signal
subplot(2,1,2);
plot(timeAxis, pskSignal, 'LineWidth', 1.5);
title('PSK Modulated Signal');
xlabel('Time (s)'); 
ylabel('Amplitude');

