% Gets the homography matrix.
function homographyMatrix = GetHomography(dotBlobs)
    Q = [20 380; 200 380; 380 380; 20 200; 200 200; 200 20; 20 20; 380 200; 380 20];
    
    spots = zeros(2, length(dotBlobs));
    for i=1:length(dotBlobs)
        spots(1, i) = dotBlobs(i).uc;
        spots(2, i) = dotBlobs(i).vc;
    end
    
    homographyMatrix = homography(Q', spots);
end