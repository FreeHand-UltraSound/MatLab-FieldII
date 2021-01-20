%% Displaying multipla figures of phantom cyst using MONTAGE

img1 = imread('Cyst_r(1).fig');
img2 = imread('Cyst_r(2).fig');
img3 = imread('Cyst_r(3).fig');
img4 = imread('Cyst_r(4).fig');
img5 = imread('Cyst_r(5).fig');

multiImg = cat(3, img1, img2, img3, img4, img5, img4, img3, img2, img1);

montage(multiImg);
