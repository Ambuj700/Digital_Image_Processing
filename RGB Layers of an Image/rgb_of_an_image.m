clc;
clear;
close all;

% Reading Test Image
test_image = imread('Lenna.png');

% Resizing Test Image to 256x256x3
test_image = imresize(test_image,[256 256]);

% Displaying Test Image
figure('Name','Result');
subplot(221);
imshow(test_image);
title('Original Image');

% Displaying Only Red Image
red_image = test_image;
red_image(:,:,[2 3]) = 0 ;
subplot(222);
imshow(red_image);
title('Red Image');

% Displaying Only Green Image
green_image = test_image;
green_image(:,:,[1 3]) = 0 ;
subplot(223);
imshow(green_image);
title('Green Image');

% Displaying Only Blue Image
blue_image = test_image;
blue_image(:,:,[1 2]) = 0 ;
subplot(224);
imshow(blue_image);
title('Blue Image');
