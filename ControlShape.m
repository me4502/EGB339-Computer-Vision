classdef ControlShape < handle
    %CONTROLSHAPE A shape from the control sheet.
    %   Contains both blob and colour.
    
    properties
        blob;
        colour;
    end
    
    methods
        function obj = ControlShape(blob, colour)
            obj.blob = blob;
            obj.colour = colour;
        end
    end
    
end

