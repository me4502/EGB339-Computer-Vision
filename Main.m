% Main function to the CV program.
function Main()
    image = GetImage('test-images/iphone7-1.jpg');
    blobs = FindDots(image);
    
    DrawBlobs(blobs, 'b', 'b*');
    
    [~] = waitforbuttonpress;
    
    allShapes = FindAndDrawAllShapes(image);
    
    [~] = waitforbuttonpress;
    
    homographyMatrix = GetHomography(blobs);
    
    homographyMatrix
end