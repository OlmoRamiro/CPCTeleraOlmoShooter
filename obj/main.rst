                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _moveSaucer
                             13 	.globl _enemySaucerHitsBorder
                             14 	.globl _initSprites
                             15 	.globl _draw_sp_vshot
                             16 	.globl _draw_sp_enemy_saucer
                             17 	.globl _draw_sp_player
                             18 	.globl _drawSprite
                             19 	.globl _cpct_getScreenPtr
                             20 	.globl _cpct_setPALColour
                             21 	.globl _cpct_setPalette
                             22 	.globl _cpct_waitVSYNC
                             23 	.globl _cpct_setVideoMode
                             24 	.globl _cpct_drawSprite
                             25 	.globl _cpct_isKeyPressed
                             26 	.globl _cpct_scanKeyboard
                             27 	.globl _cpct_disableFirmware
                             28 	.globl _sp_enemy_saucer_speed
                             29 	.globl _sp_enemy_saucer_y
                             30 	.globl _sp_enemy_saucer_x
                             31 	.globl _sp_vshot_y_speed
                             32 	.globl _sp_vshot_y
                             33 	.globl _sp_vshot_x
                             34 	.globl _sp_player_ship_speed
                             35 	.globl _sp_player_ship_y
                             36 	.globl _sp_player_ship_x
                             37 ;--------------------------------------------------------
                             38 ; special function registers
                             39 ;--------------------------------------------------------
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DATA
   4482                      44 _sp_player_ship_x::
   4482                      45 	.ds 1
   4483                      46 _sp_player_ship_y::
   4483                      47 	.ds 1
   4484                      48 _sp_player_ship_speed::
   4484                      49 	.ds 1
   4485                      50 _sp_vshot_x::
   4485                      51 	.ds 1
   4486                      52 _sp_vshot_y::
   4486                      53 	.ds 1
   4487                      54 _sp_vshot_y_speed::
   4487                      55 	.ds 1
   4488                      56 _sp_enemy_saucer_x::
   4488                      57 	.ds 1
   4489                      58 _sp_enemy_saucer_y::
   4489                      59 	.ds 1
   448A                      60 _sp_enemy_saucer_speed::
   448A                      61 	.ds 1
                             62 ;--------------------------------------------------------
                             63 ; ram data
                             64 ;--------------------------------------------------------
                             65 	.area _INITIALIZED
                             66 ;--------------------------------------------------------
                             67 ; absolute external ram data
                             68 ;--------------------------------------------------------
                             69 	.area _DABS (ABS)
                             70 ;--------------------------------------------------------
                             71 ; global & static initialisations
                             72 ;--------------------------------------------------------
                             73 	.area _HOME
                             74 	.area _GSINIT
                             75 	.area _GSFINAL
                             76 	.area _GSINIT
                             77 ;--------------------------------------------------------
                             78 ; Home
                             79 ;--------------------------------------------------------
                             80 	.area _HOME
                             81 	.area _HOME
                             82 ;--------------------------------------------------------
                             83 ; code
                             84 ;--------------------------------------------------------
                             85 	.area _CODE
                             86 ;src/main.c:50: void drawSprite(u8 *sprite,int x,int y,int sprite_width,int sprite_height)
                             87 ;	---------------------------------
                             88 ; Function drawSprite
                             89 ; ---------------------------------
   4166                      90 _drawSprite::
   4166 DD E5         [15]   91 	push	ix
   4168 DD 21 00 00   [14]   92 	ld	ix,#0
   416C DD 39         [15]   93 	add	ix,sp
                             94 ;src/main.c:53: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,x,y);
   416E DD 56 08      [19]   95 	ld	d, 8 (ix)
   4171 DD 5E 06      [19]   96 	ld	e, 6 (ix)
   4174 D5            [11]   97 	push	de
   4175 21 00 C0      [10]   98 	ld	hl, #0xc000
   4178 E5            [11]   99 	push	hl
   4179 CD 3B 44      [17]  100 	call	_cpct_getScreenPtr
   417C EB            [ 4]  101 	ex	de,hl
                            102 ;src/main.c:54: cpct_drawSprite(sprite,pvmem,sprite_width,sprite_height);
   417D DD 66 0C      [19]  103 	ld	h, 12 (ix)
   4180 DD 4E 0A      [19]  104 	ld	c, 10 (ix)
   4183 DD 6E 04      [19]  105 	ld	l, 4 (ix)
   4186 DD 46 05      [19]  106 	ld	b, 5 (ix)
   4189 E5            [11]  107 	push	hl
   418A 33            [ 6]  108 	inc	sp
   418B 79            [ 4]  109 	ld	a, c
   418C F5            [11]  110 	push	af
   418D 33            [ 6]  111 	inc	sp
   418E D5            [11]  112 	push	de
   418F 60            [ 4]  113 	ld	h, b
   4190 E5            [11]  114 	push	hl
   4191 CD 65 43      [17]  115 	call	_cpct_drawSprite
   4194 DD E1         [14]  116 	pop	ix
   4196 C9            [10]  117 	ret
                            118 ;src/main.c:58: void draw_sp_player(u8 x,u8 y)
                            119 ;	---------------------------------
                            120 ; Function draw_sp_player
                            121 ; ---------------------------------
   4197                     122 _draw_sp_player::
   4197 DD E5         [15]  123 	push	ix
   4199 DD 21 00 00   [14]  124 	ld	ix,#0
   419D DD 39         [15]  125 	add	ix,sp
                            126 ;src/main.c:60: drawSprite (sp_player_ship,x,y,SP_PLAYER_SHIP_W,SP_PLAYER_SHIP_H);
   419F DD 5E 05      [19]  127 	ld	e, 5 (ix)
   41A2 16 00         [ 7]  128 	ld	d, #0x00
   41A4 DD 4E 04      [19]  129 	ld	c, 4 (ix)
   41A7 06 00         [ 7]  130 	ld	b, #0x00
   41A9 21 0E 00      [10]  131 	ld	hl, #0x000e
   41AC E5            [11]  132 	push	hl
   41AD 2E 08         [ 7]  133 	ld	l, #0x08
   41AF E5            [11]  134 	push	hl
   41B0 D5            [11]  135 	push	de
   41B1 C5            [11]  136 	push	bc
   41B2 21 E6 40      [10]  137 	ld	hl, #_sp_player_ship
   41B5 E5            [11]  138 	push	hl
   41B6 CD 66 41      [17]  139 	call	_drawSprite
   41B9 21 0A 00      [10]  140 	ld	hl, #10
   41BC 39            [11]  141 	add	hl, sp
   41BD F9            [ 6]  142 	ld	sp, hl
   41BE DD E1         [14]  143 	pop	ix
   41C0 C9            [10]  144 	ret
                            145 ;src/main.c:63: void draw_sp_enemy_saucer(u8 x,u8 y)
                            146 ;	---------------------------------
                            147 ; Function draw_sp_enemy_saucer
                            148 ; ---------------------------------
   41C1                     149 _draw_sp_enemy_saucer::
   41C1 DD E5         [15]  150 	push	ix
   41C3 DD 21 00 00   [14]  151 	ld	ix,#0
   41C7 DD 39         [15]  152 	add	ix,sp
                            153 ;src/main.c:65: drawSprite (sp_enemy_saucer,x,y,SP_ENEMY_SAUCER_W,SP_ENEMY_SAUCER_H);
   41C9 DD 5E 05      [19]  154 	ld	e, 5 (ix)
   41CC 16 00         [ 7]  155 	ld	d, #0x00
   41CE DD 4E 04      [19]  156 	ld	c, 4 (ix)
   41D1 06 00         [ 7]  157 	ld	b, #0x00
   41D3 21 10 00      [10]  158 	ld	hl, #0x0010
   41D6 E5            [11]  159 	push	hl
   41D7 2E 0E         [ 7]  160 	ld	l, #0x0e
   41D9 E5            [11]  161 	push	hl
   41DA D5            [11]  162 	push	de
   41DB C5            [11]  163 	push	bc
   41DC 21 06 40      [10]  164 	ld	hl, #_sp_enemy_saucer
   41DF E5            [11]  165 	push	hl
   41E0 CD 66 41      [17]  166 	call	_drawSprite
   41E3 21 0A 00      [10]  167 	ld	hl, #10
   41E6 39            [11]  168 	add	hl, sp
   41E7 F9            [ 6]  169 	ld	sp, hl
   41E8 DD E1         [14]  170 	pop	ix
   41EA C9            [10]  171 	ret
                            172 ;src/main.c:67: void draw_sp_vshot(u8 x,u8 y)
                            173 ;	---------------------------------
                            174 ; Function draw_sp_vshot
                            175 ; ---------------------------------
   41EB                     176 _draw_sp_vshot::
   41EB DD E5         [15]  177 	push	ix
   41ED DD 21 00 00   [14]  178 	ld	ix,#0
   41F1 DD 39         [15]  179 	add	ix,sp
                            180 ;src/main.c:69: drawSprite (sp_vshot,x,y,SP_VSHOT_W,SP_VSHOT_H);
   41F3 DD 5E 05      [19]  181 	ld	e, 5 (ix)
   41F6 16 00         [ 7]  182 	ld	d, #0x00
   41F8 DD 4E 04      [19]  183 	ld	c, 4 (ix)
   41FB 06 00         [ 7]  184 	ld	b, #0x00
   41FD 21 06 00      [10]  185 	ld	hl, #0x0006
   4200 E5            [11]  186 	push	hl
   4201 2E 01         [ 7]  187 	ld	l, #0x01
   4203 E5            [11]  188 	push	hl
   4204 D5            [11]  189 	push	de
   4205 C5            [11]  190 	push	bc
   4206 21 00 40      [10]  191 	ld	hl, #_sp_vshot
   4209 E5            [11]  192 	push	hl
   420A CD 66 41      [17]  193 	call	_drawSprite
   420D 21 0A 00      [10]  194 	ld	hl, #10
   4210 39            [11]  195 	add	hl, sp
   4211 F9            [ 6]  196 	ld	sp, hl
   4212 DD E1         [14]  197 	pop	ix
   4214 C9            [10]  198 	ret
                            199 ;src/main.c:72: void initSprites()
                            200 ;	---------------------------------
                            201 ; Function initSprites
                            202 ; ---------------------------------
   4215                     203 _initSprites::
                            204 ;src/main.c:74: sp_player_ship_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W);
   4215 21 82 44      [10]  205 	ld	hl,#_sp_player_ship_x + 0
   4218 36 20         [10]  206 	ld	(hl), #0x20
                            207 ;src/main.c:75: sp_player_ship_y = SCREEN_BOTTOM-SP_PLAYER_SHIP_H;
   421A 21 83 44      [10]  208 	ld	hl,#_sp_player_ship_y + 0
   421D 36 BA         [10]  209 	ld	(hl), #0xba
                            210 ;src/main.c:76: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
   421F 21 20 BA      [10]  211 	ld	hl, #0xba20
   4222 E5            [11]  212 	push	hl
   4223 CD 97 41      [17]  213 	call	_draw_sp_player
   4226 F1            [10]  214 	pop	af
                            215 ;src/main.c:78: sp_vshot_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W/2) - SP_VSHOT_W;
   4227 21 85 44      [10]  216 	ld	hl,#_sp_vshot_x + 0
   422A 36 23         [10]  217 	ld	(hl), #0x23
                            218 ;src/main.c:79: sp_vshot_y = SCREEN_BOTTOM - SP_PLAYER_SHIP_H - SP_VSHOT_H;
   422C 21 86 44      [10]  219 	ld	hl,#_sp_vshot_y + 0
   422F 36 B4         [10]  220 	ld	(hl), #0xb4
                            221 ;src/main.c:80: draw_sp_vshot(sp_vshot_x,sp_vshot_y);
   4231 21 23 B4      [10]  222 	ld	hl, #0xb423
   4234 E5            [11]  223 	push	hl
   4235 CD EB 41      [17]  224 	call	_draw_sp_vshot
   4238 F1            [10]  225 	pop	af
                            226 ;src/main.c:82: sp_enemy_saucer_x = SCREEN_RIGHT - SP_ENEMY_SAUCER_W;
   4239 21 88 44      [10]  227 	ld	hl,#_sp_enemy_saucer_x + 0
   423C 36 42         [10]  228 	ld	(hl), #0x42
                            229 ;src/main.c:83: sp_enemy_saucer_y = SCREEN_TOP + SCREEN_FRAME;
   423E 21 89 44      [10]  230 	ld	hl,#_sp_enemy_saucer_y + 0
   4241 36 01         [10]  231 	ld	(hl), #0x01
                            232 ;src/main.c:84: sp_enemy_saucer_speed = -2;
   4243 21 8A 44      [10]  233 	ld	hl,#_sp_enemy_saucer_speed + 0
   4246 36 FE         [10]  234 	ld	(hl), #0xfe
                            235 ;src/main.c:85: draw_sp_enemy_saucer(sp_enemy_saucer_x,sp_enemy_saucer_y);
   4248 21 42 01      [10]  236 	ld	hl, #0x0142
   424B E5            [11]  237 	push	hl
   424C CD C1 41      [17]  238 	call	_draw_sp_enemy_saucer
   424F F1            [10]  239 	pop	af
   4250 C9            [10]  240 	ret
                            241 ;src/main.c:88: u8 enemySaucerHitsBorder()
                            242 ;	---------------------------------
                            243 ; Function enemySaucerHitsBorder
                            244 ; ---------------------------------
   4251                     245 _enemySaucerHitsBorder::
                            246 ;src/main.c:90: u8 hitLeftBorder = (sp_enemy_saucer_x <= SCREEN_LEFT);
   4251 FD 21 88 44   [14]  247 	ld	iy, #_sp_enemy_saucer_x
   4255 FD 7E 00      [19]  248 	ld	a, 0 (iy)
   4258 D6 01         [ 7]  249 	sub	a,#0x01
   425A 3E 00         [ 7]  250 	ld	a, #0x00
   425C 17            [ 4]  251 	rla
   425D 4F            [ 4]  252 	ld	c, a
                            253 ;src/main.c:91: u8 hitRightBorder = ((sp_enemy_saucer_x + SP_ENEMY_SAUCER_W) >= SCREEN_RIGHT );
   425E FD 5E 00      [19]  254 	ld	e, 0 (iy)
   4261 16 00         [ 7]  255 	ld	d, #0x00
   4263 21 0E 00      [10]  256 	ld	hl, #0x000e
   4266 19            [11]  257 	add	hl, de
   4267 11 50 80      [10]  258 	ld	de, #0x8050
   426A 29            [11]  259 	add	hl, hl
   426B 3F            [ 4]  260 	ccf
   426C CB 1C         [ 8]  261 	rr	h
   426E CB 1D         [ 8]  262 	rr	l
   4270 ED 52         [15]  263 	sbc	hl, de
   4272 3E 00         [ 7]  264 	ld	a, #0x00
   4274 17            [ 4]  265 	rla
   4275 EE 01         [ 7]  266 	xor	a, #0x01
   4277 47            [ 4]  267 	ld	b, a
                            268 ;src/main.c:92: return ( hitLeftBorder || hitRightBorder );
   4278 79            [ 4]  269 	ld	a, c
   4279 B7            [ 4]  270 	or	a,a
   427A 20 05         [12]  271 	jr	NZ,00104$
   427C B0            [ 4]  272 	or	a,b
   427D 20 02         [12]  273 	jr	NZ,00104$
   427F 6F            [ 4]  274 	ld	l,a
   4280 C9            [10]  275 	ret
   4281                     276 00104$:
   4281 2E 01         [ 7]  277 	ld	l, #0x01
   4283 C9            [10]  278 	ret
                            279 ;src/main.c:95: void moveSaucer()
                            280 ;	---------------------------------
                            281 ; Function moveSaucer
                            282 ; ---------------------------------
   4284                     283 _moveSaucer::
                            284 ;src/main.c:97: if (enemySaucerHitsBorder())
   4284 CD 51 42      [17]  285 	call	_enemySaucerHitsBorder
   4287 7D            [ 4]  286 	ld	a, l
   4288 B7            [ 4]  287 	or	a, a
   4289 28 0B         [12]  288 	jr	Z,00102$
                            289 ;src/main.c:98: sp_enemy_saucer_speed = -sp_enemy_saucer_speed;
   428B AF            [ 4]  290 	xor	a, a
   428C FD 21 8A 44   [14]  291 	ld	iy, #_sp_enemy_saucer_speed
   4290 FD 96 00      [19]  292 	sub	a, 0 (iy)
   4293 FD 77 00      [19]  293 	ld	0 (iy), a
   4296                     294 00102$:
                            295 ;src/main.c:100: sp_enemy_saucer_x += sp_enemy_saucer_speed;
   4296 21 8A 44      [10]  296 	ld	hl, #_sp_enemy_saucer_speed
   4299 D5            [11]  297 	push	de
   429A FD 21 88 44   [14]  298 	ld	iy, #_sp_enemy_saucer_x
   429E FD E5         [15]  299 	push	iy
   42A0 D1            [10]  300 	pop	de
   42A1 1A            [ 7]  301 	ld	a, (de)
   42A2 86            [ 7]  302 	add	a, (hl)
   42A3 12            [ 7]  303 	ld	(de), a
   42A4 D1            [10]  304 	pop	de
                            305 ;src/main.c:101: draw_sp_enemy_saucer(sp_enemy_saucer_x,sp_enemy_saucer_y);
   42A5 3A 89 44      [13]  306 	ld	a, (_sp_enemy_saucer_y)
   42A8 F5            [11]  307 	push	af
   42A9 33            [ 6]  308 	inc	sp
   42AA 3A 88 44      [13]  309 	ld	a, (_sp_enemy_saucer_x)
   42AD F5            [11]  310 	push	af
   42AE 33            [ 6]  311 	inc	sp
   42AF CD C1 41      [17]  312 	call	_draw_sp_enemy_saucer
   42B2 F1            [10]  313 	pop	af
   42B3 C9            [10]  314 	ret
                            315 ;src/main.c:105: void main(void) 
                            316 ;	---------------------------------
                            317 ; Function main
                            318 ; ---------------------------------
   42B4                     319 _main::
                            320 ;src/main.c:114: cpct_disableFirmware();
   42B4 CD 2A 44      [17]  321 	call	_cpct_disableFirmware
                            322 ;src/main.c:116: cpct_setVideoMode(0);
   42B7 2E 00         [ 7]  323 	ld	l, #0x00
   42B9 CD 1C 44      [17]  324 	call	_cpct_setVideoMode
                            325 ;src/main.c:117: cpct_setPalette(g_palette, 16);
   42BC 21 10 00      [10]  326 	ld	hl, #0x0010
   42BF E5            [11]  327 	push	hl
   42C0 21 56 41      [10]  328 	ld	hl, #_g_palette
   42C3 E5            [11]  329 	push	hl
   42C4 CD 36 43      [17]  330 	call	_cpct_setPalette
                            331 ;src/main.c:118: cpct_setBorder(HW_BLACK);
   42C7 21 10 14      [10]  332 	ld	hl, #0x1410
   42CA E5            [11]  333 	push	hl
   42CB CD 59 43      [17]  334 	call	_cpct_setPALColour
                            335 ;src/main.c:120: initSprites();
   42CE CD 15 42      [17]  336 	call	_initSprites
                            337 ;src/main.c:125: while (TRUE)
   42D1                     338 00110$:
                            339 ;src/main.c:127: moveSaucer();
   42D1 CD 84 42      [17]  340 	call	_moveSaucer
                            341 ;src/main.c:128: cpct_scanKeyboard();
   42D4 CD 51 44      [17]  342 	call	_cpct_scanKeyboard
                            343 ;src/main.c:130: if (cpct_isKeyPressed (Key_P))
   42D7 21 03 08      [10]  344 	ld	hl, #0x0803
   42DA CD 4D 43      [17]  345 	call	_cpct_isKeyPressed
   42DD 7D            [ 4]  346 	ld	a, l
   42DE B7            [ 4]  347 	or	a, a
   42DF 28 2B         [12]  348 	jr	Z,00104$
                            349 ;src/main.c:132: if (sp_player_ship_x + SP_PLAYER_SHIP_W < SCREEN_RIGHT)
   42E1 FD 21 82 44   [14]  350 	ld	iy, #_sp_player_ship_x
   42E5 FD 4E 00      [19]  351 	ld	c, 0 (iy)
   42E8 06 00         [ 7]  352 	ld	b, #0x00
   42EA 21 08 00      [10]  353 	ld	hl, #0x0008
   42ED 09            [11]  354 	add	hl, bc
   42EE 11 50 80      [10]  355 	ld	de, #0x8050
   42F1 29            [11]  356 	add	hl, hl
   42F2 3F            [ 4]  357 	ccf
   42F3 CB 1C         [ 8]  358 	rr	h
   42F5 CB 1D         [ 8]  359 	rr	l
   42F7 ED 52         [15]  360 	sbc	hl, de
   42F9 30 11         [12]  361 	jr	NC,00104$
                            362 ;src/main.c:134: ++sp_player_ship_x;
   42FB FD 34 00      [23]  363 	inc	0 (iy)
                            364 ;src/main.c:135: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
   42FE 3A 83 44      [13]  365 	ld	a, (_sp_player_ship_y)
   4301 F5            [11]  366 	push	af
   4302 33            [ 6]  367 	inc	sp
   4303 3A 82 44      [13]  368 	ld	a, (_sp_player_ship_x)
   4306 F5            [11]  369 	push	af
   4307 33            [ 6]  370 	inc	sp
   4308 CD 97 41      [17]  371 	call	_draw_sp_player
   430B F1            [10]  372 	pop	af
   430C                     373 00104$:
                            374 ;src/main.c:140: if (cpct_isKeyPressed (Key_O))
   430C 21 04 04      [10]  375 	ld	hl, #0x0404
   430F CD 4D 43      [17]  376 	call	_cpct_isKeyPressed
   4312 7D            [ 4]  377 	ld	a, l
   4313 B7            [ 4]  378 	or	a, a
   4314 28 1B         [12]  379 	jr	Z,00108$
                            380 ;src/main.c:142: if (sp_player_ship_x > SCREEN_LEFT)
   4316 FD 21 82 44   [14]  381 	ld	iy, #_sp_player_ship_x
   431A FD 7E 00      [19]  382 	ld	a, 0 (iy)
   431D B7            [ 4]  383 	or	a, a
   431E 28 11         [12]  384 	jr	Z,00108$
                            385 ;src/main.c:144: --sp_player_ship_x;
   4320 FD 35 00      [23]  386 	dec	0 (iy)
                            387 ;src/main.c:145: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
   4323 3A 83 44      [13]  388 	ld	a, (_sp_player_ship_y)
   4326 F5            [11]  389 	push	af
   4327 33            [ 6]  390 	inc	sp
   4328 3A 82 44      [13]  391 	ld	a, (_sp_player_ship_x)
   432B F5            [11]  392 	push	af
   432C 33            [ 6]  393 	inc	sp
   432D CD 97 41      [17]  394 	call	_draw_sp_player
   4330 F1            [10]  395 	pop	af
   4331                     396 00108$:
                            397 ;src/main.c:149: cpct_waitVSYNC();
   4331 CD 14 44      [17]  398 	call	_cpct_waitVSYNC
   4334 18 9B         [12]  399 	jr	00110$
                            400 	.area _CODE
                            401 	.area _INITIALIZER
                            402 	.area _CABS (ABS)
