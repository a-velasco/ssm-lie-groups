function [s, recA_x, recA_y,coords] = plotDataset2D(num_cols, num_vert, noise)

s = cell([1 num_cols]);

%create circle
r = 5;
x = 0; y = 0;
theta=0:0.01:pi; 

xp=r*cos(theta); 
yp=r*sin(theta);

% plot lines to radius at theta intervals
t = linspace(1, length(theta), num_cols); % sample equally spaced lines
t = ceil(t);

% base/canonical shape
A1 = [0,0]; A2 = [0,r];
plot(A1,A2,'r');
a_x = linspace(A1(1),A1(2),num_vert);
a_y = linspace(A2(1),A2(2),num_vert);
[recA_x, recA_y] = getRecCoords(a_x(1),a_y(1));

coords = [];


for i=1:num_cols
    % plot line at ith theta 
    B1 = [0,xp(t(i))];
    B2 = [0,yp(t(i))];
    plot(B1,B2);
        
    % sample vertebrae along each line
    [b_x, b_y] = plotSampledPoints(B1,B2,num_vert);
    
    if strcmp(noise,'gaussian')
        gaussian = normrnd(0.1:1,1./(1:3));
        R = [cos(theta(t(i))+gaussian(1)),  -sin(theta(t(i))+gaussian(1)) , 0 ; 
             sin(theta(t(i))+gaussian(1)),   cos(theta(t(i))+gaussian(1)) , 0 ;   
             0                            ,   0                           , 1 ];  

        for j=1:num_vert
            tx = b_x(j)+gaussian(2);
            ty = b_y(j)+gaussian(3);

            T = [0, 0, tx;
                 0, 0, ty;
                 0, 0,  0];

            H = R+T;

            s{i} = [s{i} H]; 

            recB = H* [recA_x; recA_y; 1 1 1 1];
            coords = [coords; recB(1,1),recB(1,2),recB(1,3),recB(1,4),recB(2,1),recB(2,2),recB(2,3),recB(2,4)];

            plotQuadrilaterals(recB(1,:), recB(2,:),'k-',0.5)

        end
    end
    
    if strcmp(noise,'random')
        rand_noise = 0.4;
        R = [cos(theta(t(i))+rand_noise),  -sin(theta(t(i))+rand_noise) , 0 ; 
             sin(theta(t(i))+rand_noise),   cos(theta(t(i))+rand_noise) , 0 ;   
             0                       ,   0                  , 1 ];  

        for j=1:num_vert
            tx = b_x(j)+(0.1*randi([1 3],1));
            ty = b_y(j)+(0.1*randi([1 3],1));

            T = [0, 0, tx;
                 0, 0, ty;
                 0, 0,  0];

            H = R+T;

            s{i} = [s{i} H]; 

            recB = H* [recA_x; recA_y; 1 1 1 1];
            coords = [coords; recB(1,1),recB(1,2),recB(1,3),recB(1,4),recB(2,1),recB(2,2),recB(2,3),recB(2,4)];

            plotQuadrilaterals(recB(1,:), recB(2,:),'k-',0.5)

        end
    end

    if strcmp(noise,'none')
        R = [cos(theta(t(i))),  -sin(theta(t(i))) , 0 ; 
             sin(theta(t(i))),   cos(theta(t(i))) , 0 ;   
             0               ,   0                , 1 ];  

        for j=1:num_vert
            tx = b_x(j);
            ty = b_y(j);

            T = [0, 0, tx;
                 0, 0, ty;
                 0, 0,  0];

            H = R+T;

            s{i} = [s{i} H]; 

            recB = H* [recA_x; recA_y; 1 1 1 1];
            coords = [coords; recB(1,1),recB(1,2),recB(1,3),recB(1,4),recB(2,1),recB(2,2),recB(2,3),recB(2,4)];
            
            plotQuadrilaterals(recB(1,:), recB(2,:),'k-',0.5)

        end
    end
        
plotQuadrilaterals(recA_x, recA_y,'r-',0.5);
    
end

end


