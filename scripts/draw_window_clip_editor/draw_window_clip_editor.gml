function draw_window_clip_editor() {
	// draw_window_clip_editor()
	var x1, y1; 
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	x1 = floor(rw / 2 - 220)
	y1 = floor(rh / 2 - 215)
	draw_window(x1, y1, x1 + 440, y1 + 430)
	draw_theme_font(font_main_bold)
	draw_text(x1 + 8, y1 + 8, "Secret Clipboard Editor")
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 1)
	}
	draw_theme_color()
	draw_areaheader(x1 + 22, y1 + 48, 396, 330, "Clipboard")
	draw_theme_color()
	if (windowopen = 0) text_exists[59] = 0
	selection_copied = draw_text_edit(59, selection_copied, x1 + 32, y1 + 23 * 3, 370, 300, 0, 0) 

	if (draw_button2(x1 + 320, y1 + 398, 72, "OK") && windowopen = 1) {
		windowclose = 1
	}
	window_set_cursor(curs)
	window_set_cursor(cr_default)
	if (windowopen = 0 && theme = 3) {
		if (windowalpha < 1) {
			if (refreshrate = 0) windowalpha += 1/3.75
			else if (refreshrate = 1) windowalpha += 1/7.5
			else if (refreshrate = 2) windowalpha += 1/15
			else if (refreshrate = 3) windowalpha += 1/18
			else windowalpha += 1/20
		} else {
			windowalpha = 1
			windowopen = 1
		}
	}
	if(theme = 3) {
		if (windowclose = 1) {
			if (windowalpha > 0) {
				if (refreshrate = 0) windowalpha -= 1/3.75
				else if (refreshrate = 1) windowalpha -= 1/7.5
				else if (refreshrate = 2) windowalpha -= 1/15
				else if (refreshrate = 3) windowalpha -= 1/18
				else windowalpha -= 1/20
			} else {
				windowalpha = 0
				windowclose = 0
				windowopen = 0
				window = 0
				window_set_cursor(curs)
				save_settings()
			}
		}
	} else {
		if (windowclose = 1) {
			windowclose = 0
			window = 0
		}
	}
	draw_set_alpha(1)

}
