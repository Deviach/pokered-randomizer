MainMenu: ; 5af2 (1:5af2)
; Check save file
	call Func_5bff
	xor a
	ld [$D08A],a
	inc a
	ld [$D088],a
	call Func_609e
	jr nc,.next0

	; Predef 52 loads the save from SRAM to RAM
	ld a,$52
	call Predef

.next0
	ld c,20
	call DelayFrames
	xor a
	ld [$D12B],a
	ld hl,$CC2B
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld [$D07C],a
	ld hl,$D72E
	res 6,[hl]
	call ClearScreen
	
	FuncCoord 0, 8
	ld hl, Coord
	ld de, TitleScreenText
	call PlaceString ; show randomizer options
	
	call GoPAL_SET_CF1C
	call LoadTextBoxTilePatterns
	call LoadFontTilePatterns
	ld hl,$D730
	set 6,[hl]
	ld a,[$D088]
	cp a,1
	jr z,.next1
	FuncCoord 0,0
	ld hl,Coord
	ld b,6
	ld c,13
	call TextBoxBorder
	FuncCoord 2,2
	ld hl,Coord
	ld de,ContinueText
	call PlaceString
	jr .next2
.next1
	FuncCoord 0,0
	ld hl,Coord
	ld b,4
	ld c,13
	call TextBoxBorder
	FuncCoord 2,2
	ld hl,Coord
	ld de,NewGameText
	call PlaceString
.next2
	ld hl,$D730
	res 6,[hl]
	call UpdateSprites ; OAM?
	xor a
	ld [$CC26],a
	ld [$CC2A],a
	ld [$CC34],a
	inc a
	ld [$CC25],a
	inc a
	ld [$CC24],a
	ld a,$B
	ld [$CC29],a
	ld a,[$D088]
	ld [$CC28],a
	call HandleMenuInput
	bit 1,a
	jp nz,LoadTitlescreenGraphics ; load title screen (gfx and arrangement)
	ld c,20
	call DelayFrames
	ld a,[$CC26]
	ld b,a
	ld a,[$D088]
	cp a,2
	jp z,.next3
	inc b ; adjust MenuArrow_Counter
.next3
	ld a,b
	and a
	jr z,.next4 ; if press_A on Continue
	cp a,1
	jp z,Func_5d52 ; if press_A on NewGame
	call DisplayOptionMenu ; if press_a on Options
	ld a,1
	ld [$D08A],a
	jp .next0
.next4
	call ContinueGame
	ld hl,$D126
	set 5,[hl]
.next6
	xor a
	ld [H_NEWLYPRESSEDBUTTONS],a
	ld [H_NEWLYRELEASEDBUTTONS],a
	ld [H_CURRENTPRESSEDBUTTONS],a
	call GetJoypadState
	ld a,[H_CURRENTPRESSEDBUTTONS]
	bit 0,a
	jr nz,.next5
	bit 1,a
	jp nz,.next0
	jr .next6
.next5
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld a,4
	ld [$D52A],a
	ld c,10
	call DelayFrames
	ld a,[$D5A2]
	and a
	jp z,Func_5d5f
	ld a,[W_CURMAP] ; map ID
	cp a,HALL_OF_FAME
	jp nz,Func_5d5f
	xor a
	ld [$D71A],a
	ld hl,$D732
	set 2,[hl]
	call Func_62ce
	jp Func_5d5f
Func_5bff: ; 5bff (1:5bff)
	ld a,1
	ld [$D358],a
	ld a,3
	ld [$D355],a
	ret

LinkMenu: ; 5c0a (1:5c0a)
	xor a
	ld [$d358], a
	ld hl, $d72e
	set 6, [hl]
	ld hl, TextTerminator_6b20 ; $6b20
	call PrintText
	call SaveScreenTilesToBuffer1
	ld hl, WhereWouldYouLikeText
	call PrintText
	FuncCoord 5, 5 ; $c409
	ld hl, Coord
	ld b, $6
	ld c, $d
	call TextBoxBorder
	call UpdateSprites
	FuncCoord 7, 7 ; $c433
	ld hl, Coord
	ld de, TradeCenterText
	call PlaceString
	xor a
	ld [$cd37], a
	ld [$d72d], a
	ld hl, wTopMenuItemY ; $cc24
	ld a, $7
	ld [hli], a
	ld a, $6
	ld [hli], a
	xor a
	ld [hli], a
	inc hl
	ld a, $2
	ld [hli], a
	inc a
	ld [hli], a
	xor a
	ld [hl], a
