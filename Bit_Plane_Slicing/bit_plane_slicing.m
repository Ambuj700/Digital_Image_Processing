% Bit Plane Slicing of an Image
% Created By : Pratik Adle

%%
clc;
clear;
close all;

% Reading Test Image
test_image = imread('Lenna.png');

% Resizing Test Image to 256x256x3
test_image = imresize(test_image,[256 256]);

% Converting test image to grayscale
gray_test_image = rgb2gray(test_image);
figure('Name','Result')
subplot(251);
imshow(gray_test_image);
title('Original Image');

%% Plotting MSB Bit Plane Image

% Getting MSB bit of each pixel
msb_bit_plane = bitget(gray_test_image, 8);
subplot(252);
imshow(logical(msb_bit_plane));
title('MSB bit plane Image');

%% Plotting Seventh Bit Plane Image

% Getting seventh bit of each pixel
seven_bit_plane = bitget(gray_test_image, 7);
subplot(253);
imshow(logical(seven_bit_plane));
title('Seventh bit plane Image');

%% Plotting Sixth Bit Plane Image

% Getting sixth bit of each pixel
sixth_bit_plane = bitget(gray_test_image, 6);
subplot(254);
imshow(logical(sixth_bit_plane));
title('Sixth bit plane Image');

%% Plotting Fifth Bit Plane Image

% Getting fifth bit of each pixel
fifth_bit_plane = bitget(gray_test_image, 5);
subplot(255);
imshow(logical(fifth_bit_plane));
title('Fifth bit plane Image');

%% Plotting Fourth Bit Plane Image

% Getting fourth bit of each pixel
fourth_bit_plane = bitget(gray_test_image, 4);
subplot(256);
imshow(logical(fourth_bit_plane));
title('Fourth bit plane Image');

%% Plotting Third Bit Plane Image

% Getting third bit of each pixel
third_bit_plane = bitget(gray_test_image, 3);
subplot(257);
imshow(logical(third_bit_plane));
title('Third bit plane Image');

%% Plotting Second Bit Plane Image

% Getting second bit of each pixel
second_bit_plane = bitget(gray_test_image, 2);
subplot(258);
imshow(logical(second_bit_plane));
title('Second bit plane Image');

%% Plotting LSB Bit Plane Image

% Getting lsb of each pixel
lsb_bit_plane = bitget(gray_test_image, 1);
subplot(259);
imshow(logical(lsb_bit_plane));
title('LSB bit plane Image');

%% Image of 7 bits except LSB 

[rows cols] = size(gray_test_image);
seven_bits_image = zeros(rows,cols);

for ii = 1:rows
    for jj = 1:cols
        % Getting seven bits except lsb
        temp = bitget(gray_test_image(ii,jj), 2:1:8);
        % Converting it to decimal value
        temp2 = bi2de(temp);
        % Storing these values
        seven_bits_image(ii,jj) = temp2;
    end
end

subplot(2,5,10);
imshow(uint8(seven_bits_image));
title('Image with 7 bits plane');
