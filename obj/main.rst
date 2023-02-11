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
                             12 	.globl _initSprites
                             13 	.globl _draw_sp_vshot
                             14 	.globl _draw_sp_enemy_saucer
                             15 	.globl _draw_sp_player
                             16 	.globl _drawSprite
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_setPALColour
                             19 	.globl _cpct_setPalette
                             20 	.globl _cpct_waitVSYNC
                             21 	.globl _cpct_setVideoMode
                             22 	.globl _cpct_drawSprite
                             23 	.globl _cpct_isKeyPressed
                             24 	.globl _cpct_scanKeyboard
                             25 	.globl _cpct_disableFirmware
                             26 	.globl _sp_enemy_saucer_speed
                             27 	.globl _sp_enemy_saucer_y
                             28 	.globl _sp_enemy_saucer_x
                             29 	.globl _sp_vshot_y_speed
                             30 	.globl _sp_vshot_y
                             31 	.globl _sp_vshot_x
                             32 	.globl _sp_player_ship_speed
                             33 	.globl _sp_player_ship_y
                             34 	.globl _sp_player_ship_x
                             35 ;--------------------------------------------------------
                             36 ; special function registers
                             37 ;--------------------------------------------------------
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DATA
   43E0                      42 _sp_player_ship_x::
   43E0                      43 	.ds 1
   43E1                      44 _sp_player_ship_y::
   43E1                      45 	.ds 1
   43E2                      46 _sp_player_ship_speed::
   43E2                      47 	.ds 1
   43E3                      48 _sp_vshot_x::
   43E3                      49 	.ds 1
   43E4                      50 _sp_vshot_y::
   43E4                      51 	.ds 1
   43E5                      52 _sp_vshot_y_speed::
   43E5                      53 	.ds 1
   43E6                      54 _sp_enemy_saucer_x::
   43E6                      55 	.ds 1
   43E7                      56 _sp_enemy_saucer_y::
   43E7                      57 	.ds 1
   43E8                      58 _sp_enemy_saucer_speed::
   43E8                      59 	.ds 1
                             60 ;--------------------------------------------------------
                             61 ; ram data
                             62 ;--------------------------------------------------------
                             63 	.area _INITIALIZED
                             64 ;--------------------------------------------------------
                             65 ; absolute external ram data
                             66 ;--------------------------------------------------------
                             67 	.area _DABS (ABS)
                             68 ;--------------------------------------------------------
                             69 ; global & static initialisations
                             70 ;--------------------------------------------------------
                             71 	.area _HOME
                             72 	.area _GSINIT
                             73 	.area _GSFINAL
                             74 	.area _GSINIT
                             75 ;--------------------------------------------------------
                             76 ; Home
                             77 ;--------------------------------------------------------
                             78 	.area _HOME
                             79 	.area _HOME
                             80 ;--------------------------------------------------------
                             81 ; code
                             82 ;--------------------------------------------------------
                             83 	.area _CODE
                             84 ;src/main.c:50: void drawSprite(u8 *sprite,int x,int y,int sprite_width,int sprite_height)
                             85 ;	---------------------------------
                             86 ; Function drawSprite
                             87 ; ---------------------------------
   412A                      88 _drawSprite::
   412A DD E5         [15]   89 	push	ix
   412C DD 21 00 00   [14]   90 	ld	ix,#0
   4130 DD 39         [15]   91 	add	ix,sp
                             92 ;src/main.c:53: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,x,y);
   4132 DD 56 08      [19]   93 	ld	d, 8 (ix)
   4135 DD 5E 06      [19]   94 	ld	e, 6 (ix)
   4138 D5            [11]   95 	push	de
   4139 21 00 C0      [10]   96 	ld	hl, #0xc000
   413C E5            [11]   97 	push	hl
   413D CD 99 43      [17]   98 	call	_cpct_getScreenPtr
   4140 EB            [ 4]   99 	ex	de,hl
                            100 ;src/main.c:54: cpct_drawSprite(sprite,pvmem,sprite_width,sprite_height);
   4141 DD 66 0C      [19]  101 	ld	h, 12 (ix)
   4144 DD 4E 0A      [19]  102 	ld	c, 10 (ix)
   4147 DD 6E 04      [19]  103 	ld	l, 4 (ix)
   414A DD 46 05      [19]  104 	ld	b, 5 (ix)
   414D E5            [11]  105 	push	hl
   414E 33            [ 6]  106 	inc	sp
   414F 79            [ 4]  107 	ld	a, c
   4150 F5            [11]  108 	push	af
   4151 33            [ 6]  109 	inc	sp
   4152 D5            [11]  110 	push	de
   4153 60            [ 4]  111 	ld	h, b
   4154 E5            [11]  112 	push	hl
   4155 CD C3 42      [17]  113 	call	_cpct_drawSprite
   4158 DD E1         [14]  114 	pop	ix
   415A C9            [10]  115 	ret
                            116 ;src/main.c:58: void draw_sp_player(u8 x,u8 y)
                            117 ;	---------------------------------
                            118 ; Function draw_sp_player
                            119 ; ---------------------------------
   415B                     120 _draw_sp_player::
   415B DD E5         [15]  121 	push	ix
   415D DD 21 00 00   [14]  122 	ld	ix,#0
   4161 DD 39         [15]  123 	add	ix,sp
                            124 ;src/main.c:60: drawSprite (sp_player_ship,x,y,SP_PLAYER_SHIP_W,SP_PLAYER_SHIP_H);
   4163 DD 5E 05      [19]  125 	ld	e, 5 (ix)
   4166 16 00         [ 7]  126 	ld	d, #0x00
   4168 DD 4E 04      [19]  127 	ld	c, 4 (ix)
   416B 06 00         [ 7]  128 	ld	b, #0x00
   416D 21 0E 00      [10]  129 	ld	hl, #0x000e
   4170 E5            [11]  130 	push	hl
   4171 2E 06         [ 7]  131 	ld	l, #0x06
   4173 E5            [11]  132 	push	hl
   4174 D5            [11]  133 	push	de
   4175 C5            [11]  134 	push	bc
   4176 21 C6 40      [10]  135 	ld	hl, #_sp_player_ship
   4179 E5            [11]  136 	push	hl
   417A CD 2A 41      [17]  137 	call	_drawSprite
   417D 21 0A 00      [10]  138 	ld	hl, #10
   4180 39            [11]  139 	add	hl, sp
   4181 F9            [ 6]  140 	ld	sp, hl
   4182 DD E1         [14]  141 	pop	ix
   4184 C9            [10]  142 	ret
                            143 ;src/main.c:63: void draw_sp_enemy_saucer(u8 x,u8 y)
                            144 ;	---------------------------------
                            145 ; Function draw_sp_enemy_saucer
                            146 ; ---------------------------------
   4185                     147 _draw_sp_enemy_saucer::
   4185 DD E5         [15]  148 	push	ix
   4187 DD 21 00 00   [14]  149 	ld	ix,#0
   418B DD 39         [15]  150 	add	ix,sp
                            151 ;src/main.c:65: drawSprite (sp_enemy_saucer,x,y,SP_ENEMY_SAUCER_W,SP_ENEMY_SAUCER_H);
   418D DD 5E 05      [19]  152 	ld	e, 5 (ix)
   4190 16 00         [ 7]  153 	ld	d, #0x00
   4192 DD 4E 04      [19]  154 	ld	c, 4 (ix)
   4195 06 00         [ 7]  155 	ld	b, #0x00
   4197 21 10 00      [10]  156 	ld	hl, #0x0010
   419A E5            [11]  157 	push	hl
   419B 2E 0C         [ 7]  158 	ld	l, #0x0c
   419D E5            [11]  159 	push	hl
   419E D5            [11]  160 	push	de
   419F C5            [11]  161 	push	bc
   41A0 21 06 40      [10]  162 	ld	hl, #_sp_enemy_saucer
   41A3 E5            [11]  163 	push	hl
   41A4 CD 2A 41      [17]  164 	call	_drawSprite
   41A7 21 0A 00      [10]  165 	ld	hl, #10
   41AA 39            [11]  166 	add	hl, sp
   41AB F9            [ 6]  167 	ld	sp, hl
   41AC DD E1         [14]  168 	pop	ix
   41AE C9            [10]  169 	ret
                            170 ;src/main.c:67: void draw_sp_vshot(u8 x,u8 y)
                            171 ;	---------------------------------
                            172 ; Function draw_sp_vshot
                            173 ; ---------------------------------
   41AF                     174 _draw_sp_vshot::
   41AF DD E5         [15]  175 	push	ix
   41B1 DD 21 00 00   [14]  176 	ld	ix,#0
   41B5 DD 39         [15]  177 	add	ix,sp
                            178 ;src/main.c:69: drawSprite (sp_vshot,x,y,SP_VSHOT_W,SP_VSHOT_H);
   41B7 DD 5E 05      [19]  179 	ld	e, 5 (ix)
   41BA 16 00         [ 7]  180 	ld	d, #0x00
   41BC DD 4E 04      [19]  181 	ld	c, 4 (ix)
   41BF 06 00         [ 7]  182 	ld	b, #0x00
   41C1 21 06 00      [10]  183 	ld	hl, #0x0006
   41C4 E5            [11]  184 	push	hl
   41C5 2E 01         [ 7]  185 	ld	l, #0x01
   41C7 E5            [11]  186 	push	hl
   41C8 D5            [11]  187 	push	de
   41C9 C5            [11]  188 	push	bc
   41CA 21 00 40      [10]  189 	ld	hl, #_sp_vshot
   41CD E5            [11]  190 	push	hl
   41CE CD 2A 41      [17]  191 	call	_drawSprite
   41D1 21 0A 00      [10]  192 	ld	hl, #10
   41D4 39            [11]  193 	add	hl, sp
   41D5 F9            [ 6]  194 	ld	sp, hl
   41D6 DD E1         [14]  195 	pop	ix
   41D8 C9            [10]  196 	ret
                            197 ;src/main.c:72: void initSprites()
                            198 ;	---------------------------------
                            199 ; Function initSprites
                            200 ; ---------------------------------
   41D9                     201 _initSprites::
                            202 ;src/main.c:74: sp_player_ship_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W);
   41D9 21 E0 43      [10]  203 	ld	hl,#_sp_player_ship_x + 0
   41DC 36 22         [10]  204 	ld	(hl), #0x22
                            205 ;src/main.c:75: sp_player_ship_y = SCREEN_BOTTOM-SP_PLAYER_SHIP_H;
   41DE 21 E1 43      [10]  206 	ld	hl,#_sp_player_ship_y + 0
   41E1 36 BA         [10]  207 	ld	(hl), #0xba
                            208 ;src/main.c:76: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
   41E3 21 22 BA      [10]  209 	ld	hl, #0xba22
   41E6 E5            [11]  210 	push	hl
   41E7 CD 5B 41      [17]  211 	call	_draw_sp_player
   41EA F1            [10]  212 	pop	af
                            213 ;src/main.c:78: sp_vshot_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W/2);
   41EB 21 E3 43      [10]  214 	ld	hl,#_sp_vshot_x + 0
   41EE 36 25         [10]  215 	ld	(hl), #0x25
                            216 ;src/main.c:79: sp_vshot_y = SCREEN_BOTTOM - SP_PLAYER_SHIP_H - SP_VSHOT_H;
   41F0 21 E4 43      [10]  217 	ld	hl,#_sp_vshot_y + 0
   41F3 36 B4         [10]  218 	ld	(hl), #0xb4
                            219 ;src/main.c:80: draw_sp_vshot(sp_vshot_x,sp_vshot_y);
   41F5 21 25 B4      [10]  220 	ld	hl, #0xb425
   41F8 E5            [11]  221 	push	hl
   41F9 CD AF 41      [17]  222 	call	_draw_sp_vshot
   41FC F1            [10]  223 	pop	af
                            224 ;src/main.c:82: sp_enemy_saucer_x = SCREEN_RIGHT - SP_ENEMY_SAUCER_W;
   41FD 21 E6 43      [10]  225 	ld	hl,#_sp_enemy_saucer_x + 0
   4200 36 44         [10]  226 	ld	(hl), #0x44
                            227 ;src/main.c:83: sp_enemy_saucer_y = SCREEN_TOP + SCREEN_FRAME;
   4202 21 E7 43      [10]  228 	ld	hl,#_sp_enemy_saucer_y + 0
   4205 36 01         [10]  229 	ld	(hl), #0x01
                            230 ;src/main.c:84: sp_enemy_saucer_speed = 1;
   4207 21 E8 43      [10]  231 	ld	hl,#_sp_enemy_saucer_speed + 0
   420A 36 01         [10]  232 	ld	(hl), #0x01
                            233 ;src/main.c:85: draw_sp_enemy_saucer(sp_enemy_saucer_x,sp_enemy_saucer_y);
   420C 21 44 01      [10]  234 	ld	hl, #0x0144
   420F E5            [11]  235 	push	hl
   4210 CD 85 41      [17]  236 	call	_draw_sp_enemy_saucer
   4213 F1            [10]  237 	pop	af
   4214 C9            [10]  238 	ret
                            239 ;src/main.c:89: void main(void) 
                            240 ;	---------------------------------
                            241 ; Function main
                            242 ; ---------------------------------
   4215                     243 _main::
                            244 ;src/main.c:98: cpct_disableFirmware();
   4215 CD 88 43      [17]  245 	call	_cpct_disableFirmware
                            246 ;src/main.c:100: cpct_setVideoMode(0);
   4218 2E 00         [ 7]  247 	ld	l, #0x00
   421A CD 7A 43      [17]  248 	call	_cpct_setVideoMode
                            249 ;src/main.c:101: cpct_setPalette(g_palette, 16);
   421D 21 10 00      [10]  250 	ld	hl, #0x0010
   4220 E5            [11]  251 	push	hl
   4221 21 1A 41      [10]  252 	ld	hl, #_g_palette
   4224 E5            [11]  253 	push	hl
   4225 CD 94 42      [17]  254 	call	_cpct_setPalette
                            255 ;src/main.c:102: cpct_setBorder(HW_BLACK);
   4228 21 10 14      [10]  256 	ld	hl, #0x1410
   422B E5            [11]  257 	push	hl
   422C CD B7 42      [17]  258 	call	_cpct_setPALColour
                            259 ;src/main.c:104: initSprites();
   422F CD D9 41      [17]  260 	call	_initSprites
                            261 ;src/main.c:109: while (TRUE)
   4232                     262 00110$:
                            263 ;src/main.c:111: cpct_scanKeyboard();
   4232 CD AF 43      [17]  264 	call	_cpct_scanKeyboard
                            265 ;src/main.c:113: if (cpct_isKeyPressed (Key_P))
   4235 21 03 08      [10]  266 	ld	hl, #0x0803
   4238 CD AB 42      [17]  267 	call	_cpct_isKeyPressed
   423B 7D            [ 4]  268 	ld	a, l
   423C B7            [ 4]  269 	or	a, a
   423D 28 2B         [12]  270 	jr	Z,00104$
                            271 ;src/main.c:115: if (sp_player_ship_x + SP_PLAYER_SHIP_W < SCREEN_RIGHT)
   423F FD 21 E0 43   [14]  272 	ld	iy, #_sp_player_ship_x
   4243 FD 4E 00      [19]  273 	ld	c, 0 (iy)
   4246 06 00         [ 7]  274 	ld	b, #0x00
   4248 21 06 00      [10]  275 	ld	hl, #0x0006
   424B 09            [11]  276 	add	hl, bc
   424C 11 50 80      [10]  277 	ld	de, #0x8050
   424F 29            [11]  278 	add	hl, hl
   4250 3F            [ 4]  279 	ccf
   4251 CB 1C         [ 8]  280 	rr	h
   4253 CB 1D         [ 8]  281 	rr	l
   4255 ED 52         [15]  282 	sbc	hl, de
   4257 30 11         [12]  283 	jr	NC,00104$
                            284 ;src/main.c:117: ++sp_player_ship_x;
   4259 FD 34 00      [23]  285 	inc	0 (iy)
                            286 ;src/main.c:118: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
   425C 3A E1 43      [13]  287 	ld	a, (_sp_player_ship_y)
   425F F5            [11]  288 	push	af
   4260 33            [ 6]  289 	inc	sp
   4261 3A E0 43      [13]  290 	ld	a, (_sp_player_ship_x)
   4264 F5            [11]  291 	push	af
   4265 33            [ 6]  292 	inc	sp
   4266 CD 5B 41      [17]  293 	call	_draw_sp_player
   4269 F1            [10]  294 	pop	af
   426A                     295 00104$:
                            296 ;src/main.c:123: if (cpct_isKeyPressed (Key_O))
   426A 21 04 04      [10]  297 	ld	hl, #0x0404
   426D CD AB 42      [17]  298 	call	_cpct_isKeyPressed
   4270 7D            [ 4]  299 	ld	a, l
   4271 B7            [ 4]  300 	or	a, a
   4272 28 1B         [12]  301 	jr	Z,00108$
                            302 ;src/main.c:125: if (sp_player_ship_x > SCREEN_LEFT)
   4274 FD 21 E0 43   [14]  303 	ld	iy, #_sp_player_ship_x
   4278 FD 7E 00      [19]  304 	ld	a, 0 (iy)
   427B B7            [ 4]  305 	or	a, a
   427C 28 11         [12]  306 	jr	Z,00108$
                            307 ;src/main.c:127: --sp_player_ship_x;
   427E FD 35 00      [23]  308 	dec	0 (iy)
                            309 ;src/main.c:128: draw_sp_player(sp_player_ship_x,sp_player_ship_y);
   4281 3A E1 43      [13]  310 	ld	a, (_sp_player_ship_y)
   4284 F5            [11]  311 	push	af
   4285 33            [ 6]  312 	inc	sp
   4286 3A E0 43      [13]  313 	ld	a, (_sp_player_ship_x)
   4289 F5            [11]  314 	push	af
   428A 33            [ 6]  315 	inc	sp
   428B CD 5B 41      [17]  316 	call	_draw_sp_player
   428E F1            [10]  317 	pop	af
   428F                     318 00108$:
                            319 ;src/main.c:132: cpct_waitVSYNC();
   428F CD 72 43      [17]  320 	call	_cpct_waitVSYNC
   4292 18 9E         [12]  321 	jr	00110$
                            322 	.area _CODE
                            323 	.area _INITIALIZER
                            324 	.area _CABS (ABS)
