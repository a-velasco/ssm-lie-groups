function [mean_shape, cov_mat, k, K, data_mat,det_init] = calculateStats(s)
  
mean_shape = s{2}; % random initialization 

[a,b] = dimCheck();
[~,cols] = size(mean_shape);

count = 1;
for n=1:cols/b
K_avg(:,count:count+a)=real(logm(mean_shape(:,count:count+a)));
count = count+b;
end
k_avg = AlgebraMat2AlgebraVec(K_avg);

diffK_avgMx=[];
diffK_avgMean=[];

Ns=length(s);
  
for j=1:6 % num iterations until convergence
    k_sum = 0;
    var_sum = 0;
    for i=1:length(s)  % for each shape
%         disp(['shape ', num2str(i)]);
        count = 1;
        for n=1:cols/b  %for each polygon in a shape

            inv_mean= inv(mean_shape(:,count:count+a));

            temp=s{i}(:,count:count+a)*inv_mean;
            K{i}(:,count:count+a) = real(logm(temp));   
            count = count+b;         
        end
                 
        k{i} = AlgebraMat2AlgebraVec(K{i});
        k_sum = real(k_sum + k{i});
  
        % Build covariance matrix
        var_sum = var_sum + (k{i}'*k{i});  %eq (2)      
    end
  
    cov_mat = var_sum/Ns; 
    k_avg_0=k_avg;
    k_avg = k_sum/Ns;
   
    K_avg = AlgebraVec2AlgebraMat(k_avg);
   
    diffK_avgMx=[diffK_avgMx max(abs(k_avg(:)-k_avg_0(:)))];
    diffK_avgMean=[diffK_avgMean mean(abs(k_avg(:)-k_avg_0(:)))];
    
    newmean = zeros(size(mean_shape));
    count = 1;
    det_init = [];
    for n=1:cols/b
        newmean(:,count:count+a) = real(expm(K_avg(:,count:count+a))*mean_shape(:,count:count+a));
        det_init = [det_init, det(newmean(:,count:count+a))];
        count = count+b;
    end
  
    mean_shape = real(newmean);
end
  
clear data_mat;
for i=1:length(k)
    data_mat(:,i)=k{i};
end
data_mat = data_mat';
  
end