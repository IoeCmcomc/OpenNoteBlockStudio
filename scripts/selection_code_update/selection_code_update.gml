function selection_code_update() {
	// selection_code_update()
	// Updates the selection code
	var a, b, ca, cb;
	
	if (selected = 0) {
		ds_list_clear(selected_layers)
		return 0
	}
	ca = 0
	
	var _selection_l = selection_l
	var _selection_h = selection_h
	var _selection_colfirst = selection_colfirst
	var _selection_exists = selection_exists
	var _selection_ins = selection_ins
	var _selection_key = selection_key
	var _selection_vel = selection_vel
	var _selection_pan = selection_pan
	var _selection_pit = selection_pit

	
	var str_buffer = buffer_create(16, buffer_grow, 1);
	for (a = 0; a < _selection_l; a += 1) {
	    if (_selection_colfirst[a] > -1) {
			buffer_write(str_buffer, buffer_text, string(ca))
			buffer_write(str_buffer, buffer_text, "|")
	        ca = 0
	        cb = 0
	        for (b = 0; b < _selection_h; b += 1) {
	            if (_selection_exists[a, b]) {
					buffer_write(str_buffer, buffer_text, string(cb))
					buffer_write(str_buffer, buffer_text, "|")
	                cb = 0
					buffer_write(str_buffer, buffer_text, string(ds_list_find_index(instrument_list, _selection_ins[a, b])))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(_selection_key[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(_selection_vel[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(_selection_pan[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(_selection_pit[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
	            }
	            cb += 1
	        }
			buffer_write(str_buffer, buffer_text, "-1|")
	    }
	    ca += 1
	}

	buffer_seek(str_buffer, buffer_seek_start, 0)
	selection_code = try_compress_selection(buffer_read(str_buffer, buffer_string))
	buffer_delete(str_buffer)
}
