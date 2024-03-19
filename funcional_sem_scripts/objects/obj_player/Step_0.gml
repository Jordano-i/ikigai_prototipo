#region CONTROLES
key_right = keyboard_check(vk_right)
key_left = keyboard_check(vk_left)
key_attack = keyboard_check(vk_down)
#endregion
#region movimentacao

attacking = keyboard_check(vk_down)
move = -keyboard_check(key_left) + keyboard_check(key_right);
hsp = move * spd;
moveDir = point_direction(0, 0, vsp, hsp) div 90;

if(moveDir = 3) {
	image_xscale = 5.0;
}
if(moveDir = 1) {
	image_xscale = sign(hsp)*5.0;
}
x += hsp;
y += vsp


if place_meeting(x,y+1,obj_ground) {
			jumps=2
} else {
			vsp+=grav
}


if (hsp = 0 && vsp == 0 && place_meeting(x,y+1,obj_ground) && state != st.attack){
	state = st.idle;
}else if (hsp != 0 && vsp == 0 && place_meeting(x,y+1,obj_ground)){
	state = st.move;
} else if (vsp > 0 && !place_meeting(x,y+1,obj_ground)){
	state = st.fall;
} else if (vsp <= 0 && !place_meeting(x,y+1,obj_ground)){
	state = st.jump;
}

switch(state) {
	case st.idle:	
		
		if (place_meeting(x, y + 1, obj_ground)) {
            jumps = 1; // Reinicie os pulos quando estiver no chão
        }

        if (keyboard_check_pressed(vk_space) && jumps > 0) {
            vsp = jspd;
            jumps -= 1;
        }
		
		if (attacking == true) {
		state = st.attack	
		}

    break;
		
	case st.move:     
		if place_meeting(x + hsp, y, obj_ground) {

		        while !place_meeting(x + sign(hsp), y, obj_ground) {
		            x += sign(hsp);
		        }
		        hsp = 0;
		    }

		    if !place_meeting(x, y + vsp, obj_ground) {
		        y += vsp;
		    } else {
		        while !place_meeting(x, y + sign(vsp), obj_ground) {
		            y += sign(vsp);
		        }
		        vsp = 0;
		    }

		    if keyboard_check_pressed(vk_space) && jumps >= 0 {    
		        vsp = jspd;
		        jumps -= 1;
		    }
		
			
	break;
	case st.jump:
			if place_meeting(x,y+vsp,obj_ground)
		{
			while !place_meeting(x,y+sign(vsp),obj_ground)
			{
				y+=sign(vsp)	
			}
	
			vsp=0
		}
		
		if keyboard_check_pressed(vk_space) && jumps>0
		{	
			vsp=jspd
			jumps-=1
		}
		

	break;
	case st.fall:
			if place_meeting(x,y+vsp,obj_ground)
		{
			while !place_meeting(x,y+sign(vsp),obj_ground)
			{
				y+=sign(vsp)	
			}
	
			vsp=0
		}

		
		
		if keyboard_check_pressed(vk_space) && jumps>0
		{	
			vsp=jspd
			jumps-=1
			if (vsp > 0) state = st.jump;
		}
		

		if (vsp = 0) state = st.idle;
	break;
	case st.attack:
	
	if(image_index > 0){
		if(!instance_exists(obj_hitbox)){
			instance_create_layer(x + (1 * image_xscale), y, layer, obj_hitbox);
		}
	}
	
	if(image_index >= image_number - 1){
		if(instance_exists(obj_hitbox)) instance_destroy(obj_hitbox)
		attacking = false
		state = st.idle
	}
    break;
	case st.damage:
	
	break;
}


sprite_index = sprites[state];
#endregion