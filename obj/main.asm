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
	.globl _moveSaucer
	.globl _enemySaucerHitsBorder
	.globl _initSprites
	.globl _draw_sp_vshot
	.globl _draw_sp_enemy_saucer
	.globl _draw_sp_player
	.globl _drawSprite
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard
	.globl _cpct_disableFirmware
	.globl _sp_enemy_saucer_speed
	.globl _sp_enemy_saucer_y
	.globl _sp_enemy_saucer_x
	.globl _sp_vshot_y_speed
	.globl _sp_vshot_y
	.globl _sp_vshot_x
	.globl _sp_player_ship_speed
	.globl _sp_player_ship_y
	.globl _sp_player_ship_x
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sp_player_ship_x::
	.ds 1
_sp_player_ship_y::
	.ds 1
_sp_player_ship_speed::
	.ds 1
_sp_vshot_x::
	.ds 1
_sp_vshot_y::
	.ds 1
_sp_vshot_y_speed::
	.ds 1
_sp_enemy_saucer_x::
	.ds 1
_sp_enemy_saucer_y::
	.ds 1
_sp_enemy_saucer_speed::
	.ds 1
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
;src/main.c:50: void drawSprite(u8 *sprite,int x,int y,int sprite_width,int sprite_height)
;	---------------------------------
; Function drawSprite
; ---------------------------------
_drawSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:53: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,x,y);
	ld	d, 8 (ix)
	ld	e, 6 (ix)
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:54: cpct_drawSprite(sprite,pvmem,sprite_width,sprite_height);
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
;src/main.c:58: void draw_sp_player(u8 x,u8 y)
;	---------------------------------
; Function draw_sp_player
; ---------------------------------
_draw_sp_player::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:60: drawSprite (sp_player_ship,x,y,SP_PLAYER_SHIP_W,SP_PLAYER_SHIP_H);
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	hl, #0x000e
	push	hl
	ld	l, #0x08
	push	hl
	push	de
	push	bc
	ld	hl, #_sp_player_ship
	push	hl
	call	_drawSprite
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/main.c:63: void draw_sp_enemy_saucer(u8 x,u8 y)
;	---------------------------------
; Function draw_sp_enemy_saucer
; ---------------------------------
_draw_sp_enemy_saucer::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:65: drawSprite (sp_enemy_saucer,x,y,SP_ENEMY_SAUCER_W,SP_ENEMY_SAUCER_H);
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	hl, #0x0010
	push	hl
	ld	l, #0x0e
	push	hl
	push	de
	push	bc
	ld	hl, #_sp_enemy_saucer
	push	hl
	call	_drawSprite
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/main.c:67: void draw_sp_vshot(u8 x,u8 y)
;	---------------------------------
; Function draw_sp_vshot
; ---------------------------------
_draw_sp_vshot::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:69: drawSprite (sp_vshot,x,y,SP_VSHOT_W,SP_VSHOT_H);
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	hl, #0x0006
	push	hl
	ld	l, #0x01
	push	hl
	push	de
	push	bc
	ld	hl, #_sp_vshot
	push	hl
	call	_drawSprite
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/main.c:72: void initSprites()
;	---------------------------------
; Function initSprites
; ---------------------------------
_initSprites::
;src/main.c:74: sp_player_ship_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W);
	ld	hl,#_sp_player_ship_x + 0
	ld	(hl), #0x20
;src/main.c:75: sp_player_ship_y = SCREEN_BOTTOM-SP_PLAYER_SHIP_H;
	ld	hl,#_sp_player_ship_y + 0
	ld	(hl), #0xba
;src/main.c:76: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
	ld	hl, #0xba20
	push	hl
	call	_draw_sp_player
	pop	af
;src/main.c:78: sp_vshot_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W/2) - SP_VSHOT_W;
	ld	hl,#_sp_vshot_x + 0
	ld	(hl), #0x23
;src/main.c:79: sp_vshot_y = SCREEN_BOTTOM - SP_PLAYER_SHIP_H - SP_VSHOT_H;
	ld	hl,#_sp_vshot_y + 0
	ld	(hl), #0xb4
;src/main.c:80: draw_sp_vshot(sp_vshot_x,sp_vshot_y);
	ld	hl, #0xb423
	push	hl
	call	_draw_sp_vshot
	pop	af
;src/main.c:82: sp_enemy_saucer_x = SCREEN_RIGHT - SP_ENEMY_SAUCER_W;
	ld	hl,#_sp_enemy_saucer_x + 0
	ld	(hl), #0x42
