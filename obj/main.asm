;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _drawSprite
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_disableFirmware
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:33: void drawSprite(u8 *sprite,int sprite_vertical_pos,int sprite_horizontal_pos,int sprite_width,int sprite_height)
;	---------------------------------
; Function drawSprite
; ---------------------------------
_drawSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:36: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,sprite_horizontal_pos,sprite_vertical_pos);
	ld	d, 6 (ix)
	ld	e, 8 (ix)
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:37: cpct_drawSprite(sprite,pvmem,sprite_width,sprite_height);
	ld	h, 12 (ix)
	ld	c, 10 (ix)
	ld	l, 4 (ix)
	ld	b, 5 (ix)
	push	hl
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	de
	ld	h, b
	push	hl
	call	_cpct_drawSprite
	pop	ix
	ret
;src/main.c:41: void main(void) 
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:50: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:52: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:53: cpct_setPalette(g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:54: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:56: drawSprite(sp_player_ship, 
	ld	hl, #0x000e
	push	hl
	ld	l, #0x06
	push	hl
	ld	l, #0x22
	push	hl
	ld	l, #0xba
	push	hl
	ld	hl, #_sp_player_ship
	push	hl
	call	_drawSprite
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/main.c:62: drawSprite(sp_vshot,
	ld	hl, #0x0006
	push	hl
	ld	l, #0x01
	push	hl
	ld	l, #0x25
	push	hl
	ld	l, #0xb4
	push	hl
	ld	hl, #_sp_vshot
	push	hl
	call	_drawSprite
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/main.c:69: drawSprite(sp_enemy_saucer,
	ld	hl, #0x0010
	push	hl
	ld	l, #0x0c
	push	hl
	ld	l, #0x44
	push	hl
	ld	l, #0x01
	push	hl
	ld	hl, #_sp_enemy_saucer
	push	hl
	call	_drawSprite
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/main.c:86: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:89: while (1);
00102$:
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
