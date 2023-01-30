%Mu Maxime
%2022-10-27

clear global;
close all;

%Il est conseillé d'utiliser Matlab pour avoir accès à ses extensions
%Ne pas oublier de mettre en PATH les dossiers DOCS, PRE-PROCESSING,
%TEXTURES et UTILITIES et ses sous-dossiers


%Chargement des images
volum = imread("Etudes/D66.gif");
volum1 = imread("Etudes/D67.gif");
volum2 = imread("Etudes/D94.gif");
volum3 = imread("Etudes/D95.gif");
volum4 = imread("Etudes/D96.gif");
volum5 = imread("Etudes/D27.gif");
volum6 = imread("Etudes/D28.gif");

%Convertir en double les images
volume = double(volum);
volume1 = double(volum1);
volume2 = double(volum2);
volume3 = double(volum3);
volume4 = double(volum4);
volume5 = double(volum5);
volume6 = double(volum6);

%Taille de l'image
S = size(volume);
disp(S);

%On construit un masque 8x8
mask = ones(S(1)/80, S(2)/80);


%Paramètres à entrer 
scanType = 'PETscan';
pixelW = 4; %valeur fixée readme
sliceS = 1; %on prend un slicing de 1
R = 1;
scale = 4;
textType  = 'Matrix';%On choisi 'matrix' pour faire une étude comparative de différentes textures
quantAlgo = 'Lloyd';%On choisi l'algorithme de Lloyd
Ng = 32;

%To prepare 'volume' for matrix-based texture analysis at a scale of 5 mm, without WBPF, %
%    using a Lloyd-Max quantization algorithm with 32 gray-levels, run: 
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

%For matrix-based textures, run:
[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM);
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

writetable(struct2table(glcmTextures), 'glcm.csv');
writetable(struct2table(glrlmTextures), 'glrlm.csv');
writetable(struct2table(glszmTextures), 'glszm.csv');
writetable(struct2table(ngtdmTextures), 'ngtdm.csv');

%1e volume
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume1,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM);
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

writetable(struct2table(glcmTextures), 'glcm1.csv');
writetable(struct2table(glrlmTextures), 'glrlm1.csv');
writetable(struct2table(glszmTextures), 'glszm1.csv');
writetable(struct2table(ngtdmTextures), 'ngtdm1.csv');

%2e volume
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume2,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM);
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

writetable(struct2table(glcmTextures), 'glcm2.csv');
writetable(struct2table(glrlmTextures), 'glrlm2.csv');
writetable(struct2table(glszmTextures), 'glszm2.csv');
writetable(struct2table(ngtdmTextures), 'ngtdm2.csv');

%3e volume
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume3,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM);
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

writetable(struct2table(glcmTextures), 'glcm3.csv');
writetable(struct2table(glrlmTextures), 'glrlm3.csv');
writetable(struct2table(glszmTextures), 'glszm3.csv');
writetable(struct2table(ngtdmTextures), 'ngtdm3.csv');

%4e volume
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume4,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM);
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

writetable(struct2table(glcmTextures), 'glcm4.csv');
writetable(struct2table(glrlmTextures), 'glrlm4.csv');
writetable(struct2table(glszmTextures), 'glszm4.csv');
writetable(struct2table(ngtdmTextures), 'ngtdm4.csv');

%5e volume
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume5,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM);
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

writetable(struct2table(glcmTextures), 'glcm5.csv');
writetable(struct2table(glrlmTextures), 'glrlm5.csv');
writetable(struct2table(glszmTextures), 'glszm5.csv');
writetable(struct2table(ngtdmTextures), 'ngtdm5.csv');

%6e volume
[ROIonly,levels,ROIbox,maskBox] = prepareVolume(volume6,mask,scanType,pixelW,sliceS,R,scale,textType,quantAlgo,Ng);

[GLCM] = getGLCM(ROIonly,levels); 
[glcmTextures] = getGLCMtextures(GLCM);
[GLRLM] = getGLRLM(ROIonly,levels);
[glrlmTextures] = getGLRLMtextures(GLRLM);
[GLSZM] = getGLSZM(ROIonly,levels);
[glszmTextures] = getGLSZMtextures(GLSZM);
[NGTDM,countValid] = getNGTDM(ROIonly,levels);
[ngtdmTextures] = getNGTDMtextures(NGTDM,countValid);

writetable(struct2table(glcmTextures), 'glcm6.csv');
writetable(struct2table(glrlmTextures), 'glrlm6.csv');
writetable(struct2table(glszmTextures), 'glszm6.csv');
writetable(struct2table(ngtdmTextures), 'ngtdm6.csv');

