DrainHPEffect_: ; 783f (1:783f)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld a, [W_PLAYERMOVEEFFECT] ; wcfd2
	jr z, .goteffect
	ld a, [W_ENEMYMOVEEFFECT] ; W_ENEMYMOVENUM
.goteffect
    cp DRAIN_HP_EFFECT_75
    jr nz, .half
	ld hl, W_DAMAGE ; W_DAMAGE
; * 0.75
    ld a, [hli]
    ld b, a
    ld c, [hl]
    srl b
    rr c
    ld h, b
    ld l, c
    srl b
    rr c
    add hl, bc
    
	ld de, W_DAMAGE
	ld a, h
	ld [de], a
	inc de
	ld a, l
	ld [de], a
	ld hl, W_DAMAGE
	ld a, [hli]

	or [hl]
	jr nz, .asm_784f
	inc hl
	inc [hl]
	jr .asm_784f
.half
	ld hl, W_DAMAGE ; W_DAMAGE
	ld a, [hl]
	srl a ; divide damage by 2
	ld [hli], a
	ld a, [hl]
	rr a
	ld [hld], a
	or [hl]
	jr nz, .asm_784f
	inc hl
	inc [hl]
.asm_784f
	ld hl, wBattleMonHP ; wd015
	ld de, wBattleMonMaxHP ; wd023
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jp z, Func_7861
	ld hl, wEnemyMonHP ; wEnemyMonHP
	ld de, wEnemyMonMaxHP ; wEnemyMonMaxHP

Func_7861: ; 7861 (1:7861)
	ld bc, wHPBarOldHP+1
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a
	ld a, [wd0d8]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [W_DAMAGE] ; W_DAMAGE
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wHPBarNewHP+1], a
	jr c, .asm_7890
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .asm_789c
.asm_7890
	ld a, [de]
	ld [hld], a
	ld [wHPBarNewHP], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wHPBarNewHP+1], a
	inc de
.asm_789c
	ld a, [H_WHOSETURN] ; $fff3
	and a
	hlCoord 10, 9
	ld a, $1
	jr z, .asm_78aa
	hlCoord 2, 2
	xor a
.asm_78aa
	ld [wListMenuID], a ; wListMenuID
	predef UpdateHPBar2
	predef DrawPlayerHUDAndHPBar
	predef DrawEnemyHUDAndHPBar
	callab ReadPlayerMonCurHPAndStatus
	ld hl, SuckedHealthText ; $78dc
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld a, [W_PLAYERMOVEEFFECT] ; wcfd3
	jr z, .asm_78d2
	ld a, [W_ENEMYMOVEEFFECT] ; W_ENEMYMOVEEFFECT
.asm_78d2
	cp DREAM_EATER_EFFECT
	jr nz, .asm_78d9
	ld hl, DreamWasEatenText
.asm_78d9
	jp PrintText

SuckedHealthText: ; 78dc (1:78dc)
	TX_FAR _SuckedHealthText
	db "@"

DreamWasEatenText: ; 78e1 (1:78e1)
	TX_FAR _DreamWasEatenText
	db "@"
