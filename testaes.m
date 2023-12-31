clc
clear all
close all
state=zeros(4,4);
%hex = [0x87 0xf2 0x4d 0x97; 0x6e 0x4c 0x90 0xec; 0x46 0xe7 0x4a 0xc3; 0xa6 0x2d 0xad 0xc5] ;
hex = [0xea 0x04 0x65 0x85; 0x83 0x45 0x5d 0x96; 0x5c 0x33 0x98 0xb0; 0xf0 0x2d 0xad 0xc5] ;
key = [0x11 0x22 0x33 0x44; 0x55 0x66 0x77 0x88; 0x99 0xaa 0xbb 0xcc; 0xdd 0xee 0xff 0x11] ;
state=uint8(hex);
state = (sub_bytes(state));
state = (left_shift(state));
state=Mix_Columns(state);
state=bitxor(uint8(state),key(:,1:4));
state=bitxor(uint8(state),key(:,1:4));
state=(inv_Mix_columns(state));
state=(right_shift(state));
state=(inv_sub_bytes(state));

state=reshape(state,4,4)
dec2hex(state)