image_xscale = 5.0;
image_yscale = 5.0;

collision_list = ds_list_create();
var c = instance_place_list(x,y, obj_enemy, collision_list, false)

show_debug_message(c)