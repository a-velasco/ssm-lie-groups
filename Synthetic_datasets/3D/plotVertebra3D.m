function plotVertebra3D(shape,canonRec,color)

[~,col] = size(shape);
[a,b] = dimCheck();

vert = canonRec.vertices;
vert(:,end+1) = 1;

count = 1;
for j=1:col/b %for each vertebra (each rectangle)
 
    H = shape(:,count:count+a);
    vert_t = [];
    for n=1:8
           new_point = H*vert(n,:)';
           vert_t = [vert_t; new_point'];
     end

    newRec.vertices = vert_t;
    plotCuboid(newRec,color,1);
    
    count = count+b;
end


end

