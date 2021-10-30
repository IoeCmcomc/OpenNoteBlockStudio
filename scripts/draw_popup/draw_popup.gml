function draw_popup(x, y, str, singleline) {
	var theme = obj_controller.theme
	var alpha = 1;
	var maxw = string_width_dynamic(str);

	if (alpha < 1) alpha += 0.25 * (30 / (room_speed * obj_controller.currspeed)) * (1 + (theme != 3))
	if (theme = 3 && obj_controller.acrylic) draw_surface_blur_alt(application_surface, x, y, maxw + 16, 20 + 18 * (!singleline), 0.5)
	if (theme != 3) {
	if (singleline) {
	    draw_sprite_ext(spr_tooltip_sl_left, theme, x, y, 1, 1, 0, -1, alpha)
	    draw_sprite_ext(spr_tooltip_sl_middle, theme, x + 4 - 2 * theme, y, (maxw + 8 - 4 * theme), 1, 0, -1, alpha)
	    draw_sprite_ext(spr_tooltip_sl_right, theme, x + 4 - 2 * theme + (maxw + 8 - 4 * theme), y, 1, 1, 0, -1, alpha)
	} else {
	    draw_sprite_ext(spr_tooltip_ml_left, theme, x, y, 1, 1, 0, -1, alpha)
	    draw_sprite_ext(spr_tooltip_ml_middle, theme, x + 4 - 2 * theme, y, (maxw + 8 - 4 * theme), 1, 0, -1, alpha)
	    draw_sprite_ext(spr_tooltip_ml_right, theme, x + 4 - 2 * theme + (maxw + 8 - 4 * theme), y, 1, 1, 0, -1, alpha)
	}
	} else {
	if (singleline) {
	    draw_sprite_ext(spr_tooltip_sl_left, theme + obj_controller.fdark, x, y, 1, 1, 0, -1, alpha * 0.6)
	    draw_sprite_ext(spr_tooltip_sl_middle, theme + obj_controller.fdark, x + 4, y, (maxw + 8), 1, 0, -1, alpha * (0.6 + 0.4 * !obj_controller.acrylic))
	    draw_sprite_ext(spr_tooltip_sl_right, theme + obj_controller.fdark, x + 4 + (maxw + 8), y, 1, 1, 0, -1, alpha * (0.6 + 0.4 * !obj_controller.acrylic))
	} else {
	    draw_sprite_ext(spr_tooltip_ml_left, theme + obj_controller.fdark, x, y, 1, 1, 0, -1, alpha * 0.6)
	    draw_sprite_ext(spr_tooltip_ml_middle, theme + obj_controller.fdark, x + 4, y, (maxw + 8), 1, 0, -1, alpha * (0.6 + 0.4 * !obj_controller.acrylic))
	    draw_sprite_ext(spr_tooltip_ml_right, theme + obj_controller.fdark, x + 4 + (maxw + 8), y, 1, 1, 0, -1, alpha * (0.6 + 0.4 * !obj_controller.acrylic))
	}
	}
	draw_set_alpha(alpha)
	if (theme = 3 && obj_controller.acrylic) draw_acrylic_texture(x, y, maxw + 16, 20 + 18 * (!singleline))
	if (obj_controller.fdark && theme = 3) draw_set_color(c_white)
	else draw_set_color(make_color_rgb(75, 75, 75)*!obj_controller.theme)
	if(theme != 3) {
	draw_text_dynamic(x + 7 - 2 * theme, y + 3, str)
	} else {
	draw_text_dynamic(x + 7, y + 3, str)
	}
	draw_set_alpha(1)
	draw_set_color(c_black)
}