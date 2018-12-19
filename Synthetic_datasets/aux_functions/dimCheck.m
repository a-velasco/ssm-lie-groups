function [a,b] = dimCheck()

global D

D = getGlobalD;

if strcmp(D,'2D')
    a = 2;
    b = 3;
elseif strcmp(D,'3D')
    a = 3;
    b = 4;
else
    fprintf([num2str(D) ' is an invalid dimension\n']);
    return
end

end