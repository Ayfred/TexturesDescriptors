function In = f_normalisation(im)
    In = (im - min(min(im)))/ (max(max(im))- min(min(im)));
end