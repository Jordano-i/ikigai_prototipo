// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#region CONTROLES
key_right = keyboard_check(vk_right)
key_left = keyboard_check(vk_left)
key_attack = keyboard_check(ord("Z"))
#endregion

function scr_personagem_idle(){
	sprite_index = spr_playerIdle
	    if (keyboard_check_pressed(vk_space)) {
            estado(src_personagem_pulando)
        }
}

function scr_personagem_andando(){
	sprite_index = spr_playerRun

	move = -keyboard_check(key_left) + keyboard_check(key_right);
	hsp = move * spd;
	
	if place_meeting(x + hsp, y, obj_ground){
		while !place_meeting(x + sign(hsp), y, obj_ground){
			x += sign(hsp);
		}
	
		hsp = 0;
	}

	x += hsp;
	y += vsp;

	if !place_meeting(x, y + vsp, obj_ground) {
		        y += vsp;
		    } else {
		        while !place_meeting(x, y + sign(vsp), obj_ground) {
		            y += sign(vsp);
		        }
		        vsp = 0;
		    }

		    if keyboard_check_pressed(vk_space){    
		        vsp = jspd;
		    }
}

function src_personagem_caindo(){
	sprite_index = spr_playerFall()
	
		if place_meeting(x,y+vsp,obj_ground)
		{
			while !place_meeting(x,y+sign(vsp),obj_ground)
			{
				y+=sign(vsp)	
			}
	
			vsp=0
		}
		

		if (vsp == 0) estado(scr_personagem_idle);	
}

function src_personagem_pulando(){
	sprite_index = spr_playerJump
	vsp = jspd;
	if place_meeting(x,y+vsp,obj_ground)
			{
				while !place_meeting(x,y+sign(vsp),obj_ground)
				{
					y+=sign(vsp)	
				}
	
				vsp=0
			}	
}

function src_personagem_atacando(){
	sprite_index = spr_playerAttack1;
	mask_index = spr_playerAttack1hb;
	var inimigos_na_hitbox = ds_list_create();
		
	var inimigos = instance_place_list(x, y, par_enemies, enemy_in_hitbox, false);
		
		if (inimigos) > 0{
			for (var i = 0; i < inimigos; i++){
				var inimigoID = inimigos_na_hitbox[| i];
				
				if (ds_list_find_index(inimigos_atingidos, inimigoID)) == -1 {
					ds_list_add(inimigos_atingidos, inimigoID);
					
					with(inimigoID){
						
					}
				}
			}
		}	
}