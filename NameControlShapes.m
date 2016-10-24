function NameControlShapes(controlShapes)
    for i = 1:length(controlShapes)
        if (controlShapes(i).blob.area > 6000)
            size = 'large';
        else
            size = 'small';
        end
                
        if (controlShapes(i).blob.circularity > 0.95)
            shape = 'circle';
        elseif (controlShapes(i).blob.circularity > 0.7)
            shape = 'square';
        else
            shape = 'triangle';
        end
        fprintf('%s %s %s\n', size, controlShapes(i).colour, shape);
    end
end