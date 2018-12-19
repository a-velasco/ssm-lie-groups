% Lie algebra matrix to Lie group matrix

function T = AlgebraMat2GroupMat(K)

[a,b] = dimCheck();

count = 1;
T = zeros(size(K));

for i=1:length(K)/b
    T(:,count:count+a) = real(expm(K(:,count:count+a))) ;
    count = count+b;
end


end