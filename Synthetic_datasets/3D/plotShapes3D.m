function plotShapes3D(new_shapes, mean_shape, showMean, canonRec, procrustes)

[modes,~] = size(new_shapes);
num_shapes = length(new_shapes{1});

colors = getColorArray(num_shapes);

for i=1:modes % for each mode
    figure;
    hold on;
    axis equal;
    title(['Lie: ' num2str(i) 'º mode of variation']);
    
    if procrustes == 1

        for n=1:num_shapes %for each shape
            plotVertebra3D_Procrustes(new_shapes{i}{n}, canonRec, colors(n),1);
        end

        if showMean == 1
            plotVertebra3D_Procrustes(mean_shape, canonRec, 'k-',0)
        end
    else
        for n=1:num_shapes %for each shape
            plotVertebra3D(new_shapes{i}{n}, canonRec, colors(n));
        end

        if showMean == 1
            plotVertebra3D(mean_shape, canonRec, 'k--')
        end
    end
    
end

hold off

end