clc
clear all
% taking input message from user
message = input('Enter binary data with spaces eg: [1 1 0 0 1] : ');
f1 = 1; % frequency for binary-0
f2 = 2; % frequency for binary-1
fs = 1000; % sampling frequency
t = [0:1/fs:1]; % time duration for 1-pulse
x = sin(2*pi*f2*t); % sinusoid representing binary-1
y = sin(2*pi*f1*t); % sinusoid representing binary-0
% generating timing vector
tim = t;
for(i=1:length(message)-1)
tim = [tim i+t];
end
% creating BFSK signal
fsk_sig = [];
for i=1:length(message)
if(message(i) == 0)
fsk_sig = [fsk_sig y];
else
fsk_sig = [fsk_sig x];
end
end
% plotting BFSK signal w.r.t timing vector
figure;
subplot(121);
stem(message, 'linewidth', 2);
title('Message');
xlabel('Number of bits (bps)');
ylabel('Value');
axis([1 length(message) -0.5 1.5]);
grid on;
subplot(122);
plot(tim(1,1:(length(message)*1000)),fsk_sig(1,1:(length(message)*1000)), 'linewidth', 1.5);
title('BFSK Signal');
xlabel('Number of bits (bps)');
ylabel('Signal level');
axis([0 length(message) -1.5 1.5]);
grid on;