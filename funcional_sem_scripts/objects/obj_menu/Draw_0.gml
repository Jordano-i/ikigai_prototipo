var i = 0;

repeat (opcoes){


draw_set_color(c_black)

if (menu_index == i)draw_set_colour(c_blue);

draw_text(menu_x  ,menu_y + opcao_h * i ,opcao[i])

draw_set_color(c_black)

draw_text(menu_x, menu_y -30, "IKIGAI (0.01 alpha build)")

i++;
}
