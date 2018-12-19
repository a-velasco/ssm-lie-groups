function plotCuboid(myRec,color,thickness)

x = myRec.vertices(:,1);
y = myRec.vertices(:,2);
z = myRec.vertices(:,3);

plot3(x, y, z, '.');

plot3([x(1),x(2)],[y(1),y(2)],[z(1),z(2)],color,'LineWidth',thickness);
plot3([x(2),x(3)],[y(2),y(3)],[z(2),z(3)],color,'LineWidth',thickness);
plot3([x(3),x(4)],[y(3),y(4)],[z(3),z(4)],color,'LineWidth',thickness);
plot3([x(1),x(4)],[y(1),y(4)],[z(1),z(4)],color,'LineWidth',thickness);

plot3([x(1),x(8)],[y(1),y(8)],[z(1),z(8)],color,'LineWidth',thickness);
plot3([x(8),x(5)],[y(8),y(5)],[z(8),z(5)],color,'LineWidth',thickness);
plot3([x(5),x(4)],[y(5),y(4)],[z(5),z(4)],color,'LineWidth',thickness);

plot3([x(5),x(6)],[y(5),y(6)],[z(5),z(6)],color,'LineWidth',thickness);
plot3([x(6),x(3)],[y(6),y(3)],[z(6),z(3)],color,'LineWidth',thickness);

plot3([x(6),x(7)],[y(6),y(7)],[z(6),z(7)],color,'LineWidth',thickness);
plot3([x(7),x(8)],[y(7),y(8)],[z(7),z(8)],color,'LineWidth',thickness);
plot3([x(2),x(7)],[y(2),y(7)],[z(2),z(7)],color,'LineWidth',thickness);

end