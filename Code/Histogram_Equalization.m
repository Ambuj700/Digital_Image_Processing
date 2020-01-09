% Histogram Equalization of Image
% Created By : Pratik Adle

%%

clc;
clear;
close all;

% Reading Test Image
test_image = imread('Lenna.png');
figure('Name','Original Test Image');
imshow(test_image);
title('Original Test Image');

% Converting Test Image to Gray Scale
test_image_gray = rgb2gray(test_image);

[rows, cols] = size(test_image_gray);

%% Number of occurance of each gray scale level

num_pixel = zeros(1,256);

for ii = 1:rows
    for jj = 1:cols
        num_pixel( test_image_gray(ii,jj) + 1 ) = num_pixel( test_image_gray(ii,jj) + 1 ) + 1;
    end
end


%% Commulative Distribution Function (c.d.f.)

cdf_num_pixel = cumsum(num_pixel);

%% Histogram Equalization

% h(v) = round((cdf(v) - cdf_min)*(L-1))
%              -------------------------
%                ((MxN) - cdf_min)
%
% M = rows , N = cols

h_v = round((cdf_num_pixel - 1) ./ (512*512 - 1) .* 255);


equilized_image= zeros(size(test_image_gray));

for ii=1:rows
    for jj= 1:cols
        t=(test_image_gray(ii,jj));
        equilized_image(ii,jj)=h_v(t);
    end
end

%% Plotting Histogram of test as well as equalized image

% Plotting histogram of test image
figure('Name','Histogram of test as well as equalized image');
subplot(121);
imhist(test_image_gray);
title('Histogram of test image');

% Plotting histogram of Histogram Equalized Image
subplot(122);
imhist(uint8(equilized_image));
title('Histogram of Histogram Equalized Image');

suptitle('Plotting Histogram of test as well as equalized image');

%% Displaying test as well as equalized image without using Built-in Command

% Displaying test image 
figure('Name','Histogram Equalization without built-in command');
subplot(121);
imshow(test_image_gray);
title('Original Image');

% Displaying Histogram Equalized Image
subplot(122);
imshow(uint8(equilized_image));
title('Histogram Equalized Image');

suptitle('Histogram Equalization without using Built-in Command');

%% Histogram Equalization using Built-in Command

figure('Name','Histogram Equalization using Built-in Command');
subplot(121);
imshow(test_image_gray);
title('Original Test Image');

subplot(122);
histeq(test_image_gray);
title('Histogram Equalized Image');

suptitle('Histogram Equalization using Built-in Command');