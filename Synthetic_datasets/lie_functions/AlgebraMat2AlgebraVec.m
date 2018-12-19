% Lie algebra matrix to Lie algebra vector

function k = AlgebraMat2AlgebraVec(K)

[a,b] = dimCheck();

count = 0;
k = [];

if strcmp(getGlobalD,'2D')
    for i=1:length(K)/b
        k = [k K(1,3+count),K(2,3+count),K(1,2+count)];
        count = count+b;
    end
else
    for i=1:length(K)/b
        k = [k K(1,4+count),K(2,4+count),K(3,4+count),K(3,2+count),K(1,3+count),K(2,1+count)];
        count = count+b;
    end
end
end