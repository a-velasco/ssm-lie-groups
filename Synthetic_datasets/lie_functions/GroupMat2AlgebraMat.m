% Lie group matrix to Lie algebra matrix

function K = AlgebraMat2GroupMat(T)

[a,b] = dimCheck();

count = 1;
K = zeros(size(T));

for i=1:length(T)/b
    K(:,count:count+a) = real(logm(T(:,count:count+a))) ;
    count = count+b;
end


end