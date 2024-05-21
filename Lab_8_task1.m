clc
clear all
% taking input message from user
message = input('Enter binary data with spaces eg: [1 1 0 0 1] : ');
f_one = 1; % frequency of sinusoid for binary-1
fs = 1000; % sampling frequency
t = [0:1/fs:1]; % time duration for 1-pulse
x = sin(2*pi*f_one*t); % sinusoid for binary-1
y = zeros(1,length(t)); % Zero level signal for binary-0
% generating timing vector
tim = t;
for(i=1:length(message)-1)
tim = [tim i+t];
end
% creating ASK signal
ask_sig = [];
for i=1:length(message)
if(message(i) == 0)
ask_sig = [ask_sig y];
else
ask_sig = [ask_sig x];
end
end
% plotting ASK signal w.r.t timing vector
figure;
subplot(121);
stem(message, 'linewidth', 2);
title('Message');
xlabel('Number of bits per second (bps)');
ylabel('Value');
axis([1 length(message) -0.5 1.5]);
grid on;
subplot(122);
plot(tim(1,1:(length(message)*fs)),ask_sig(1,1:(length(message)*fs)),'linewidth', 1.5);
title('ASK Signal');
xlabel(' Number of bits per second (bps)');
ylabel('Signal level');
axis([0 length(message) -1.5 1.5]);
grid on;