function FT_signal=FourierTransform(signal)
FT_signal=fftshift(fft2(signal));