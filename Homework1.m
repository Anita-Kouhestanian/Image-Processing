%% question 3
% part a
I=imread('Zootopia.jpg');
subplot(2,2,1), imshow(I), title('Original Image');
redChannel = I(:, :, 1);
subplot(2,2,2), imshow(redChannel), title('REDchannel');
greenChannel = I(:, :, 2);
subplot(2,2,3), imshow(greenChannel), title('GREENchannel');
blueChannel = I(:, :, 3);
subplot(2,2,4), imshow(blueChannel), title('BLUEchannel');
% part b
M=I;
M(:,:,1)=I(:,:,1);
M(:,:,2)=I(:,:,3);
M(:,:,3)=I(:,:,2);
figure;subplot(1,2,1),imshow(M);
N= I;
N(:,:,1)=I(:,:,2);
N(:,:,2)=I(:,:,1);
N(:,:,3)=I(:,:,3);
 subplot(1,2,2),imshow(N);
% part C
Y = 0.299 * redChannel + 0.587 * greenChannel + 0.114 * blueChannel;
figure;
subplot(1,3,1), imshow(Y), title('Y');
U = -0.14713 * redChannel - 0.28886 * greenChannel + 0.436 * blueChannel;
subplot(1,3,2), imshow(U), title('U');
V = 0.615 * redChannel - 0.51499 * greenChannel - 0.10001 * blueChannel;
subplot(1,3,3), imshow(V), title('V');
% part d
Y2 = imcomplement(Y);
figure;
subplot(1,2,1), imshow(Y), title('original');
subplot(1,2,2), imshow(Y2), title('inverted Y');

