% Neighbourhood Algorithm.
% Created By : Pratik Adle
%%
clc;
clear;
close all;

test_image = imread('Lenna.png');
test_image = rgb2gray(test_image);

%% Pad zeros to the Image Matrix

height = size(test_image,1); %Height of the test Image
width = size(test_image,2); %Width of the test Image

test_image_PadZero = [zeros(height,1),test_image,zeros(height,1)];
test_image_PadZero = [zeros(1,width+2);test_image_PadZero;zeros(1,width+2)];



%% Neighbourhood Algorithm

image_new = zeros(height,width);
for rows = 1:height
    for cols = 1:width
        
        currenrt_row = rows+1; %Save the current Row and Col Values
        current_col = cols+1;
        
        current_pixel = test_image_PadZero(currenrt_row,current_col);
                
        new_pixel = 1*(current_pixel<test_image_PadZero(currenrt_row,current_col+1))+...
            2*(current_pixel<test_image_PadZero(currenrt_row-1,current_col+1))+...
            4*(current_pixel<test_image_PadZero(currenrt_row-1,current_col))+...
            8*(current_pixel<test_image_PadZero(currenrt_row-1,current_col-1))+...
            16*(current_pixel<test_image_PadZero(currenrt_row,current_col-1))+...
            32*(current_pixel<test_image_PadZero(currenrt_row+1,current_col-1))+...
            64*(current_pixel<test_image_PadZero(currenrt_row+1,current_col))+...
            128*(current_pixel<test_image_PadZero(currenrt_row+1,current_col+1)); %Calculation of New Value of Pixel
        
        image_new(rows,cols) = new_pixel;
    end
end
image_new = uint8(image_new); %Convert to Unsigned 8-Bit Data Type
%% Plotting Original and Resultant Image

figure;
subplot(121);
imshow(test_image);
title('Original Image');

subplot(122);
imshow(image_new);
title('Image After Neighbourhood Algorithm');