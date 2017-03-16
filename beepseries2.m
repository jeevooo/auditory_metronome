function beep_series(specs)
%BEEP_SERIES  Create a series of beeps
%    BEEP_SERIES([FREQ_HZ, VOL, DUR_SEC, PAUSE_SEC]) creates a series of
%    beeps from an N-by-4 spec matrix, where the colums represent:

% Create Waveform

freq = specs(:,1);
volume = specs(:,2);
duration = specs(:,3);
trailingGap = specs(:,4);

SAMPLE_FREQ = 10000; % Sampling freqency changes the sound of beep (dull vs sharp sound) - higher leads to sharp
totalTime = sum(duration) + sum(trailingGap); % Get total time of metronome
x = zeros(ceil(totalTime * SAMPLE_FREQ),1); % creates vetor of zeros to be filled by wave form. 

curBeepStartTime = 0;
for ix = 1:length(trailingGap)
    numSamples = round(duration(ix) * SAMPLE_FREQ);
    x(round(curBeepStartTime * SAMPLE_FREQ + (1:numSamples))) = volume(ix) * sin((1:numSamples) * (2 * pi * trailingGap(ix)/SAMPLE_FREQ)); % Note that sin function is in radians
    curBeepStartTime = curBeepStartTime + duration(ix) + trailingGap(ix);
end

%soundsc(x, SAMPLE_FREQ)
%save ('ans', 'x');
audiowrite('metronome.wav',x,SAMPLE_FREQ);
