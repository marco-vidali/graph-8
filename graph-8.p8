pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- core

function _init()
	cls()
	grf_init()
end

function _update()
	grf_update()
end

function _draw()
	grf_draw()
end
-->8
-- graph

crd_max = 3
x = -crd_max

grf_col = 7
pts_col = 12

scr_size = 128
scr_ctr = scr_size / 2 - 1

function grf_init()
	-- origin
	print(0, scr_ctr - 4, scr_ctr + 2, grf_col)
	
	-- x ticks
	for i = -crd_max, crd_max - 1 do
		i_x = i / (crd_max / (scr_size / 2)) + scr_ctr
		i_y = scr_ctr + 1
		
		for j = 0, 3 do
			pset(i_x, i_y + j, grf_col)
		end
	end
	
	-- y ticks
	for i = -crd_max, crd_max - 1 do
		i_x = scr_ctr - 1
		i_y = i / (crd_max / (scr_size / 2)) + scr_ctr
		
		for j = 0, 3 do
			pset(i_x - j, i_y, grf_col)
		end
	end
	
	-- x axis
	line(0, scr_ctr, scr_size - 1, scr_ctr, grf_col)
	print("x", scr_size - 3, scr_ctr + 2)
	
	-- y axis
	line (scr_ctr, 0, scr_ctr, scr_size, grf_col)
	print("y", scr_ctr - 4, 0)
end

function grf_update()
	-- increment x
	x += crd_max / (scr_size / 2)
	
	-- stop
	if (x > crd_max) stop()
end

function grf_draw()
	-- scale coordinates
	x_sc = x / (crd_max / (scr_size / 2))
	y_sc = f(x) / (crd_max / (scr_size / 2))
	
	-- translate coordinates
	x_tr = x_sc + scr_ctr
	y_tr = -y_sc + scr_ctr
	
	-- draw point
	pset(x_tr, y_tr, pts_col)
end
-->8
-- function

function f(x)
	return x ^ 3
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
