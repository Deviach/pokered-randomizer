SFX_08_75_Ch1: ; 208e0 (8:48e0)
	executemusic
	vibrato 10, (2<<4) + 4
	dutycycle 2
	notetype 10, (8<<4) + 7
	octave 5
	note G#, 8
	octave 6
	note F#, 4
	note E_, 4
	octave 5
	note G#, 8
	endchannel


SFX_08_75_Ch2: ; 208f0 (8:48f0)
	executemusic
	vibrato 10, (2<<4) + 3
	dutycycle 2
	notetype 11, (6<<4) + 7
	octave 5
	note G#, 8
	notetype 10, (6<<4) + 7
	octave 6
	note F#, 4
	note E_, 4
	octave 5
	note G#, 8
	endchannel
; 0x20902