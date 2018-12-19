function [rec_x, rec_y] = getRecCoords(x,y)

rec_y = [x-0.5, x-0.5, x+0.5, x+0.5];
rec_x = [y-0.3, y+0.3, y+0.3, y-0.3];

end