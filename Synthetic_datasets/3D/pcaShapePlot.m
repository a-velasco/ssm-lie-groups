function v = pcaShapePlot(mu)

v1.vertices = [mu(1:3);mu(4:6);mu(7:9);mu(10:12);mu(13:15);mu(16:18);mu(19:21);mu(22:24)];
v2.vertices = [mu(25:27);mu(28:30);mu(31:33);mu(34:36);mu(37:39);mu(40:42);mu(43:45);mu(46:48)];
v3.vertices = [mu(49:51);mu(52:54);mu(55:57);mu(58:60);mu(61:63);mu(64:66);mu(67:69);mu(70:72)];
v4.vertices = [mu(73:75);mu(76:78);mu(79:81);mu(82:84);mu(85:87);mu(88:90);mu(91:93);mu(94:96)];

v = [v1,v2,v3,v4];

end