%% question 4
A=imread('Transformers.jpg');
subplot(1,2,1),imshow(A),title('Transformers');
B=imread('Transformers-msg.jpg');
subplot(1,2,2),imshow(B),title('Transformers-msg');
% no, they look pretty much the same
% part b
b=bitget(B,1); figure,subplot(4,2,1), imshow(logical(b));title('Bit plane 1');
b=bitget(B,2); subplot(4,2,2), imshow(logical(b));title('Bit plane 2');
b=bitget(B,3); subplot(4,2,3), imshow(logical(b));title('Bit plane 3');
b=bitget(B,4); subplot(4,2,4), imshow(logical(b));title('Bit plane 4');
b=bitget(B,5); subplot(4,2,5), imshow(logical(b));title('Bit plane 5');
b=bitget(B,6); subplot(4,2,6), imshow(logical(b));title('Bit plane 6');
b=bitget(B,7); subplot(4,2,7), imshow(logical(b));title('Bit plane 7');
b=bitget(B,8); subplot(4,2,8), imshow(logical(b));title('Bit plane 8');
% part c
%planes 5,6,7,8 are significant .the hidden message can be seen on the plane 1. the message is (It's high noon)
% part d
a=bitset(A,1); figure,subplot(4,2,1), imshow(a);title('Bit plane 1');
a=bitset(A,2); subplot(4,2,2), imshow(a);title('Bit plane 2');
a=bitset(A,3); subplot(4,2,3), imshow(a);title('Bit plane 3');
a=bitset(A,4); subplot(4,2,4), imshow(a);title('Bit plane 4');
a=bitset(A,5); subplot(4,2,5), imshow(a);title('Bit plane 5');
a=bitset(A,6); subplot(4,2,6), imshow(a);title('Bit plane 6');
a=bitset(A,7); subplot(4,2,7), imshow(a);title('Bit plane 7');
a=bitset(A,8); subplot(4,2,8), imshow(a);title('Bit plane 8');
%it's getting kinda distorted on plane 7 and 8.
%% Question 5
% yellow=red+green
% magenta=red+blue
% cyan=green+blue
r=[1,1,0;0,1,1;0,1,0];
g=[1,0,0;1,1,0;1,1,0];
b=[1,0,1;0,0,1;1,1,0];
rgb_image=cat(3,r,g,b);
figure;imshow(rgb_image,'InitialMagnification',5000);
disp('r=');
disp(r)
disp('g =');
disp(g)
disp('b =');
disp(b)
c=0.8;
rgb_scaled1=cat(3,r*c,g*c,b*c);
figure;subplot(2,2,1),imshow(rgb_scaled1),title('C=0.8');
c=0.6;
rgb_scaled2=cat(3,r*c,g*c,b*c);
subplot(2,2,2),imshow(rgb_scaled2),title('C=0.6');
c=0.4;
rgb_scaled3=cat(3,r*c,g*c,b*c);
subplot(2,2,3),imshow(rgb_scaled3),title('C=0.4')
c=0.2;
rgb_scaled4=cat(3,r*c,g*c,b*c);
subplot(2,2,4),imshow(rgb_scaled4),title('C=0.2')
% the colors are getting darker because by multiplying them with a fraction
% less than 1,we are actually turning them to black(zero value) . so that's why the color
% map is darkest copared to others when we use c=02
%% Question 6 
% part a
I=imread('Zootopia.jpg');
G=rgb2gray(I);
imshow(G);
% part b
figure;
subplot(2,2,1), imshow(G,[0 200]);title('N=200');
subplot(2,2,2), imshow(G,[0 150]);title('N=150');
subplot(2,2,3), imshow(G,[0 125]);title('N=125');
subplot(2,2,4), imshow(G,[0 100]);title('N=100');
% from N=125 the image starts to getting distorted and we are missing
% some details because all the pixels over 125 turning out white
%so we miss the details on the white areas.
% part c
figure;
J=imcrop(G,[433.5 37.5 234 198]);
imshow(J)

%part d
figure;
plot(G(180,:))

% part e 
[IND,map] = rgb2ind(I,2);
figure;
imagesc(IND)
colormap(map)
figure;rgbplot(map)
[IND1,map1] = rgb2ind(I,200);
figure;
imagesc(IND1)
colormap(map1)
figure;rgbplot(map1)
% as we increase N , the image is getting visually better and more obvious.
%increasing N gives us an increase in color quantization .
% part f
YIQ = rgb2ntsc(I);
subplot(1,2,1), imshow(I);title('RGB');
subplot(1,2,2), imshow(YIQ);title('YIQ')
%they are not the same.
% part g
redChannel = I(:, :, 1);
figure;subplot(2,2,1), imshow(redChannel), title('REDchannel');
greenChannel = I(:, :, 2);
subplot(2,2,2), imshow(greenChannel), title('GREENchannel');
blueChannel = I(:, :, 3);
subplot(2,2,3), imshow(blueChannel), title('BLUEchannel');
composite_RGB=cat(3,redChannel,greenChannel,blueChannel);
subplot(2,2,4), imshow(composite_RGB), title('composite_RGB');
YChannel = YIQ(:, :, 1);
figure;subplot(2,2,1), imshow(YChannel), title('Ychannel');
IChannel = YIQ(:, :, 2);
subplot(2,2,2), imshow(IChannel), title('Ichannel');
QChannel = YIQ(:, :, 3);
subplot(2,2,3), imshow(QChannel), title('Qchannel');
subplot(2,2,4), imshow(composite_RGB), title('composite_RGB');
%h 
fprintf('The min value of Y is %f and the max is %f \n',min(YChannel(:)),max(YChannel(:)))
fprintf('The min value of I is %f and the max is %f\n',min(IChannel(:)),max(IChannel(:)))
fprintf('The min value of Q is %f and the max is %f\n',min(QChannel(:)),max(QChannel(:)))
%explanation in the the word file
%part i
I2=ntsc2rgb(YIQ);
redChannel2 = I2(:, :, 1);
figure;subplot(2,2,1), imshow(redChannel2), title('REDchannel2');
greenChannel2 = I2(:, :, 2);
subplot(2,2,2), imshow(greenChannel2), title('GREENchannel2');
blueChannel2 = I2(:, :, 3);
subplot(2,2,3), imshow(blueChannel2), title('BLUEchannel2');
composite_RGB2=cat(3,redChannel2,greenChannel2,blueChannel2);
subplot(2,2,4), imshow(composite_RGB2), title('composite_RGB2');
% Both seem pretty much the same just the format of image changed from
% uint8 to double.
% part g 
K = imabsdiff(im2double(I),I2);
max_error=max(K(:));