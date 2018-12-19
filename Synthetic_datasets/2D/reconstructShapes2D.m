function [new_shapes] = reconstructShapes(mean_shape, cov_mat, num_shapes, modes)

[~,cols] = size(mean_shape);
[a,b] = dimCheck();

mean_algebra_mat = zeros(size(mean_shape));

% mean shape: group matrix -> algebra matrix
count = 1;
for n=1:cols/b
    mean_algebra_mat(:,count:count+a) = logm(mean_shape(:,count:count+a));
    count = count+b;
end

% mean shape: algebra matrix -> algebra vector
mean_alg_vec = AlgebraMat2AlgebraVec(mean_algebra_mat);

% evenly sample coefficients
coeffs = linspace(-1.5,1.5,num_shapes); 

% get eigenvalues and eigenvectors
[~,S,V] = svd(cov_mat);
e = diag(S); % eigenvalues

for i=1:modes
    for j=1:num_shapes
        new_shape = coeffs(j)*sqrt(e(i))*V(:,i)'; % algebra vec
        new_shape = AlgebraVec2GroupMat(new_shape); % group mat
        
        count = 1;
        temp = zeros(size(mean_shape));
        for n=1:cols/b
            temp(:,count:count+a) = new_shape(:,count:count+a)*mean_shape(:,count:count+a);
            count = count+b;
        end
        
        new_shapes_temp{j} = temp;    
    end
    new_shapes{i,:} = new_shapes_temp;
end

end