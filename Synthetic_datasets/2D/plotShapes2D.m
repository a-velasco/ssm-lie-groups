function plotShapes2D(new_shapes, mean_shape, showMean, recA_x, recA_y)

[modes,~] = size(new_shapes);
num_shapes = length(new_shapes{1});

colors = getColorArray(num_shapes);

for i=1:modes % for each mode
    figure;
    hold on;
    axis equal;
    title([num2str(i) 'º mode of variation']);
    
    for n=1:num_shapes %for each shape
        PlotVertebra2D(new_shapes{i}{n}, recA_x, recA_y, colors(n));
    end
    
    if showMean == 1
        PlotVertebra2D(mean_shape, recA_x, recA_y, 'k--')
    end
    
end

hold off

end