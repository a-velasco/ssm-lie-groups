function plotNewShapePCA(coeff,mu,eigvec,eigval,color)
   
   newshape1 = mu + coeff*sqrt(eigval)*eigvec';
   newshape1 = pcaShapePlot(newshape1);
   
   for j=1:4
       plotCuboid(newshape1(j),color,1);
   end
   
end