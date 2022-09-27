function load_song_combine() { // Used to combine two parts of a song together e.g. Megacollab (Only for testing use)
	// load_song(fn [, backup])
	var fn, backup, file_ext, f, str, stats, tstr, ca, cb, bstr, a, b, c, d, w, hei, byte1, byte2, song_first_custom_index, custom_index_diff, song_nbs_version, endingtick
	fn = argument[0]
	endingtick = enda + 1
	backup = false
	if (argument_count > 1) {
		backup = argument[1]
	}
	//if (confirm() < 0) return 0
	//if (!backup && fn = "") {
	    //if (!directory_exists_lib(songfolder)) songfolder = songs_directory
	    fn = string(get_open_filename_ext("Note Block Songs (*.nbs)|*.nbs", "", songfolder, condstr(language != 1, "Load song", "打开歌曲")))
	//}
	if (fn = "" || !file_exists_lib(fn)) return 0

	// When not opening from auto-recovery, delete the backup file
	//if (!backup) {
	//	backup_clear()
	//}
	//reset()
	file_ext = filename_ext(fn)
	//if (file_ext = ".mid" || file_ext = ".midi") {
	//    open_midi(fn)
	//    return 1
	//}
	//if (file_ext = ".schematic") {
	//    open_schematic(fn)
	//    return 1
	//}
	if (file_ext != ".nbs") { message(condstr(language != 1, "Error: This file cannot be opened in this program.", "警告：本软件无法打开此类型文件。"), condstr(language != 1, "Error", "错误")) return 0 }
	if (file_ext = ".nbs") {
	    buffer = buffer_import(fn)
	
		byte1 = buffer_read_byte()
		byte2 = buffer_read_byte()
	
		if (byte1 = 0 && byte2 = 0) {
			song_nbs_version = buffer_read_byte()
			if (language != 1) {if (show_oldwarning && song_nbs_version < nbs_version) message("Warning: You are opening an older NBS file. Saving this file will make it incompatible with older Note Block Studio versions.","Warning")}
			else {if (show_oldwarning && song_nbs_version < nbs_version) message("警告：你正在打开旧版的 NBS 文件。保存此文件会使其与旧版 Note Block Studio 不兼容。","警告")}
			if song_nbs_version > nbs_version {
				if (language != 1) message("Warning: You are opening an NBS file created in a later version of Note Block Studio.\nPlease save the song as a version " + string(nbs_version) + " file or lower via the Save Options menu.","Error")
				else message("警告：你正在打开在新版 Note Block Studio 里保存的文件。\n请用保存选项菜单将其保存到" + string(nbs_version) + "版本或以下。","错误")
				return -1
			}
			song_first_custom_index = buffer_read_byte()
			custom_index_diff = first_custom_index - song_first_custom_index
		
			//From nbs version 3, we save the song length again
			if(song_nbs_version >= 3) {
				buffer_read_short()
			}
		} else {
			if (language != 1) {if (show_oldwarning) message("Warning: You are opening an older NBS file. Saving this file will make it incompatible with older Note Block Studio versions.","Warning")}
			else {if (show_oldwarning) message("警告：你正在打开旧版的 NBS 文件。保存此文件会使其与旧版 Note Block Studio 不兼容。","警告")}
			song_nbs_version = 0
			custom_index_diff = 0
			song_first_custom_index = 0
		}
	
		hei = buffer_read_short()
    
	    // SONG NAME
	    buffer_read_string_int()
	    // SONG AUTHOR
	    buffer_read_string_int()
	    // SONG ORIGINAL AUTHOR
	    buffer_read_string_int()
	    // SONG DESCRIPTION
	    buffer_read_string_int()
	    // TEMPO
		buffer_read_short()
	    // AUTOSAVE (deprecated)
	    buffer_read_byte()
	    // AUTOSAVE MINUTES (deprecated)
	    buffer_read_byte()
	    // TIME SIGNATURE
	    buffer_read_byte()
	    //timesignature = median(2, a, 8)
	    // WORK
	    buffer_read_int()
	    //work_mins = max(0, a)
	    buffer_read_int()
	    //work_left = max(0, a)
	    buffer_read_int()
	    //work_right = max(0, a)
	    buffer_read_int()
	    //work_add = max(0, a)
	    buffer_read_int()
	    //work_remove = max(0, a)
	    // MIDI FILENAME
	    buffer_read_string_int()
		// LOOP
		if (song_nbs_version >= 4) {
			buffer_read_byte()
			//loop_session = loop
			if (string_count("format4beta", filename_name(fn)) = 1) {
				buffer_read_byte()
				//loopmax = 0
			} else {
				buffer_read_byte()
				buffer_read_short()
			}
		}
	    // Note blocks
	    ca = -1
	    while (1) {
	        a = buffer_read_short()
	        if (a = 0) break
	        ca += a
	        cb = -1
	        while (1) {
	            a = buffer_read_short()
	            if (a = 0) break
	            cb += a
	            var ins = buffer_read_byte();
				if(ins >= song_first_custom_index) ins += custom_index_diff //If instrument is custom, add custom_index_diff so it works when adding future instruments
	            var key = buffer_read_byte();
				if song_nbs_version>=4 {
					var vel = buffer_read_byte();
					var pan = buffer_read_byte();
					var pit = buffer_read_short();
				} else {
					vel = 100
					pan = 100
					pit = 0
				}
	            add_block(endingtick + ca, cb, ins, median(0, key, 87), vel, pan, pit, true)
	        }
	    }
		show_message("Combine complete.")
	    if (true) { // End?
	        buffer_delete(buffer)
	        //add_to_recent(fn)
	        //window = w_menu
	        //filename = fn
	        changed = 1
	        //blocks_set_instruments()
			var a, b;

			for (a = endingtick; a <= enda; a += 1) {
			    if (colamount[a] > 0) {
			        for (b = 0; b <= collast[a]; b += 1) {
			            if (song_exists[a, b]) {
			                song_ins[a, b] = instrument_list[| song_ins[a, b]]
			                //song_ins[a, b].num_blocks++
			                //if (song_ins[a, b].user) block_custom++
			            }
			        }
			    }
			}
	        return 0
	    }
	    // a = buffer_read_short()
	    // Layer names
	    for (b = 0; b < hei; b += 1) {
	        layername[b] = buffer_read_string_int()
			if song_nbs_version >= 4 && string_count("format4beta", filename_name(fn)) != 1 {
				layerlock[b] = buffer_read_byte()
			}
	        else layerlock[b] = 0
	        layervol[b] = buffer_read_byte()
	        if (layervol[b] = -1) layervol[b] = 100
	        layervol[b] = median(0, layervol[b], 100)
	        if (layervol[b] < 100) realvolume = 1
			if song_nbs_version >= 2 {
				layerstereo[b] = buffer_read_byte()
			}
			else {
				layerstereo[b] = 100
			}
	        endb2 += 1
	    }
	    if (buffer_is_eof()) { // End?
	        buffer_delete(buffer)
	        add_to_recent(fn)
	        window = w_menu
	        filename = fn
	        changed = 0
	        blocks_set_instruments()
	        return 0
	    }
	
		// Custom instruments
	    a = buffer_read_byte()
	    str = ""
	    for (b = 0; b < a; b++) {
	        var name = buffer_read_string_int();
	        var insfn = buffer_read_string_int();
	        var key = buffer_read_byte();
	        var press = buffer_read_byte();
	        var ins = new_instrument(name, insfn, true, press, key);
	        with (ins)
	            if (!instrument_load() && insfn != "")
	                str += insfn + "\n"
	        ds_list_add(instrument_list, ins)
	    }

	    if (str != "")
	        if (language != 1) {if (question("This song uses custom instruments. However, some sounds could not be loaded:\n\n" + str+"\nMake sure that you have put the sounds in the \"Sounds\" folder. Open Instrument settings?", "Error")) window = w_instruments}
	        else {if (question("此歌曲使用自定义音色。但是一些音色未能被加载：\n\n" + str+"\n确保您已将声音文件放到“Sounds”文件夹。打开音色设置吗？", "错误")) window = w_instruments}
	    buffer_delete(buffer)
	}
	if (!backup) {
		add_to_recent(fn)
		if (window != w_instruments && song_name != "") window = w_songinfo
		filename = fn
		changed = 0
	}
	else {
		changed = 1
	}
	backup_clear()
	blocks_set_instruments()
	io_clear()



}
