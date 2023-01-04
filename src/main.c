//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include <sprites/g_palette.h>
#include <sprites/enemy-saurcer.h>
#include <sprites/vshot.h>
#include <sprites/player-ship.h>

enum { 
   SCREEN_TOP = 0,
   SCREEN_BOTTOM = 200,
   SCREEN_RIGHT = 80,
   SCREEN_LEFT = 0
};

void drawSprite(u8 *sprite,int sprite_vertical_pos,int sprite_horizontal_pos,int sprite_width,int sprite_height)
{
   u8 *pvmem;
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START,sprite_vertical_pos,sprite_horizontal_pos);
   cpct_drawSprite(sprite,pvmem,sprite_width,sprite_height);

}

void main(void) 
{

   // Make pvmem point to the byte in video memory where we want
   // to print our sprite (coordinates (40, 96) in bytes, (80, 96) in pixels,
   // as each byte is 2 pixels wide in mode 0)
   

   //para pedirle a amstrad que lo unico que se ejecute sea mi codigo
   cpct_disableFirmware();
   
   cpct_setVideoMode(0);
   cpct_setPalette(g_palette, 16);
   cpct_setBorder(HW_BLACK);

   drawSprite(sp_player_ship, 
      (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W/2),
      SCREEN_BOTTOM-SP_PLAYER_SHIP_H,
      SP_PLAYER_SHIP_W,
      SP_PLAYER_SHIP_H);

   drawSprite(sp_vshot,
      (SCREEN_RIGHT/2) + SP_VSHOT_W,
      SCREEN_BOTTOM-SP_PLAYER_SHIP_H - SP_VSHOT_H,
      SP_VSHOT_W,
      SP_VSHOT_H);

   drawSprite(sp_enemy_saucer,
      SCREEN_RIGHT-SP_ENEMY_SAUCER_W, 
      SCREEN_TOP,
      SP_ENEMY_SAUCER_W,
      SP_ENEMY_SAUCER_H);
   

   /*
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 40, 200-SP_PLAYER_SHIP_H);
   cpct_drawSprite(sp_player_ship,pvmem,SP_PLAYER_SHIP_W,SP_PLAYER_SHIP_H);

   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 40, 200 - SP_PLAYER_SHIP_H - SP_VSHOT_H);
   cpct_drawSprite(sp_vshot,pvmem,SP_VSHOT_W,SP_VSHOT_H);

   pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 40, 0+SP_ENEMY_SAUCER_H);
   cpct_drawSprite(sp_enemy_saucer,pvmem,SP_ENEMY_SAUCER_W,SP_ENEMY_SAUCER_H);
   */
   cpct_waitVSYNC();

   // Loop forever
   while (1);
}
