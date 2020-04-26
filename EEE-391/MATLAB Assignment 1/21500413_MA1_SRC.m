% Used recording of G4 from acoustic guitar
% Frequency from https://pages.mtu.edu/~suits/notefreqs.html is 392.01 Hz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PART 1

recObj = audiorecorder(16000, 8, 1);
disp('Start recording.');
recordblocking(recObj, 5);
disp('End of recording.');
soundArray = getaudiodata(recObj);

plot (soundArray);
title ('Sample - Amplitude Graph');
xlabel ('Sample');
ylabel ('Amplitude');

freq = 392.01;
period = 1 / freq;
samplesPerPeriod = 16000 * period;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART 2
samplesPer100PartPeriod = 100 * samplesPerPeriod;
partOfSoundArray = soundArray (3.4*10^4 : 4.4*10^4);

figure; plot (partOfSoundArray);
title ('Partial Sample - Amplitude');
xlabel ('Sample');
ylabel ('Amplitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART 3

firstPeriodOfPartOfSoundArray = partOfSoundArray (1 : floor (samplesPerPeriod));

figure; plot (firstPeriodOfPartOfSoundArray);
title ('First Period Sample - Amplitude');
xlabel ('Sample');
ylabel ('Amplitude');

figure; plot (abs (fft (firstPeriodOfPartOfSoundArray)));
title ('Sample - Absolute FFT First Period');
xlabel ('Sample');
ylabel ('Absolute FFT');

t = 1 : 1 : samplesPerPeriod;
N = 10; % SPECIFY N ACCORDING TO FTT PEAKS
K = (-N : N);
fscValues = (1: size (K, 2));
for k = 1 : size (fscValues, 2)
    fscValues (k) = freq * trapz(t, (firstPeriodOfPartOfSoundArray .') .* exp (-1i * 2 * pi * freq * K (k) * t));
end

figure; plot (K, abs (fscValues));
title ('k - Absolute FSCs');
xlabel ('k');
ylabel ('Absolute FSC');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART 4
reSynthesizedSignal = (1 : floor (samplesPerPeriod));
for s = 1 : size (reSynthesizedSignal, 2)
    reSynthesizedSignal (s) = sum (fscValues .* exp (1i * 2 * pi * freq * K * s));
end

figure; plot (abs(reSynthesizedSignal));
title ('Sample - Resynthesized Signal Amplitude Graph');
xlabel ('Sample');
ylabel ('Resynthesized Signal Amplitude');

reSynthesizedSignal = repmat (reSynthesizedSignal, 1, ceil (size (partOfSoundArray) / s));
reSynthesizedSignal = reSynthesizedSignal (1: size (partOfSoundArray));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART 5
audiowrite ('Resynthesized Audio.wav', reSynthesizedSignal, 16000);
audiowrite ('Part of Sound Array.wav', partOfSoundArray.', 16000);
audiowrite ('21500413_MA1_SOUND.wav', soundArray.', 16000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART 6


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART 7
fscPhases = angle (fscValues);
magnitude1FSCValues = pol2cart (fscPhases, 1);
mag1FSCResynthesized = (1 : floor (samplesPerPeriod));
for s = 1 : size (mag1FSCResynthesized, 2)
    mag1FSCResynthesized (s) = sum (magnitude1FSCValues .* exp (1i * 2 * pi * freq * K * s));
end

figure; plot (repmat (abs (mag1FSCResynthesized), 1, 10));
title ('Sample - Magnitude 1 FSC Resynthesized Signal Amplitude');
xlabel ('Sample');
ylabel ('Magnitude 1 FSC Resynthesized Signal Amplitude');

mag1FSCResynthesized = repmat (mag1FSCResynthesized, 1, ceil (size (partOfSoundArray) / s));
mag1FSCResynthesized = mag1FSCResynthesized (1: size (partOfSoundArray));
audiowrite ('Magnitude 1 Resynthesized Audio.wav', mag1FSCResynthesized, 16000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% PART 8
fscMagnitudes = abs (fscValues);
phase0FSCValues = pol2cart (0, fscMagnitudes);
phase0FSCResynthesized = (1 : floor (samplesPerPeriod));
for s = 1 : size (phase0FSCResynthesized, 2)
    phase0FSCResynthesized (s) = sum (phase0FSCValues .* exp (1i * 2 * pi * freq * K * s));
end

figure; plot (repmat (abs (phase0FSCResynthesized), 1, 10));
title ('Sample - Phase 0 FSC Resynthesized Signal Amplitude');
xlabel ('Sample');
ylabel ('Phase 0 FSC Resynthesized Signal Amplitude');

phase0FSCResynthesized = repmat (phase0FSCResynthesized, 1, ceil (size (partOfSoundArray) / s));
phase0FSCResynthesized = phase0FSCResynthesized (1: size (partOfSoundArray));
audiowrite ('Phase 0 Resynthesized Audio.wav', phase0FSCResynthesized, 16000);