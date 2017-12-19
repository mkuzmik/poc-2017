function split(img,x1,y1,x2,y2)

    global minimum;
    global threshold;
    global index;
    global segRes;
    global MRes;
    
    img_part = img(y1:y2,x1:x2);
    img_mean = mean(img_part(:));
    img_std = std(img_part(:));
    
    if (img_std < threshold) || ((x2-x1) <= minimum)
        index = index + 1;
        segRes(y1:y2,x1:x2) = index;
        MRes(y1:y2,x1:x2) = img_mean; 
    else
        new_x = floor((x2+x1)/2);
        new_y = floor((y2+y1)/2);
        split(img,x1,y1,new_x,new_y);
        split(img,new_x+1,y1,x2,new_y);
        split(img,new_x+1,new_y+1,x2,y2);
        split(img,x1,new_y+1,new_x,y2);
    end
end

