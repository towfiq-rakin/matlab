data = [1 0 1 1 0 0 1 0]; 
bitRate = 1; 
Tb = 1/bitRate; 

fs = 100; 
t = 0:1/fs:Tb-1/fs; 

fc1 = 2; 
carrier1 = cos(2*pi*fc1*t); 

fc2 = 5; 
carrier2 = cos(2*pi*fc2*t); 

% Full time axis for entire signal
timeAxis = 0:1/fs:(length(data)*Tb - 1/fs); 

% Expand digital data for plotting
dataExpanded = repelem(data, fs);


% Repeat carrier for full duration
carrierFull = repmat(carrier1, 1, length(data));

% FSK Modulation
fskSignal = [];
for i = 1:length(data)
    if data(i) == 1
        fskSignal = [fskSignal carrier2]; % high frequency
    else
        fskSignal = [fskSignal carrier1]; % low frequency
    end
end


subplot(3,1,1);
plot(timeAxis, dataExpanded, 'LineWidth', 1.5);
ylim([-0.5 1.5]);
title('Input Digital Data');
xlabel('Time (s)'); 
ylabel('Amplitude');

% 2. FSK Modulated Signal
subplot(3,1,3);
plot(timeAxis, fskSignal, 'LineWidth', 1.5);
title('FSK Modulated Signal');
xlabel('Time (s)'); 
ylabel('Amplitude');

% 3. Carrier Signal (Full Duration)
subplot(3,1,2);
plot(timeAxis, carrierFull, 'r', 'LineWidth', 1.5);
title('Carrier Signal (Full Duration)');
xlabel('Time (s)'); 
ylabel('Amplitude');
