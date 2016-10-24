% Finds the calibration dots, and returns them.
function blobs = FindDots(image)
    imBlue = image(:,:,3);
    
    imBlue = imBlue > 0.5;

    idisp(imBlue) %Da ba dee da ba dum
    
    blobs = iblobs(imBlue, 'boundary', 'area', [1000 50000]);
    blobs = blobs(blobs.circularity > 0.7 & blobs.circularity < 1.3);
        
    if (length(blobs) ~= 9)
        fprintf('Warning! Blob count not 9!');
        Disp(blobs);
    end
        
    blobs = BlobBubbleSort(blobs);
end