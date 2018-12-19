function [myRec, centroid] = getRecCoords3D(x,y,z)

centroid = [x,y,z];

rec_x = [x-1,x-1,x+1,x+1,x+1,x+1,x-1,x-1];
rec_y = [y-0.5,y-0.5,y-0.5,y-0.5,y+0.5,y+0.5,y+0.5,y+0.5];
rec_z = [z+0.5,z-0.5,z-0.5,z+0.5,z+0.5,z-0.5,z-0.5,z+0.5];

myRec.vertices = [rec_x',rec_y',rec_z'];

end