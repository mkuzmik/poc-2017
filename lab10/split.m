function segmented = split(img,x1,y1,x2,y2)
    global minimum;
    global threshold;

    iVec = img(:);
    
    mean_ = mean(iVec);
    std_ = std(iVec);
    
    if (std_ < threshold || (x1-x2) < minimum)
        segmented = reshape;
        return
    end
    
    
end

