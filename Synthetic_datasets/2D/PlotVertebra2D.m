function PlotVertebra2D(shape, recA_x, recA_y,color)

[~,col] = size(shape);
[a,b] = dimCheck();

count = 1;
for j=1:col/b %for each vertebra (each rectangle)
 
    H = shape(:,count:count+a);
    recB = H* [recA_x; recA_y; 1 1 1 1];

    plotQuadrilaterals(recB(1,:),recB(2,:),color,1);
    
    count = count+b;
end


end

