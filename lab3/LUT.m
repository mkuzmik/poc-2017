
function LUT( obraz, przekodowanie )
    output_img = intlut(obraz, przekodowanie);

    subplot(1,3,1);
    plot(przekodowanie);
    subplot(1,3,2);
    imshow(obraz);
    subplot(1,3,3);
    imshow(output_img);
end

