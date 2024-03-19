if instance_place(x,y,obj_enemy) {
	hp -= 20;
	image_blend = c_red
}
if hp <= 0 room_goto(Room12)