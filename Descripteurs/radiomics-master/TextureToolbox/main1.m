%Mu Maxime
%2022-10-27

clear global;
close all;


%Il est conseillé d'utiliser Matlab pour avoir accès à ses extensions
%Ne pas oublier de mettre en PATH les dossiers DOCS, PRE-PROCESSING,
%TEXTURES et UTILITIES et ses sous-dossiers


%Chargement des images
volum = imread("Etudes/B5.gif");
volum1 = imread("Etudes/B6.gif");

%Convertir en double les images
volume = double(volum);
volume1 = double(volum1);

%Taille de l'image
S = size(volume);
disp(S);

%On construit un masque
mask = ones(S(1)/5,S(2)/5);

%Paramètres à entrer 
scanType = 'PETscan';
pixelW =4; %valeur fixée readme
sliceS = 1; %valeur fixée readme
R = 1; %R = 1 sinon erreur
scale = 4;
textType  = 'Matrix';%On choisi 'matrix' pour faire une étude comparative de différentes textures
quantAlgo = 'Lloyd';
Ng = 32;

%To prepare 'volume' for matrix-based texture analysis at a scale of 5 mm, without WBPF, %
%    using a Lloyd-Max quantization algorithm with 32 gray-levels, run: 
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);


%For Global textures, run:
%[globalTextures] = getGlobalTextures(ROIonly,100)


%For matrix-based textures, run:
[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM)
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

%writetable(struct2table(globalTextures), 'global.csv');
writetable(struct2table(glcmTextures), 'glcmb1.csv');
writetable(struct2table(glrlmTextures), 'glrlmb1.csv');
writetable(struct2table(glszmTextures), 'glszmb1.csv');
writetable(struct2table(ngtdmTextures), 'ngtdmb1.csv');

%1e volume
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume1,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

%[globalTextures] = getGlobalTextures(ROIonly,100)

[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM)
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

%writetable(struct2table(globalTextures), 'global1.csv');
writetable(struct2table(glcmTextures), 'glcmb2.csv');
writetable(struct2table(glrlmTextures), 'glrlmb2.csv');
writetable(struct2table(glszmTextures), 'glszmb2.csv');
writetable(struct2table(ngtdmTextures), 'ngtdmb2.csv');

