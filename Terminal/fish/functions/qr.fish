function qr
	qrencode -s 7 (fish_clipboard_paste) -o - | display
end
