function Robot(startingPoint, points)
    % Setup NXT Connection
    SetupNXT();

    % Call the globals setup.
    SetupGlobals();

    global starting_point;
    global last_point;
    
    starting_point = startingPoint - 200;
    last_point = starting_point;
    
    % Overshoot by 40 in direction of movement due to inaccuracy in motors.        
    points = points - 200;
            
    SetupStartingPosition();
            
    while ~isempty(points)
        closest = [-100000 -100000];
        closest_index = -1;
        closest_diff = 10000000;
        index = 1;
        for point = points'                 
            diff = (point(1) - last_point(1))^2 + (point(2) - last_point(2))^2;
            if (closest_diff > diff)
               closest_diff = diff;
               closest = point;
               closest_index = index;
            end
            
            index = index + 1;
        end
        point = closest;
        
        % Print out the point.
        disp(point);
        
        % Draw to the position.
        HandToPosition(point);
        last_point = point;
        
        points = points(~ismember(1:size(points, 1), [closest_index]), :);
        
        NXT_PlayTone(800, 800)
    end
    
    NXT_PlayTone(440, 440)
        
    % Close afterwards.
    COM_CloseNXT('all')
end