.asm_5c52
	call HandleMenuInput
	and $3
	add a
	add a
	ld b, a
	ld a, [wCurrentMenuItem] ; $cc26
	add b
	add $d0
	ld [$cc42], a
	ld [$cc43], a
.asm_5c66
	call Func_2247
	ld a, [$cc3d]
	ld b, a
	and $f0
	cp $d0
	jr z, .asm_5c7d
	ld a, [$cc3e]
	ld b, a
	and $f0
	cp $d0
	jr nz, .asm_5c66
.asm_5c7d
	ld a, b
	and $c
	jr nz, .asm_5c8b
	ld a, [$cc42]
	and $c
	jr z, .asm_5c52
	jr .asm_5ca1
.asm_5c8b
	ld a, [$cc42]
	and $c
	jr z, .asm_5c98
	ld a, [$ffaa]
	cp $2
	jr z, .asm_5ca1
.asm_5c98
	ld a, b
	ld [$cc42], a
	and $3
	ld [wCurrentMenuItem], a ; $cc26
.asm_5ca1
	ld a, [$ffaa]
	cp $2
	jr nz, .asm_5cb1
	call DelayFrame
	call DelayFrame
	ld a, $81
	ld [$ff02], a
.asm_5cb1
	ld b, $7f
	ld c, $7f
	ld d, $ec
	ld a, [$cc42]
	and $8
	jr nz, .asm_5ccc
	ld a, [wCurrentMenuItem] ; $cc26
	cp $2
	jr z, .asm_5ccc
	ld c, d
	ld d, b
	dec a
	jr z, .asm_5ccc
	ld b, c
	ld c, d
.asm_5ccc
	ld a, b
	FuncCoord 6, 7 ; $c432
	ld [Coord], a
	ld a, c
	FuncCoord 6, 9 ; $c45a
	ld [Coord], a
	ld a, d
	FuncCoord 6, 11 ; $c482
	ld [Coord], a
	ld c, $28
	call DelayFrames
	call LoadScreenTilesFromBuffer1
	ld a, [$cc42]
	and $8
	jr nz, .asm_5d2d
	ld a, [wCurrentMenuItem] ; $cc26
	cp $2
	jr z, .asm_5d2d
	xor a
	ld [$d700], a
	ld a, [wCurrentMenuItem] ; $cc26
	and a
	ld a, TRADE_CENTER
	jr nz, .asm_5cfc
	ld a, BATTLE_CENTER
.asm_5cfc
	ld [$d72d], a
	ld hl, PleaseWaitText
	call PrintText
	ld c, $32
	call DelayFrames
	ld hl, $d732
	res 1, [hl]
	ld a, [W_ANIMATIONID] ; $d07c
	ld [$d71a], a
	call Func_62ce
	ld c, $14
	call DelayFrames
	xor a
	ld [wMenuJoypadPollCount], a ; $cc34
	ld [$cc42], a
	inc a
	ld [W_ISLINKBATTLE], a ; $d12b
	ld [$cc47], a
	jr Func_5d5f
.asm_5d2d
	xor a
	ld [wMenuJoypadPollCount], a ; $cc34
	call Delay3
	call Func_72d7
	ld hl, LinkCanceledText
	call PrintText
	ld hl, $d72e
	res 6, [hl]
	ret

WhereWouldYouLikeText: ; 5d43 (1:5d43)
	TX_FAR _WhereWouldYouLikeText
	db "@"

PleaseWaitText: ; 5d48 (1:5d48)
	TX_FAR _PleaseWaitText
	db "@"

LinkCanceledText: ; 5d4d (1:5d4d)
	TX_FAR _LinkCanceledText
	db "@"

