% Loads an image, and performs necessary conversions to make it easier for
% the CV program to understand it.
function image = GetImage(name)
    image = iread(name, 'double').^2.5;
    
    imR = image(:,:,1);
    imG = image(:,:,2);
    imB = image(:,:,3);

    image(:,:,1) = imR./(imR+imG+imB);
    image(:,:,2) = imG./(imR+imG+imB);
    image(:,:,3) = imB./(imR+imG+imB);
end