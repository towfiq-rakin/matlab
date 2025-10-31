data = [1 0 1 1 0 0 1 0]; 
bitRate = 1; 
Tb = 1/bitRate;

fs = 100; 
t = 0:1/fs:Tb-1/fs;

fc = 2; 
carrier = cos(2*pi*fc*t);

% Full time axis for entire signal
timeAxis = 0:1/fs:(length(data)*Tb - 1/fs);

% Expand digital data for plotting
dataExpanded = repelem(data, fs);


% Repeat carrier for full duration
carrierFull = repmat(carrier, 1, length(data));

% ASK Modulation
askSignal = [];
for i = 1:length(data)
    if data(i) == 1
        askSignal = [askSignal carrier]; 
    else
        askSignal = [askSignal zeros(1,length(t))]; 
    end
end

subplot(3,1,1);
plot(timeAxis, dataExpanded, 'LineWidth', 1.5);
ylim([-0.5 1.5]);
title('Input Digital Data');
xlabel('Time (s)'); 
ylabel('Amplitude');

% 2. ASK Modulated Signal
subplot(3,1,3);
plot(timeAxis, askSignal, 'LineWidth', 1.5);
title('ASK Modulated Signal');
xlabel('Time (s)'); 
ylabel('Amplitude');

% 3. Carrier Signal (Full Duration)
subplot(3,1,2);
plot(timeAxis, carrierFull, 'r', 'LineWidth', 1.5);
title('Carrier Signal (Full Duration)');
xlabel('Time (s)'); 
ylabel('Amplitude');
