SFX_1f_42_Ch1: ; 7ee74 (1f:6e74)
	executemusic
	tempo 256
	volume 119
	dutycycle 2
	toggleperfectpitch
	notetype 5, (10<<4) + 4
	octave 3
	note A#, 4
	notetype 5, (11<<4) + 1
	octave 4
	note C_, 2
	note C_, 1
	note C_, 1
	notetype 5, (10<<4) + 4
	note D#, 4
	notetype 5, (11<<4) + 1
	note F_, 2
	note F_, 1
	note F_, 1
	notetype 5, (11<<4) + 4
	note A#, 8
	endchannel


SFX_1f_42_Ch2: ; 7ee93 (1f:6e93)
	executemusic
	vibrato 4, (2<<4) + 3
	dutycycle 2
	notetype 5, (13<<4) + 1
	octave 4
	note G_, 2
	note G_, 1
	note G_, 1
	notetype 5, (12<<4) + 4
	note D#, 4
	notetype 5, (13<<4) + 1
	note G#, 2
	note G#, 1
	note G#, 1
	note A#, 2
	note A#, 1
	note A#, 1
	notetype 5, (12<<4) + 4
	octave 5
	note D#, 8
	endchannel


SFX_1f_42_Ch3: ; 7eeaf (1f:6eaf)
	executemusic
	notetype 5, (1<<4) + 0
	octave 4
	note D#, 4
	note G#, 4
	note G_, 4
	note F_, 4
	note D#, 8
	endchannel
; 0x7eeb9