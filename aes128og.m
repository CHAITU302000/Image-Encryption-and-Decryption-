clc
clear all
close all
state=zeros(4,4);
%hex = [0xea 0x04 0x65 0x85; 0x83 0x45 0x5d 0x96; 0x5c 0x33 0x98 0xb0; 0xf0 0x2d 0xad 0xc5];
img = imread('smile.jpg');
img=uint8(img)
im_size=size(img);
plane_img = img;
img=reshape(img, 1, []);
total_pixels=numel(img);
rem=mod(total_pixels,16);
if rem~=0
    img=[img zeros(1, 16-rem)];
    total_pixels=numel(img);
end
encripted=zeros(1, total_pixels);
plane_image=zeros(1, total_pixels);

for l=1:16:total_pixels-15
hex=img(l:l+15);
hex=reshape(hex,4,4);
state=uint8(hex);
%key = [0x73 0x73 0x69 0x72; 0x61 0x68 0x73 0x69; 0x74 0x63 0x62 0x6e; 0x69 0x6a 0x6f 0x67] ;
key = [73 73 69 72; 61 68 73 69; 74 63 64 68; 69 61 63 65] ;
key=uint8(key);
key=expansion(key);
% for i=1:4
%      for j=1:4
%          state(i,j)=uint8((bitxor(state(i,j),key(i,j))));
%      end
% end
state=bitxor(uint8(state),key(:,1:4));
state=uint8(state);

for k=2:10
     state = (sub_bytes(state));
     state = (left_shift(state));
     state=Mix_Columns(state);
     state=bitxor(uint8(state),key(:,4*(k-1)+1:4*k));
end
state = (sub_bytes(state));
state=(left_shift(state));
state=bitxor(uint8(state),key(:,4*(11-1)+1:4*11));
state1=reshape(state, 1,[]);
encripted(l:l+15)=state1;

%cipher text is generated

%%Decryption starts
state=bitxor(uint8(state),key(:,4*(11-1)+1:4*11));

%decryption in the blocks
 for k=10:-1:2
    state=(right_shift(state));
    state=(inv_sub_bytes(state));
    state=bitxor(uint8(state),key(:,4*(k-1)+1:4*k));
    state=(inv_Mix_columns(state));
    
 end
state=(right_shift(state));
state=(inv_sub_bytes(state));
state=bitxor(uint8(state),key(:,1:4));
state=reshape(state, 1,[]);
plane_image(l:l+15)=state;


end

img(end-15+rem:end)=[];
img=reshape(img,im_size);

encripted(end-15+rem:end)=[];
encripted=uint8(encripted);
encripted=reshape(encripted,im_size);

plane_image(end-15+rem:end)=[];
plane_image=uint8(plane_image);
plane_image=reshape(plane_image,im_size);

%plotting the input image
%plotting the encrypted image
%plotting the decrypted image

% the results for the above shown plots are displayed here



figure,
subplot(3,1,1);
imshow(img);
title('Original Image');

subplot(3,1,2);
imshow(encripted);
title('AES Encrypted Image');

subplot(3,1,3);
imshow(plane_img);
title('AES Decrypted Image');
