
% CALL BEEP_SERIES

% clear;

% WHITENOISE

% load('WNpausedurations0318', 'whitenoise');

% REDNOISE

% load('RNpausedurations0318','rednoise');

% PINKNOISE

% load('PNpausedurations0318','pinknoise');

% ISOCHRONOUS

% n = 50; % number of beeps
% ST = 1.3696; % stride time
% ISO = ST*ones(1,n); % Pause Durations

% COCACTANATE BEEP SEQUENCES

% WN_A = [whitenoise ISO];
% PN_A = [pinknoise ISO];
% RN_A = [rednoise ISO];

% CREATE SPECS FOR BEEP SERIES

freq = 1./rednoise;
vol = ones(1,length(rednoise));
% for i = 1:256(vol);
%     % set each element to 0
%     vol(i) = 0;
% end
beepdur = 0.01*ones(1,length(rednoise));
pausedur = rednoise;

specs = [freq' vol' beepdur' pausedur'];

% CALL BEEP SERIES CODE

beepseries2(specs)

% RENAME FILE

movefile('metronome.wav', 'RNpausedurations_0318.wav');