function draw_window_macro_stereo() {
	// draw_window_stereo_macro()
	var x1, y1, a, b, str, total_vals, val;
	if (selected == 0) {
		window = 0
		return 0
	}
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	text_exists[0] = 0
	x1 = floor(rw / 2 - 80)
	y1 = floor(rh / 2 - 80) + windowoffset
	draw_window(x1, y1, x1 + 140, y1 + 130)
	draw_theme_font(font_main_bold)
	draw_text_dynamic(x1 + 8, y1 + 8, "Stereo")
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
	}
	if (language != 1) {
	if (draw_checkbox(x1 + 10, y1 + 30, stereo_reverse, "Reversed", "Stereo is done in the inverse direction.")) stereo_reverse=!stereo_reverse
	draw_areaheader(x1 + 10, y1 + 53, 120, 35, "Stereo width")
	} else {
	if (draw_checkbox(x1 + 10, y1 + 30, stereo_reverse, "反转", "反方向应用立体效果。")) stereo_reverse=!stereo_reverse
	draw_areaheader(x1 + 10, y1 + 53, 120, 35, "立体程度")
	}
	stereo_width = median(0, draw_dragvalue(11, x1 + 55, y1 + 65, stereo_width, 0.5), 100)

	draw_theme_color()
	if (draw_button2(x1 + 10, y1 + 98, 60, condstr(language != 1, "OK", "确定"))) {
		windowalpha = 0
		windowclose = 0
		windowopen = 0
		str = selection_code
		var arr_data = selection_to_array_ext()
		window = 0
		total_vals = array_length(arr_data)
		val = 0
		while (val < total_vals) {
			// First column panned left
			val += 5
			if stereo_reverse = 1 {
				arr_data[val] = 0 - (stereo_width-100)
			} else arr_data[val] = 200 + (stereo_width-100)
			val += 2
			while arr_data[val] != -1 {
				val += 4
				if stereo_reverse = 1 {
					arr_data[val] = 0 - (stereo_width-100)
				} else arr_data[val] = 200 + (stereo_width-100)
				val += 2
			}
			// Second column panned right
			val += 6
			if val >= total_vals break
			if stereo_reverse = 1 {
			arr_data[val] = 200 + (stereo_width-100)
			} else arr_data[val] = 0 - (stereo_width-100)
			val += 2
			while arr_data[val] != -1 {
				val += 4
				if stereo_reverse = 1 {
					arr_data[val] = 200 + (stereo_width-100)
				} else arr_data[val] = 0 - (stereo_width-100)
				val += 2
			}
			val ++
		}
		selection_load_from_array(selection_x, selection_y, arr_data)
		history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
		if(!keyboard_check(vk_alt)) selection_place(false)
	}
	if (draw_button2(x1 + 70, y1 + 98, 60, condstr(language != 1, "Cancel", "取消")) && (windowopen = 1 || theme != 3)) {windowclose = 1}
	if (display_mouse_get_x() - window_get_x() >= 0 && display_mouse_get_y() - window_get_y() >= 0 && display_mouse_get_x() - window_get_x() < 0 + window_width && display_mouse_get_y() - window_get_y() < 0 + window_height) {
		window_set_cursor(curs)
		if (array_length(text_mouseover) = 0) window_set_cursor(cr_default)
	}
}
