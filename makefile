
all:
	../../oscar64/bin/oscar64 -n sfx_tool/sfx_tool.c

clean:
	rm -rf sfx_tool/*.asm sfx_tool/*.int sfx_tool/*.lbl sfx_tool/*.map