;src/main.c:83: sp_enemy_saucer_y = SCREEN_TOP + SCREEN_FRAME;
	ld	hl,#_sp_enemy_saucer_y + 0
	ld	(hl), #0x01
;src/main.c:84: sp_enemy_saucer_speed = -2;
	ld	hl,#_sp_enemy_saucer_speed + 0
	ld	(hl), #0xfe
;src/main.c:85: draw_sp_enemy_saucer(sp_enemy_saucer_x,sp_enemy_saucer_y);
	ld	hl, #0x0142
	push	hl
	call	_draw_sp_enemy_saucer
	pop	af
	ret
;src/main.c:88: u8 enemySaucerHitsBorder()
;	---------------------------------
; Function enemySaucerHitsBorder
; ---------------------------------
_enemySaucerHitsBorder::
;src/main.c:90: u8 hitLeftBorder = (sp_enemy_saucer_x <= SCREEN_LEFT);
	ld	iy, #_sp_enemy_saucer_x
	ld	a, 0 (iy)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	c, a
;src/main.c:91: u8 hitRightBorder = ((sp_enemy_saucer_x + SP_ENEMY_SAUCER_W) >= SCREEN_RIGHT );
	ld	e, 0 (iy)
	ld	d, #0x00
	ld	hl, #0x000e
	add	hl, de
	ld	de, #0x8050
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	b, a
;src/main.c:92: return ( hitLeftBorder || hitRightBorder );
	ld	a, c
	or	a,a
	jr	NZ,00104$
	or	a,b
	jr	NZ,00104$
	ld	l,a
	ret
00104$:
	ld	l, #0x01
	ret
;src/main.c:95: void moveSaucer()
;	---------------------------------
; Function moveSaucer
; ---------------------------------
_moveSaucer::
;src/main.c:97: if (enemySaucerHitsBorder())
	call	_enemySaucerHitsBorder
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/main.c:98: sp_enemy_saucer_speed = -sp_enemy_saucer_speed;
	xor	a, a
	ld	iy, #_sp_enemy_saucer_speed
	sub	a, 0 (iy)
	ld	0 (iy), a
00102$:
;src/main.c:100: sp_enemy_saucer_x += sp_enemy_saucer_speed;
	ld	hl, #_sp_enemy_saucer_speed
	push	de
	ld	iy, #_sp_enemy_saucer_x
	push	iy
	pop	de
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
	pop	de
;src/main.c:101: draw_sp_enemy_saucer(sp_enemy_saucer_x,sp_enemy_saucer_y);
	ld	a, (_sp_enemy_saucer_y)
	push	af
	inc	sp
	ld	a, (_sp_enemy_saucer_x)
	push	af
	inc	sp
	call	_draw_sp_enemy_saucer
	pop	af
	ret
;src/main.c:105: void main(void) 
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:114: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:116: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:117: cpct_setPalette(g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:118: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:120: initSprites();
	call	_initSprites
;src/main.c:125: while (TRUE)
00110$:
;src/main.c:127: moveSaucer();
	call	_moveSaucer
;src/main.c:128: cpct_scanKeyboard();
	call	_cpct_scanKeyboard
;src/main.c:130: if (cpct_isKeyPressed (Key_P))
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/main.c:132: if (sp_player_ship_x + SP_PLAYER_SHIP_W < SCREEN_RIGHT)
	ld	iy, #_sp_player_ship_x
	ld	c, 0 (iy)
	ld	b, #0x00
	ld	hl, #0x0008
	add	hl, bc
	ld	de, #0x8050
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	NC,00104$
;src/main.c:134: ++sp_player_ship_x;
	inc	0 (iy)
;src/main.c:135: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
	ld	a, (_sp_player_ship_y)
	push	af
	inc	sp
	ld	a, (_sp_player_ship_x)
	push	af
	inc	sp
	call	_draw_sp_player
	pop	af
00104$:
;src/main.c:140: if (cpct_isKeyPressed (Key_O))
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00108$
;src/main.c:142: if (sp_player_ship_x > SCREEN_LEFT)
	ld	iy, #_sp_player_ship_x
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00108$
;src/main.c:144: --sp_player_ship_x;
	dec	0 (iy)
;src/main.c:145: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
	ld	a, (_sp_player_ship_y)
	push	af
	inc	sp
	ld	a, (_sp_player_ship_x)
	push	af
	inc	sp
	call	_draw_sp_player
	pop	af
00108$:
;src/main.c:149: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00110$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
