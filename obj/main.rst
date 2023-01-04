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
                             12 	.globl _drawSprite
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_setPALColour
                             15 	.globl _cpct_setPalette
                             16 	.globl _cpct_waitVSYNC
                             17 	.globl _cpct_setVideoMode
                             18 	.globl _cpct_drawSprite
                             19 	.globl _cpct_disableFirmware
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 ;src/main.c:32: void drawSprite(u8 *sprite,int sprite_vertical_pos,int sprite_horizontal_pos,int sprite_width,int sprite_height)
                             52 ;	---------------------------------
                             53 ; Function drawSprite
                             54 ; ---------------------------------
   412A                      55 _drawSprite::
   412A DD E5         [15]   56 	push	ix
   412C DD 21 00 00   [14]   57 	ld	ix,#0
   4130 DD 39         [15]   58 	add	ix,sp
                             59 ;src/main.c:35: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,sprite_vertical_pos,sprite_horizontal_pos);
   4132 DD 56 08      [19]   60 	ld	d, 8 (ix)
   4135 DD 5E 06      [19]   61 	ld	e, 6 (ix)
   4138 D5            [11]   62 	push	de
   4139 21 00 C0      [10]   63 	ld	hl, #0xc000
   413C E5            [11]   64 	push	hl
   413D CD B4 42      [17]   65 	call	_cpct_getScreenPtr
   4140 EB            [ 4]   66 	ex	de,hl
                             67 ;src/main.c:36: cpct_drawSprite(sprite,pvmem,sprite_width,sprite_height);
   4141 DD 66 0C      [19]   68 	ld	h, 12 (ix)
   4144 DD 4E 0A      [19]   69 	ld	c, 10 (ix)
   4147 DD 6E 04      [19]   70 	ld	l, 4 (ix)
   414A DD 46 05      [19]   71 	ld	b, 5 (ix)
   414D E5            [11]   72 	push	hl
   414E 33            [ 6]   73 	inc	sp
   414F 79            [ 4]   74 	ld	a, c
   4150 F5            [11]   75 	push	af
   4151 33            [ 6]   76 	inc	sp
   4152 D5            [11]   77 	push	de
   4153 60            [ 4]   78 	ld	h, b
   4154 E5            [11]   79 	push	hl
   4155 CD E8 41      [17]   80 	call	_cpct_drawSprite
   4158 DD E1         [14]   81 	pop	ix
   415A C9            [10]   82 	ret
                             83 ;src/main.c:40: void main(void) 
                             84 ;	---------------------------------
                             85 ; Function main
                             86 ; ---------------------------------
   415B                      87 _main::
                             88 ;src/main.c:49: cpct_disableFirmware();
   415B CD A3 42      [17]   89 	call	_cpct_disableFirmware
                             90 ;src/main.c:51: cpct_setVideoMode(0);
   415E 2E 00         [ 7]   91 	ld	l, #0x00
   4160 CD 95 42      [17]   92 	call	_cpct_setVideoMode
                             93 ;src/main.c:52: cpct_setPalette(g_palette, 16);
   4163 21 10 00      [10]   94 	ld	hl, #0x0010
   4166 E5            [11]   95 	push	hl
   4167 21 1A 41      [10]   96 	ld	hl, #_g_palette
   416A E5            [11]   97 	push	hl
   416B CD C5 41      [17]   98 	call	_cpct_setPalette
                             99 ;src/main.c:53: cpct_setBorder(HW_BLACK);
   416E 21 10 14      [10]  100 	ld	hl, #0x1410
   4171 E5            [11]  101 	push	hl
   4172 CD DC 41      [17]  102 	call	_cpct_setPALColour
                            103 ;src/main.c:55: drawSprite(sp_player_ship, 
   4175 21 0E 00      [10]  104 	ld	hl, #0x000e
   4178 E5            [11]  105 	push	hl
   4179 2E 06         [ 7]  106 	ld	l, #0x06
   417B E5            [11]  107 	push	hl
   417C 2E BA         [ 7]  108 	ld	l, #0xba
   417E E5            [11]  109 	push	hl
   417F 2E 25         [ 7]  110 	ld	l, #0x25
   4181 E5            [11]  111 	push	hl
   4182 21 C6 40      [10]  112 	ld	hl, #_sp_player_ship
   4185 E5            [11]  113 	push	hl
   4186 CD 2A 41      [17]  114 	call	_drawSprite
   4189 21 0A 00      [10]  115 	ld	hl, #10
   418C 39            [11]  116 	add	hl, sp
   418D F9            [ 6]  117 	ld	sp, hl
                            118 ;src/main.c:61: drawSprite(sp_vshot,
   418E 21 06 00      [10]  119 	ld	hl, #0x0006
   4191 E5            [11]  120 	push	hl
   4192 2E 01         [ 7]  121 	ld	l, #0x01
   4194 E5            [11]  122 	push	hl
   4195 2E B4         [ 7]  123 	ld	l, #0xb4
   4197 E5            [11]  124 	push	hl
   4198 2E 29         [ 7]  125 	ld	l, #0x29
   419A E5            [11]  126 	push	hl
   419B 21 00 40      [10]  127 	ld	hl, #_sp_vshot
   419E E5            [11]  128 	push	hl
   419F CD 2A 41      [17]  129 	call	_drawSprite
   41A2 21 0A 00      [10]  130 	ld	hl, #10
   41A5 39            [11]  131 	add	hl, sp
   41A6 F9            [ 6]  132 	ld	sp, hl
                            133 ;src/main.c:67: drawSprite(sp_enemy_saucer,
   41A7 21 10 00      [10]  134 	ld	hl, #0x0010
   41AA E5            [11]  135 	push	hl
   41AB 2E 0C         [ 7]  136 	ld	l, #0x0c
   41AD E5            [11]  137 	push	hl
   41AE 2E 00         [ 7]  138 	ld	l, #0x00
   41B0 E5            [11]  139 	push	hl
   41B1 2E 44         [ 7]  140 	ld	l, #0x44
   41B3 E5            [11]  141 	push	hl
   41B4 21 06 40      [10]  142 	ld	hl, #_sp_enemy_saucer
   41B7 E5            [11]  143 	push	hl
   41B8 CD 2A 41      [17]  144 	call	_drawSprite
   41BB 21 0A 00      [10]  145 	ld	hl, #10
   41BE 39            [11]  146 	add	hl, sp
   41BF F9            [ 6]  147 	ld	sp, hl
                            148 ;src/main.c:84: cpct_waitVSYNC();
   41C0 CD 8D 42      [17]  149 	call	_cpct_waitVSYNC
                            150 ;src/main.c:87: while (1);
   41C3                     151 00102$:
   41C3 18 FE         [12]  152 	jr	00102$
                            153 	.area _CODE
                            154 	.area _INITIALIZER
                            155 	.area _CABS (ABS)
