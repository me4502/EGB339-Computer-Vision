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
            
    for point = points.'
        % Print out the point.
        disp(point);
        
        % Draw to the position.
        HandToPosition(point);
        last_point = point;
                
        NXT_PlayTone(800, 800)
    end
    
    NXT_PlayTone(440, 440)
        
    % Close afterwards.
    COM_CloseNXT('all')
end