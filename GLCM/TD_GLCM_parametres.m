clear all; close all; clc;

I=imread('D31.gif');
I=imresize(I,0.5);
figure;imshow(uint8(I));

%Calculer les GLCM:

%Distance:
d=1;

%Orientations:
offsets = [0 d; -d d;-d 0; -d -d];
glcm= graycomatrix(I,'Offset',offsets,'NumLevels',256,'Symmetric',true);

orientations=[0 45 90 135];
figure,
for i=1:4
    subplot(1,4,i);imshow(glcm(:,:,i),[]); title(sprintf('d=%d, Orientation=%d',d,orientations(1,i)));
end


%Calculer  les paramètres de Haralick:



for i=1:4
    
    %Normaliser la glcm
    coOcMat=glcm(:,:,i);
    coOcMat = coOcMat./sum(coOcMat(:));
    
    
    sizecoOcMat = size(coOcMat);
    [col,row] = meshgrid(1:sizecoOcMat(1),1:sizecoOcMat(2));
    rowMean =  sum( row(:).*coOcMat(:) );
    colMean =  sum( col(:).*coOcMat(:) );
    rowStd = sqrt( sum( (row(:)-rowMean).^2 .* coOcMat(:) ) );
    colStd = sqrt( sum( (col(:)-colMean).^2 .* coOcMat(:) ) );
    
  
    % Contrast
    matrix = ( abs(row - col).^2 ) .* coOcMat;
    Contrast = sum( matrix(:) );
    
    % Correlation
    zaehler = sum ((row(:) - rowMean) .*(col(:) - colMean) .*  coOcMat(:));
    denominator = rowStd * colStd;
    Correlation= zaehler/denominator;
    
    % Energy (Angular Second Moment)
    Energy = sum( coOcMat(:).^2 );
    
    % Variance
    Variance= sum( (row(:)-mean(coOcMat(:))).^2 .*coOcMat(:) );
    
    % Homogeneity
    Homogeneity= sum( coOcMat(:) ./ ( 1+ abs(row(:)-col(:)) ) );
    
    
    Haralick_Feature(i,1)=Contrast;
    Haralick_Feature(i,2)=Correlation;
    Haralick_Feature(i,3)=Energy;
    Haralick_Feature(i,4)=Homogeneity;
    
    
   %Comparer avec les résultats de la fonction matlab:
   stats = graycoprops(glcm(:,:,i));
   Matlab_Haralick_Feature(i,1)=stats.Contrast;
   Matlab_Haralick_Feature(i,2)=stats.Correlation;
   Matlab_Haralick_Feature(i,3)=stats.Energy;
   Matlab_Haralick_Feature(i,4)=stats.Homogeneity;
end


Feature_Vector=mean(Haralick_Feature,1)

