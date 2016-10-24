function foundBlobs = FindAndDrawControlShapes(image, controlShapes, highestPoint, lowestPoint)
    [sw, sh, ~] = size(image);
    blankImage = zeros(sw, sh);

    imRed = image(:,:,1);
    imGreen = image(:,:,2);
    
    imRed = imRed > 0.5;
    imGreen = imGreen > 0.5;
        
    redBlobs = iblobs(imRed, 'boundary', 'area', [1000 50000]);    
    greenBlobs = iblobs(imGreen, 'boundary', 'area', [1000 50000]);
    
    redBlobs = redBlobs(redBlobs.vc < highestPoint & redBlobs.vc > lowestPoint);
    greenBlobs = greenBlobs(greenBlobs.vc < highestPoint & greenBlobs.vc > lowestPoint);
        
    for i = 1:length(controlShapes)        
       if strcmp(controlShapes(i).colour, 'green') == 1
           for gb = 1:length(greenBlobs)
              if (abs(greenBlobs(gb).circularity - controlShapes(i).blob.circularity) < 0.15)
                 if (abs(greenBlobs(gb).area - controlShapes(i).blob.area) < 1250)
                     foundBlobs(i) =  greenBlobs(gb);
                     break;
                 end
              end
           end
       else
           for rb = 1:length(redBlobs)
              if (abs(redBlobs(rb).circularity - controlShapes(i).blob.circularity) < 0.15)
                  if (abs(redBlobs(rb).area - controlShapes(i).blob.area) < 1500)
                     foundBlobs(i) =  redBlobs(rb);
                     break;
                  end
              end
           end
       end
    end
        
    bothImage = imRed | imGreen;
    
    newImage = blankImage;
    
    for i = 1:length(foundBlobs)
        newImage(foundBlobs(i).vmin:foundBlobs(i).vmax,foundBlobs(i).umin:foundBlobs(i).umax) = bothImage(foundBlobs(i).vmin:foundBlobs(i).vmax,foundBlobs(i).umin:foundBlobs(i).umax);
    end
    
    idisp(newImage);
                    
    DrawBlobs(foundBlobs, 'g', 'g*');
end