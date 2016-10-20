% Main function to the CV program.
function Main()
    image = GetImage('test-images/lg4-1.jpg');
    blobs = FindDots(image);
    
    DrawBlobs(blobs);
end