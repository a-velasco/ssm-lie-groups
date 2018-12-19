function colors = getColorArray(num_shapes)

colors = ['r','g','b','y','m','c'];

if length(colors) < num_shapes
    for i=1:(num_shapes - length(colors))
        colors =  [colors colors(i)];
    end
elseif length(colors) > num_shapes
    colors = colors(1:num_shapes);
end

end