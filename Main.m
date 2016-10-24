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
    
    foundBlobs = FindAndDrawControlShapes(image, controlShapes, highestPoint);
    
    homographyMatrix = GetHomography(blobs);
    
    for i = 1:length(foundBlobs)
       p = [foundBlobs(i).uc foundBlobs(i).vc];
       q = homtrans(homographyMatrix, p');
       fprintf('Shape %d is at %f,%f\n', i, q(1), q(2));
    end    
end