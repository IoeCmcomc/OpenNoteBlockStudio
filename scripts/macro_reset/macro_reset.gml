function macro_reset() {
	// macro_reset()
	var str, total_vals, val
	str = selection_code
	if (selected = 0) return 0
	arr_data = selection_to_array(str)
	total_vals = string_count("|", str)
	val = 0
	//show_debug_message(string_count("-1", str))
	//for (var i = 0; i < total_vals; i++;) {show_debug_message(arr_data[i])}
	while (val < total_vals) {
		val += 4
		arr_data[val] = 100
		val ++
		arr_data[val] = 100
		val ++
		arr_data[val] = 0
		val ++
		while arr_data[val] != -1 {
			val += 3
			arr_data[val] = 100
			val ++
			arr_data[val] = 100
			val ++
			arr_data[val] = 0
			val ++
		}
		val ++
	}
	var new_str = array_to_selection(arr_data, total_vals)
	selection_load_ext(selection_x, selection_y, new_str)
	history_set(h_selectchange, selection_x, selection_y, try_compress_selection(selection_code), selection_x, selection_y, try_compress_selection(str))
	if(!keyboard_check(vk_alt)) selection_place(false)


}
