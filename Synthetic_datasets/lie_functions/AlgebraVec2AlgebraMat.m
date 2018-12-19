% Lie algebra vector to Lie algebra matrix

function K = AlgebraVec2AlgebraMat(k)

[~,b] = dimCheck();

if strcmp(getGlobalD,'2D')
    count = b;
    K = [ 0     , k(3) , k(1);
          -k(3) , 0    , k(2);
          0     , 0    , 0  ];
      
    num_it = length(k)/b - 1;
    for i=1:num_it

        K_new = [ 0          , k(3+count) , k(1+count);
                 -k(3+count) , 0          , k(2+count);
                  0          , 0          , 0        ];

        K = [K K_new];  

        count = count+b;
    end

else
    count = 6;
    K = [0    ,  -k(6) , k(5)  , k(1);
         k(6) ,  0     , -k(4) , k(2);
         -k(5),  k(4)  , 0     , k(3);
         0    ,  0     , 0     , 0];
     
     
    num_it = (length(k)/6) - 1;
    for i=1:num_it
        K_new = [0          ,  -k(6+count) , k(5+count) , k(1+count);
                 k(6+count) ,  0           , -k(4+count) , k(2+count);
                -k(5+count) ,  k(4+count)  , 0          , k(3+count);
                 0          ,  0           , 0          , 0];

        K = [K K_new];  

        count = count+6;
    end
end
        

end