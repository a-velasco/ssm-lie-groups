% 2D Synthetic Dataset: main method
% Andrea Velasco, 2016

%% Generate/Import dataset

addpath('../aux_functions');
addpath('../lie_functions');

setGlobalD('2D');

figure;
hold on;
title('2D Dataset');
axis equal;
num_cols = 7; 
num_vert = 4;

[s, recA_x, recA_y, coords] = plotDataset2D(num_cols, num_vert, 'none');

%% Mean & Covariance Matrix

% Calculate
[mean_shape, cov_mat, k, K, data_mat] = calculateStats(s);

% Plot
PlotVertebra2D( mean_shape, recA_x, recA_y, 'g');

hold off
%%
% PCA

disp('PCA with data matrix from k vectors');
disp('-------------------------------------');
[u_k,s_k,v_k] = svd(data_mat);
[coeff_k, latent_k, explained_k] = pca(data_mat);
% fprintf('Eigenvalues: \n'); disp(diag(s_k));
eig_k = diag(s_k);

percent_k = [];
for i=1:length(eig_k)
    percent_k = [percent_k; eig_k(i)/sum(eig_k)];
end
fprintf('Percent variability contained in each eigenvalue: \n'); disp(percent_k*100);

disp('PCA with x-y coordinates');
disp('-------------------------------------');
[u_coords,s_coords,v_coords] = svd(coords);
[coeff_coords,latent_coords,explained_coords] = pca(coords');
% fprintf('Eigenvalues: \n'); disp(diag(s_coords));
eig_xy = diag(s_coords);

percent_xy = [];
for i=1:length(eig_xy)
    percent_xy = [percent_xy; eig_xy(i)/sum(eig_xy)];
end
fprintf('Percent variability contained in each eigenvalue: \n'); disp(percent_xy*100);
%% Variability

num_shapes = 13; % number of shapes to generate
modes = 2; 

% reconstruct shapes based on covariance matrix
[new_shapes] = reconstructShapes2D(mean_shape, cov_mat, num_shapes, modes);

% visualize reconstructed shapes
showMean = 1; % 0 or 1
plotShapes2D(new_shapes, mean_shape, showMean, recA_x, recA_y);














