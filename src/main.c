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
#include <stdio.h>


enum { 
   SCREEN_TOP = 0,
   SCREEN_BOTTOM = 200,
   SCREEN_RIGHT = 80,
   SCREEN_LEFT = 0,
   SCREEN_FRAME = 1,
   TRUE = 1,
   FALSE = 0
};

u8 sp_player_ship_x;
u8 sp_player_ship_y;
u8 sp_player_ship_speed;

u8 sp_vshot_x;
u8 sp_vshot_y;
u8 sp_vshot_y_speed;

u8 sp_enemy_saucer_x;
u8 sp_enemy_saucer_y;
u8 sp_enemy_saucer_speed;


void drawSprite(u8 *sprite,int x,int y,int sprite_width,int sprite_height)
{
   u8 *pvmem;
   pvmem = cpct_getScreenPtr(CPCT_VMEM_START,x,y);
   cpct_drawSprite(sprite,pvmem,sprite_width,sprite_height);

}

void draw_sp_player(u8 x,u8 y)
{
   drawSprite (sp_player_ship,x,y,SP_PLAYER_SHIP_W,SP_PLAYER_SHIP_H);
}

void draw_sp_enemy_saucer(u8 x,u8 y)
{
   drawSprite (sp_enemy_saucer,x,y,SP_ENEMY_SAUCER_W,SP_ENEMY_SAUCER_H);
}
void draw_sp_vshot(u8 x,u8 y)
{
   drawSprite (sp_vshot,x,y,SP_VSHOT_W,SP_VSHOT_H);
}

void initSprites()
{
   sp_player_ship_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W);
   sp_player_ship_y = SCREEN_BOTTOM-SP_PLAYER_SHIP_H;
   draw_sp_player(sp_player_ship_x,sp_player_ship_y);

   sp_vshot_x = (SCREEN_RIGHT/2) - (SP_PLAYER_SHIP_W/2);
   sp_vshot_y = SCREEN_BOTTOM - SP_PLAYER_SHIP_H - SP_VSHOT_H;
   draw_sp_vshot(sp_vshot_x,sp_vshot_y);
 
   sp_enemy_saucer_x = SCREEN_RIGHT - SP_ENEMY_SAUCER_W;
   sp_enemy_saucer_y = SCREEN_TOP + SCREEN_FRAME;
   sp_enemy_saucer_speed = 1;
   draw_sp_enemy_saucer(sp_enemy_saucer_x,sp_enemy_saucer_y);

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
   
   initSprites();
   


   // Loop forever
   while (TRUE)
   {
      cpct_scanKeyboard();

      if (cpct_isKeyPressed (Key_P))
      {
         if (sp_player_ship_x + SP_PLAYER_SHIP_W < SCREEN_RIGHT)
         {
            ++sp_player_ship_x;
            draw_sp_player(sp_player_ship_x,sp_player_ship_y);
         }
         
      }

      if (cpct_isKeyPressed (Key_O))
      {
         if (sp_player_ship_x > SCREEN_LEFT)
         {
            --sp_player_ship_x;
            draw_sp_player(sp_player_ship_x,sp_player_ship_y);
         }
         
      }
      cpct_waitVSYNC();

   }
}
