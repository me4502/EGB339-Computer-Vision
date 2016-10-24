% BubbleSort for the blobs.
function input = BlobBubbleSort(input)
    len = length(input);
    sorted = 1;
    pass = 1;
    
    while sorted
        sorted = 1;
        for i = 1:len - pass
            if (input(i).uc - input(i+1).uc > -15 && input(i).vc - input(i+1).vc > -15)
                temp = input(i);
                input(i) = input(i+1);
                input(i+1) = temp;
                sorted = 0;
            end
        end
        
        pass = pass + 1;
    end
end