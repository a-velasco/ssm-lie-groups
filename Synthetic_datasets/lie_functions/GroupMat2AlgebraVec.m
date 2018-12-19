% Lie group matrix to Lie algebra vector

function k = GroupMat2AlgebraVec(T)

K = GroupMat2AlgebraMat(T);

k = AlgebraMat2AlgebraVec;