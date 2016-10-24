% Gets the blobs of all shapes other than the calibration dots.
function blobs = FindAndDrawAllShapes(image)
    imRed = image(:,:,1);
    imGreen = image(:,:,2);
    
    imRed = imRed > 0.5;
    imGreen = imGreen > 0.5;
        
    figure(2);
    idisp(imGreen | imRed);
    
    redBlobs = iblobs(imRed, 'boundary', 'area', [1000 50000]);    
    greenBlobs = iblobs(imGreen, 'boundary', 'area', [1000 50000]);
    
    DrawBlobs(greenBlobs, 'g', 'g*');
        
    blobs = [redBlobs,greenBlobs];
    triangles = blobs((blobs.circularity - pi/8) < 0.3 & (blobs.circularity - pi/8) > 0);
        
    DrawBlobs(triangles, 'r--', 'r*');
end