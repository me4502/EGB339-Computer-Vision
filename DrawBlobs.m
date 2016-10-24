% Draws the blobs.
function DrawBlobs(blobs, boxStyle, centreStyle)
    for i=1:length(blobs)
        blobs(i).plot_box(boxStyle);
        blobs(i).plot(centreStyle);
    end
end