Func_5d52: ; 5d52 (1:5d52)
	ld hl, $d732
	res 1, [hl]
	call OakSpeech
	ld c, $14
	call DelayFrames

Func_5d5f: ; 5d5f (1:5d5f)
	xor a
	ld [H_NEWLYPRESSEDBUTTONS], a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [$ffb5], a
	ld [$d72d], a
	ld hl, $d732
	set 0, [hl]
	call ResetPlayerSpriteData
	ld c, $14
	call DelayFrames
	ld a, [$cc47]
	and a
	ret nz
	jp EnterMap

ContinueText: ; 5d7e (1:5d7e)
	db "CONTINUE", $4e

NewGameText: ; 5d87 (1:5d87)
	db "NEW GAME", $4e
	db "OPTION@"

TradeCenterText: ; 5d97 (1:5d97)
	db "TRADE CENTER", $4e
	db "COLOSSEUM",    $4e
	db "CANCEL@"

ContinueGame: ; 5db5 (1:5db5)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	FuncCoord 4, 7 ; $c430
	ld hl, Coord
	ld b, $8
	ld c, $e
	call TextBoxBorder
	FuncCoord 5, 9 ; $c459
	ld hl, Coord
	ld de, SaveScreenInfoText
	call PlaceString
	FuncCoord 12, 9 ; $c460
	ld hl, Coord
	ld de, W_PLAYERNAME ; $d158
	call PlaceString
	FuncCoord 17, 11 ; $c48d
	ld hl, Coord
	call Func_5e2f
	FuncCoord 16, 13 ; $c4b4
	ld hl, Coord
	call Func_5e42
	FuncCoord 13, 15 ; $c4d9
	ld hl, Coord
	call Func_5e55
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld c, $1e
	jp DelayFrames

PrintSaveScreenText: ; 5def (1:5def)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld hl, $c3a4
	ld b, $8
	ld c, $e
	call TextBoxBorder
	call LoadTextBoxTilePatterns
	call UpdateSprites
	ld hl, $c3cd
	ld de, SaveScreenInfoText
	call PlaceString
	ld hl, $c3d4
	ld de, W_PLAYERNAME
	call PlaceString
	ld hl, $c401
	call Func_5e2f
	ld hl, $c428
	call Func_5e42
	ld hl, $c44d
	call Func_5e55
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld c, $1e
	jp DelayFrames

Func_5e2f: ; 5e2f (1:5e2f)
	push hl
	ld hl, W_OBTAINEDBADGES
	ld b, $1
	call CountSetBits
	pop hl
	ld de, $d11e
	ld bc, $102
	jp PrintNumber

Func_5e42: ; 5e42 (1:5e42)
	push hl
	ld hl, wPokedexOwned ; $d2f7
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	pop hl
	ld de, $d11e
	ld bc, $103
	jp PrintNumber

Func_5e55: ; 5e55 (1:5e55)
	ld de, $da41
	ld bc, $103
	call PrintNumber
	ld [hl], $6d
	inc hl
	ld de, $da43
	ld bc, $8102
	jp PrintNumber

SaveScreenInfoText: ; 5e6a (1:5e6a)
	db   "PLAYER"
	next "BADGES    "
	next "#DEX    "
	next "TIME@"

DisplayOptionMenu: ; 5e8a (1:5e8a)
    call ClearScreen ; to clean title screen text
	FuncCoord 0,0
	ld hl,Coord
	ld b,3
	ld c,18
	call TextBoxBorder
	FuncCoord 0,5
	ld hl,Coord
	ld b,3
	ld c,18
	call TextBoxBorder
	FuncCoord 0,10
	ld hl,Coord
	ld b,3
	ld c,18
	call TextBoxBorder
	FuncCoord 1,1
	ld hl,Coord
	ld de,TextSpeedOptionText
	call PlaceString
	FuncCoord 1,6
	ld hl,Coord
	ld de,BattleAnimationOptionText
	call PlaceString
	FuncCoord 1,11
	ld hl,Coord
	ld de,BattleStyleOptionText
	call PlaceString
	FuncCoord 2,16
	ld hl,Coord
	ld de,OptionMenuCancelText
	call PlaceString
	xor a
	ld [wCurrentMenuItem],a
	ld [wLastMenuItem],a
	inc a
	ld [$d358],a
	ld [$cd40],a
	ld a,3 ; text speed cursor Y coordinate
	ld [wTopMenuItemY],a
	call SetCursorPositionsFromOptions
	ld a,[$cd3d] ; text speed cursor X coordinate
	ld [wTopMenuItemX],a
	ld a,$01
	ld [H_AUTOBGTRANSFERENABLED],a ; enable auto background transfer
	call Delay3
