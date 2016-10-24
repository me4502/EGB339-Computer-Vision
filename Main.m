% Main function to the CV program.
function Main(robot)
    image = GetImage('test-images/iphone7-1.jpg');
    blobs = FindDots(image);
    
    highestPoint = 0;
    
    for i = 1:length(blobs)
       if highestPoint < blobs(i).vmax
           highestPoint = blobs(i).vmax;
       end
    end
    
    lowestPoint = 50000;
    
    for i = 1:length(blobs)
        if lowestPoint > blobs(i).vmin
           lowestPoint = blobs(i).vmin;
       end
    end
        
    DrawBlobs(blobs, 'r', 'r*');
    
    controlShapes = GetControlSheet(image, highestPoint);
    
    NameControlShapes(controlShapes);
    
    [~] = waitforbuttonpress;
    
    FindAndDrawAllShapes(image, highestPoint, lowestPoint);
    
    [~] = waitforbuttonpress;
    
    foundBlobs = FindAndDrawControlShapes(image, controlShapes, highestPoint, lowestPoint);
    
    homographyMatrix = GetHomography(blobs);
            
    for i = 1:length(foundBlobs)
       p = [foundBlobs(i).uc foundBlobs(i).vc];
       q = homtrans(homographyMatrix, p');
       fprintf('Shape %d is at %f,%f\n', i, q(1), q(2));
       points(i,1) = q(1);
       points(i,2) = q(2);
    end
    
    if (robot)
        [~] = waitforbuttonpress;

        startingPoint = [0 0];
        largestSize = 0;

        for i = 1:length(blobs)
           if largestSize < blobs(i).area
               largestSize = blobs(i).area;
               startingPoint = [blobs(i).uc blobs(i).vc];
           end
        end
        
        startingPoint = homtrans(homographyMatrix, startingPoint');

        startingPoint
        
        Robot(startingPoint, points);
    end
end