function input = ControlBubbleSort(input)
    len = length(input);
    sorted = 1;
    pass = 1;
    
    while sorted == 0
        sorted = 1;
        for i = 1:(len - pass)
            if (input(i).blob.uc - input(i+1).blob.uc > 15)
                temp = input(i);
                input(i) = input(i+1);
                input(i+1) = temp;
                sorted = 0;
            end
        end
        pass = pass + 1;
    end
end