.loop
	call PlaceMenuCursor
	call SetOptionsFromCursorPositions
.getJoypadStateLoop
	call GetJoypadStateLowSensitivity
	ld a,[$ffb5]
	ld b,a
	and a,%11111011 ; any key besides select pressed?
	jr z,.getJoypadStateLoop
	bit 1,b ; B button pressed?
	jr nz,.exitMenu
	bit 3,b ; Start button pressed?
	jr nz,.exitMenu
	bit 0,b ; A button pressed?
	jr z,.checkDirectionKeys
	ld a,[wTopMenuItemY]
	cp a,16 ; is the cursor on Cancel?
	jr nz,.loop
.exitMenu
	ld a,(SFX_02_40 - SFX_Headers_02) / 3
	call PlaySound ; play sound
	ret
.eraseOldMenuCursor
	ld [wTopMenuItemX],a
	call EraseMenuCursor
	jp .loop
.checkDirectionKeys
	ld a,[wTopMenuItemY]
	bit 7,b ; Down pressed?
	jr nz,.downPressed
	bit 6,b ; Up pressed?
	jr nz,.upPressed
	cp a,8 ; cursor in Battle Animation section?
	jr z,.cursorInBattleAnimation
	cp a,13 ; cursor in Battle Style section?
	jr z,.cursorInBattleStyle
	cp a,16 ; cursor on Cancel?
	jr z,.loop
.cursorInTextSpeed
	bit 5,b ; Left pressed?
	jp nz,.pressedLeftInTextSpeed
	jp .pressedRightInTextSpeed
.downPressed
	cp a,16
	ld b,-13
	ld hl,$cd3d
	jr z,.updateMenuVariables
	ld b,5
	cp a,3
	inc hl
	jr z,.updateMenuVariables
	cp a,8
	inc hl
	jr z,.updateMenuVariables
	ld b,3
	inc hl
	jr .updateMenuVariables
.upPressed
	cp a,8
	ld b,-5
	ld hl,$cd3d
	jr z,.updateMenuVariables
	cp a,13
	inc hl
	jr z,.updateMenuVariables
	cp a,16
	ld b,-3
	inc hl
	jr z,.updateMenuVariables
	ld b,13
	inc hl
.updateMenuVariables
	add b
	ld [wTopMenuItemY],a
	ld a,[hl]
	ld [wTopMenuItemX],a
	call PlaceUnfilledArrowMenuCursor
	jp .loop
.cursorInBattleAnimation
	ld a,[$cd3e] ; battle animation cursor X coordinate
	xor a,$0b ; toggle between 1 and 10
	ld [$cd3e],a
	jp .eraseOldMenuCursor
.cursorInBattleStyle
	ld a,[$cd3f] ; battle style cursor X coordinate
	xor a,$0b ; toggle between 1 and 10
	ld [$cd3f],a
	jp .eraseOldMenuCursor
.pressedLeftInTextSpeed
	ld a,[$cd3d] ; text speed cursor X coordinate
	cp a,1
	jr z,.updateTextSpeedXCoord
	cp a,7
	jr nz,.fromSlowToMedium
	sub a,6
	jr .updateTextSpeedXCoord
.fromSlowToMedium
	sub a,7
	jr .updateTextSpeedXCoord
.pressedRightInTextSpeed
	ld a,[$cd3d] ; text speed cursor X coordinate
	cp a,14
	jr z,.updateTextSpeedXCoord
	cp a,7
	jr nz,.fromFastToMedium
	add a,7
	jr .updateTextSpeedXCoord
