SFX_08_46_Ch1: ; 23a13 (8:7a13)
	executemusic
	tempo 256
	volume 119
	dutycycle 3
	toggleperfectpitch
	notetype 6, (11<<4) + 2
	octave 3
	note E_, 2
	note F#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note D#, 1
	note D#, 1
	notetype 6, (11<<4) + 5
	note E_, 8
	endchannel


SFX_08_46_Ch2: ; 23a2e (8:7a2e)
	executemusic
	dutycycle 2
	notetype 6, (12<<4) + 2
	octave 4
	note G#, 2
	note G#, 1
	note G#, 1
	note E_, 2
	note E_, 1
	note E_, 1
	note B_, 2
	note B_, 1
	note B_, 1
	note A_, 2
	note A_, 1
	note A_, 1
	notetype 6, (12<<4) + 5
	note G#, 8
	endchannel


SFX_08_46_Ch3: ; 23a44 (8:7a44)
	executemusic
	notetype 6, (1<<4) + 0
	octave 4
	note B_, 2
	note __, 2
	octave 5
	note C#, 2
	note __, 2
	note D#, 2
	note __, 2
	note F#, 2
	note G_, 2
	note G#, 4
	endchannel
; 0x23a53