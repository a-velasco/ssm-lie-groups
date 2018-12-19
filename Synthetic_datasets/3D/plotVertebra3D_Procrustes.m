function plotVertebra3D_Procrustes(shape,canonRec,color,thickPlot)

[~,col] = size(shape);
[a,b] = dimCheck();

vert = canonRec.vertices;
%vert(:,end+1) = 1;

count = 1;
for j=1:col/b %for each vertebra (each rectangle)
 
    H = shape(:,count:count+a);
    vert_t = [];
    for n=1:8
           new_point = vert(n,:) * H(1:3,1:3)+H(1:3,4)';
           vert_t = [vert_t; new_point];
     end

    newRec.vertices = vert_t;
    if thickPlot
        plotCuboid(newRec,color,1);
    else
        plotCuboid(newRec,color,0.5);
    end
    count = count+b;
end


end