.fromFastToMedium
	add a,6
.updateTextSpeedXCoord
	ld [$cd3d],a ; text speed cursor X coordinate
	jp .eraseOldMenuCursor

TextSpeedOptionText: ; 5fc0 (1:5fc0)
	db   "TEXT SPEED"
	next " FAST  MEDIUM SLOW@"

BattleAnimationOptionText: ; 5fde (1:5fde)
	db   "BATTLE ANIMATION"
	next " ON       OFF@"

BattleStyleOptionText: ; 5ffd (1:5ffd)
	db   "BATTLE STYLE"
	next " SHIFT    SET@"

OptionMenuCancelText: ; 6018 (1:6018)
	db "CANCEL@"

; sets the options variable according to the current placement of the menu cursors in the options menu
SetOptionsFromCursorPositions: ; 601f (1:601f)
	ld hl,TextSpeedOptionData
	ld a,[$cd3d] ; text speed cursor X coordinate
	ld c,a
.loop
	ld a,[hli]
	cp c
	jr z,.textSpeedMatchFound
	inc hl
	jr .loop
.textSpeedMatchFound
	ld a,[hl]
	ld d,a
	ld a,[$cd3e] ; battle animation cursor X coordinate
	dec a
	jr z,.battleAnimationOn
.battleAnimationOff
	set 7,d
	jr .checkBattleStyle
.battleAnimationOn
	res 7,d
.checkBattleStyle
	ld a,[$cd3f] ; battle style cursor X coordinate
	dec a
	jr z,.battleStyleShift
.battleStyleSet
	set 6,d
	jr .storeOptions
.battleStyleShift
	res 6,d
.storeOptions
	ld a,d
	ld [W_OPTIONS],a
	ret

; reads the options variable and places menu cursors in the correct positions within the options menu
SetCursorPositionsFromOptions: ; 604c (1:604c)
	ld hl,TextSpeedOptionData + 1
	ld a,[W_OPTIONS]
	ld c,a
	and a,$3f
	push bc
	ld de,2
	call IsInArray
	pop bc
	dec hl
	ld a,[hl]
	ld [$cd3d],a ; text speed cursor X coordinate
	FuncCoord 0,3
	ld hl,Coord
	call .placeUnfilledRightArrow
	sla c
	ld a,1 ; On
	jr nc,.storeBattleAnimationCursorX
	ld a,10 ; Off
.storeBattleAnimationCursorX
	ld [$cd3e],a ; battle animation cursor X coordinate
	FuncCoord 0,8
	ld hl,Coord
	call .placeUnfilledRightArrow
	sla c
	ld a,1
	jr nc,.storeBattleStyleCursorX
	ld a,10
.storeBattleStyleCursorX
	ld [$cd3f],a ; battle style cursor X coordinate
	FuncCoord 0,13
	ld hl,Coord
	call .placeUnfilledRightArrow
; cursor in front of Cancel
	FuncCoord 0,16
	ld hl,Coord
	ld a,1
.placeUnfilledRightArrow
	ld e,a
	ld d,0
	add hl,de
	ld [hl],$ec ; unfilled right arrow menu cursor
	ret

; table that indicates how the 3 text speed options affect frame delays
; Format:
; 00: X coordinate of menu cursor
; 01: delay after printing a letter (in frames)
TextSpeedOptionData: ; 6096 (1:6096)
	db 14,5 ; Slow
	db  7,3 ; Medium
	db  1,1 ; Fast
	db 7 ; default X coordinate (Medium)
	db $ff ; terminator

Func_609e: ; 609e (1:609e)
	ld a, $a
	ld [$0], a
	ld a, $1
	ld [$6000], a
	ld [$4000], a
	ld b, $b
	ld hl, $a598
.asm_60b0
	ld a, [hli]
	cp $50
	jr z, .asm_60c1
	dec b
	jr nz, .asm_60b0
	xor a
	ld [$0], a
	ld [$6000], a
	and a
	ret
.asm_60c1
	xor a
	ld [$0], a
	ld [$6000], a
	scf
	ret
