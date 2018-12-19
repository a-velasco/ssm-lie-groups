% 2D Synthetic Dataset: main method
% Andrea Velasco, 2016

%% Generate/Import dataset

addpath('../aux_functions');
addpath('../lie_functions');

setGlobalD('3D');

figure;
hold on; 
title('3D Dataset');
axis equal;

num_cols = 10; 
num_vert = 4;

% Type 1 Dataset: rotations about z-axis
[s, canonRec, coords,coords_plotformat] = plotDataset3D_1(num_cols, num_vert,'none');

% Type 2 Dataset: column simulation, stacked vertebrae with small rotations and
% translations in each vertebra

% [s, canonRec, coords] = plotDataset3D_2(num_cols, num_vert,'none');

%% Lie algebra Mean & Covariance Matrix

% Calculate
[mean_shape, cov_mat, k, K, data_mat] = calculateStats(s);

% Plot
plotVertebra3D(mean_shape,canonRec,'g-')

%% PCA

disp('PCA with data matrix from k vectors');
disp('-------------------------------------');
[u_k,s_k,v_k] = svd(data_mat);
% [u_k,s_k,v_k] = svd(cov_mat);
[coeff_k, latent_k, explained_k] = pca(data_mat);
% fprintf('Eigenvalues: \n'); disp(diag(s_k));
eig_k = diag(s_k);

percent_k = [];
for i=1:length(eig_k)
    percent_k = [percent_k; eig_k(i)/sum(eig_k)];
end
fprintf('Percent variability contained in each eigenvalue: \n'); disp(percent_k*100);

disp('-------------------------------------');
disp('-------------------------------------');

disp('PCA with x-y coordinates');
disp('-------------------------------------');
%[u_coords,s_coords,v_coords] = svd(coords);
[coeff_coords,~,latent_coords,~,explained_coords] = pca(coords');
mu=mean(coords');

% fprintf('Eigenvalues: \n'); disp(latent_coords);

fprintf('Percent variability contained in each eigenvalue: \n'); disp(explained_coords);
%% Coordinate Mean

v = pcaShapePlot(mu);

figure;
axis equal;
hold on;
title('PCA mean')

for i=1:4
   plotCuboid(v(i),'k',0.5);
end

hold off;

%% Lie algebra Variability

num_shapes = 3; % number of shapes to generate
modes = 3; 

% reconstruct shapes based on covariance matrix
[new_shapes] = reconstructShapes3D(mean_shape, cov_mat, num_shapes, modes);

% visualize reconstructed shapes
showMean = 1; % 0 or 1
procrustes = 0; % were shapes aligned using procrustes? 0 or 1

plotShapes3D(new_shapes, mean_shape, showMean, canonRec, procrustes);

%% Coordinate Variability

modes = 3;
for i=1:modes
   figure; hold on; axis equal;
   title(['pca: ' num2str(i) 'º mode of variation']);
   
   eigvec = coeff_coords(:,i);
   
   plotNewShapePCA(-3,mu,eigvec,latent_coords(i),'r');
   plotNewShapePCA(3,mu,eigvec,latent_coords(i),'b')
   
   plotNewShapePCA(0,mu,eigvec,latent_coords(i),'k')
 

end









