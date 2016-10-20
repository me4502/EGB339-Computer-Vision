% Draws the blobs.
function DrawBlobs(blobs)
    for i=1:length(blobs)
        blobs(i).plot_box('g');
        blobs(i).plot('r*');
    end
end