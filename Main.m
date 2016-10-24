% Main function to the CV program.
function Main()
    image = GetImage('test-images/iphone7-1.jpg');
    blobs = FindDots(image);
    
    highestPoint = 0;
    
    for i = 1:length(blobs)
       if highestPoint < blobs(i).vc
           highestPoint = blobs(i).vc;
       end
    end
        
    DrawBlobs(blobs, 'r', 'r*');
    
    controlShapes = GetControlSheet(image, highestPoint);
    
    NameControlShapes(controlShapes);
    
    [~] = waitforbuttonpress;
    
    FindAndDrawAllShapes(image, highestPoint);
    
    [~] = waitforbuttonpress;
    
    homographyMatrix = GetHomography(blobs);
    
    homographyMatrix
end