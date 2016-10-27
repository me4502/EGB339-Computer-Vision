function controlShapes = GetControlSheet(image, highestPoint)
    imRed = image(:,:,1);
    imGreen = image(:,:,2);
    
    imRed = imRed > 0.5;
    imGreen = imGreen > 0.5;
            
    redBlobs = iblobs(imRed, 'boundary', 'area', [1000 50000]);    
    greenBlobs = iblobs(imGreen, 'boundary', 'area', [1000 50000]);

    redBlobs = redBlobs(redBlobs.vc > highestPoint & redBlobs.circularity > 0.2);
    greenBlobs = greenBlobs(greenBlobs.vc > highestPoint & greenBlobs.circularity > 0.2);
        
    for i=1:length(redBlobs)
        controlShapes(i) = ControlShape(redBlobs(i), 'red');
    end
    for i=1:length(greenBlobs)
        controlShapes(i + length(redBlobs)) = ControlShape(greenBlobs(i), 'green');
    end    
    
    controlShapes = ControlBubbleSort(controlShapes);
end