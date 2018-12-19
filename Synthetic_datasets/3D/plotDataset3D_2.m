function [s, canonRec, coords] = plotDataset3D_2(num_cols, num_vert,noise)
 
% close all; clear all
% 
% figure;
% hold on;
% axis equal;
% grid on;
% axis on;
xlabel('x'); ylabel('y'); zlabel('z');
plot3(0,0,0,'ko'); % origin
 
 
s = cell([1 num_cols]);
 
%create circle
r = 4;
x = 0; y = 0;
theta=0:0.01:pi; 
 
xp=r*cos(theta); 
yp=r*sin(theta);
z = zeros(1,length(x+xp));
 
% plot3(x+xp,y+yp,z);
 
% plot lines to radius at theta intervals
t = linspace(1, length(theta), num_cols); % sample equally spaced lines
t = ceil(t);
 
% line from origin to r
Ax = [0,0]; Ay = [0,r]; Az=[0,0];
plot3(Ax,Ay,Az,'r');
 
% create canonical rectangle at origin
[canonRec, centroid] = get3DRecCoords(0,0,0);
plotCuboid(canonRec,'r--',0.5);
% coord sys at centroid
plot3([centroid(1), centroid(1)+1], [centroid(2),0], [centroid(3),0],'r');
plot3([centroid(1), 0], [centroid(2),centroid(2)+1], [centroid(3),0],'g');
plot3([centroid(1), 0], [centroid(2),0], [centroid(3),centroid(3)+1],'b');
 
vert = canonRec.vertices;
vert(:,end+1) = 1;
 
coords = [];
 
% noise
gaussian = normrnd(0.1:1,1./(1:3)); %gaussian
 
%%
for i=1:num_cols
    % plot line at ith theta 
%     Bx = [0,xp(t(i))];
%     By = [0,yp(t(i))];
    Bx = [0,0];
    By = [0,r];
    Bz = [0,0];
    plot3(Bx,By,Bz);
         
    % sample vertebrae along each line
    [b_x, b_y, b_z] = plotSampledPoints(Bx,By,num_vert);
     
     
    if strcmp(noise,'gaussian')
         
 
        for j=1:num_vert
            R = [cos(gaussian(1)),  -sin(gaussian(1)) , 0, 0; 
             sin(gaussian(1)),  cos(gaussian(1))  , 0, 0; 
             0               ,   0                , 1, 0;
             0               ,   0                , 0, 1 ];
          
            tx = b_x(j)+gaussian(2);
            ty = b_y(j)+gaussian(3);
            tz = 0;
 
            R(1,4) = tx;
            R(2,4) = ty;
            R(3,4) = tz;
 
            H = R;
 
            s{i} = [s{i} H]; 
            vert_t = [];
 
            for n=1:8
               new_point = H*vert(n,:)';
               vert_t = [vert_t; new_point'];
            end
 
            coords = [coords vert_t(1,1:3), vert_t(2,1:3), vert_t(3,1:3), vert_t(4,1:3)...
                              vert_t(5,1:3), vert_t(6,1:3), vert_t(7,1:3), vert_t(8,1:3)];
 
            newRec.vertices = vert_t;
            plotCuboid(newRec,'k',0.5);
            % coord sys at centroid
            plot3([tx, tx+1], [ty,ty], [tz,tz],'r'); % x axis
            plot3([tx, tx], [ty,ty+1], [tz,tz],'g'); % y axis
            plot3([tx, tx], [ty,ty], [tz,tz+1],'b'); % z axis
        end
         
    elseif strcmp(noise,'random')
         
 
        for j=1:num_vert
%             rand_noise = 0.5;
            rand_r = randi([170,190],1);
            Rz = [cosd(rand_r),  -sind(rand_r) , 0, 0; 
                sind(rand_r),  cosd(rand_r)  , 0, 0; 
                0               ,   0                , 1, 0;
                0               ,   0                , 0, 1 ];
            
            Ry = [cosd(rand_r) , 0, sind(rand_r),0;
                  0            , 1, 0           ,0;
                  -sind(rand_r), 0, cosd(rand_r),0;
                  0            , 0, 0           ,1];
              
              
            Rx =  [1, 0             , 0            , 0; 
                   0, cosd(rand_r)  , -sind(rand_r), 0; 
                   0, sind(rand_r)  , cosd(rand_r),  0;
                   0,   0           , 0           , 1 ];
            
            R = Rz*Ry*Rx;
            rand_t = rand;
            rand_t = rand_t - rand_t/2;
            tx = b_x(j)+rand_t;
            ty = b_y(j)+rand_t;
            tz = 0;
 
            R(1,4) = tx;
            R(2,4) = ty;
            R(3,4) = tz;
 
            H = R;
 
            s{i} = [s{i} H]; 
            vert_t = [];
 
            for n=1:8
               new_point = H*vert(n,:)';
               vert_t = [vert_t; new_point'];
            end
 
            coords = [coords vert_t(1,1:3), vert_t(2,1:3), vert_t(3,1:3), vert_t(4,1:3)...
                              vert_t(5,1:3), vert_t(6,1:3), vert_t(7,1:3), vert_t(8,1:3)];
 
            newRec.vertices = vert_t;
            plotCuboid(newRec,'k',0.5);
             
            % coord sys at centroid
%             plot3([tx, tx+1], [ty,ty], [tz,tz],'r'); % x axis
%             plot3([tx, tx], [ty,ty+1], [tz,tz],'g'); % y axis
%             plot3([tx, tx], [ty,ty], [tz,tz+1],'b'); % z axis
        end
    elseif strcmp(noise,'none')
       
 
        for j=1:num_vert
             R = diag([1,1,1,1]);
          
            tx = b_x(j);
            ty = b_y(j);
            tz = 0;
 
            R(1,4) = tx;
            R(2,4) = ty;
            R(3,4) = tz;
 
            H = R;
 
            s{i} = [s{i} H]; 
            vert_t = [];
 
            for n=1:8
               new_point = H*vert(n,:)';
               vert_t = [vert_t; new_point'];
            end
 
            coords = [coords vert_t(1,1:3), vert_t(2,1:3), vert_t(3,1:3), vert_t(4,1:3)...
                              vert_t(5,1:3), vert_t(6,1:3), vert_t(7,1:3), vert_t(8,1:3)];
 
            newRec.vertices = vert_t;
            plotCuboid(newRec,'k',0.5);
            % coord sys at centroid
            plot3([tx, tx+1], [ty,ty], [tz,tz],'r'); % x axis
            plot3([tx, tx], [ty,ty+1], [tz,tz],'g'); % y axis
            plot3([tx, tx], [ty,ty], [tz,tz+1],'b'); % z axis
        end 
         
    end
 
     
end
coords=reshape(coords,length(coords)/num_cols,num_cols);
 