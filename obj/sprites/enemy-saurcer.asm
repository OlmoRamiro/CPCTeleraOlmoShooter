;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module enemy_saurcer
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sp_enemy_saucer
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
	.area _CODE
_sp_enemy_saucer:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xd0	; 208
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xd0	; 208
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xf4	; 244
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x94	; 148
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x68	; 104	'h'
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xd0	; 208
	.db #0xfc	; 252
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x94	; 148
	.db #0x33	; 51	'3'
	.db #0x3c	; 60
	.db #0x68	; 104	'h'
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xd4	; 212
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xe0	; 224
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xd0	; 208
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xe8	; 232
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xf4	; 244
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xd4	; 212
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xd0	; 208
	.db #0xe8	; 232
	.db #0xd0	; 208
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xd0	; 208
	.db #0xf4	; 244
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0xf4	; 244
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
