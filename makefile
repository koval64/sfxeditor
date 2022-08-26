
all:
	# ../oscar64/bin/oscar64 bars.c -n
	# ../oscar64/bin/oscar64 mjoycontrol.c -n
	# ../../oscar64/bin/oscar64 keycontrol.c -n
	# ../../oscar64/bin/oscar64 keycontrol2.c -n
	../../oscar64/bin/oscar64 -n sfx_tool/sfx_tool.c
	# ../oscar64/bin/oscar64 -n -dNOFLOAT -dNOLONG -O3 bars_time.c

clean:
	# rm -rf *.asm *.int *.lbl *.map
	rm -rf sfx_tool/*.asm sfx_tool/*.int sfx_tool/*.lbl sfx_tool/*.map

