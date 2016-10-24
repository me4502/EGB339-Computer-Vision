% Finds, and then draws all the shapes.
function FindAndDrawAllShapes(image, highestPoint, lowestPoint)
    imRed = image(:,:,1);
    imGreen = image(:,:,2);
    
    imRed = imRed > 0.5;
    imGreen = imGreen > 0.5;
        
    idisp(imGreen | imRed);
    
    redBlobs = iblobs(imRed, 'boundary', 'area', [1000 50000]);    
    greenBlobs = iblobs(imGreen, 'boundary', 'area', [1000 50000]);
    
    redBlobs = redBlobs(redBlobs.vc < highestPoint & redBlobs.vc > lowestPoint);
    greenBlobs = greenBlobs(greenBlobs.vc < highestPoint & greenBlobs.vc > lowestPoint);
    
    DrawBlobs(greenBlobs, 'g', 'g*');
        
    blobs = [redBlobs,greenBlobs];
        
    triangles = blobs((blobs.circularity - pi/8) < 0.35 & (blobs.circularity - pi/8) > -0.1);
            
    DrawBlobs(triangles, 'r--', 'r*');
end