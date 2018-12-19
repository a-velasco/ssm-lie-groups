function plotQuadrilaterals(x,y,color,thickness)

plot(x, y, '.');
plot(x(1:2),y(1:2),color,'LineWidth', thickness);
plot(x(2:3),y(2:3),color,'LineWidth', thickness);
plot(x(3:4),y(3:4),color,'LineWidth', thickness);
plot([x(4),x(1)],[y(4),y(1)], color,'LineWidth', thickness);

end