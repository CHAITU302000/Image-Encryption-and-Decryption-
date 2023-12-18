clc
clear all
close all
hex = [0xea 0x04 0x65 0x85; 0x83 0x45 0x5d 0x96; 0x5c 0x33 0x98 0xb0; 0xf0 0x2d 0xad 0xc5] ;
hex=uint8(hex);
%class of hex is uint8
S_box = [    99 124 119 123 242 107 111 197 48 1 103 43 254 215 171 118;    202 130 201 125 250 89 71 240 173 212 162 175 156 164 114 192;    183 253 147 38 54 63 247 204 52 165 229 241 113 216 49 21;    4 199 35 195 24 150 5 154 7 18 128 226 235 39 178 117;    9 131 44 26 27 110 90 160 82 59 214 179 41 227 47 132;    83 209 0 237 32 252 177 91 106 203 190 57 74 76 88 207;    208 239 170 251 67 77 51 133 69 249 2 127 80 60 159 168;    81 163 64 143 146 157 56 245 188 182 218 33 16 255 243 210;    205 12 19 236 95 151 68 23 196 167 126 61 100 93 25 115;    96 129 79 220 34 42 144 136 70 238 184 20 222 94 11 219;    224 50 58 10 73 6 36 92 194 211 172 98 145 149 228 121;    231 200 55 109 141 213 78 169 108 86 244 234 101 122 174 8;    186 120 37 46 28 166 180 198 232 221 116 31 75 189 139 138;    112 62 181 102 72 3 246 14 97 53 87 185 134 193 29 158;    225 248 152 17 105 217 142 148 155 30 135 233 206 85 40 223;    140 161 137 13 191 230 66 104 65 153 45 15 176 84 187 22];
for i=1:4
    for j=1:4
         row=uint8(bitsra(hex(i,j),4))+1;
         col=uint8(mod(hex(i,j),16))+1;
         hex(i,j)=((S_box(row,col)));
    end
end
hex1=dec2hex(hex);
%hex1=dec2hex(hex)

hex(2,:)=circshift(hex(2,:),[0 -1]);
hex(3,:)=circshift(hex(3,:),[0 -2]);
hex(4,:)=circshift(hex(4,:),[0 -3]);
hex2=dec2hex(hex);
state=uint8(hex);
%state1=dec2hex(state)
State=state;
for a=1:4
    State(1,a)=bitxor(bitxor(bitxor(xtime(state(1,a),2),xtime(state(2,a),3)),state(3,a)),state(4,a));
    State(2,a)=bitxor(bitxor(bitxor(xtime(state(1,a),1),xtime(state(2,a),2)),xtime(state(3,a),3)),state(4,a));
    State(3,a)=bitxor(bitxor(bitxor(xtime(state(1,a),1),xtime(state(2,a),1)),xtime(state(3,a),2)),xtime(state(4,a),3));
    State(4,a)=bitxor(bitxor(bitxor(xtime(state(1,a),3),xtime(state(2,a),1)),state(3,a)),xtime(state(4,a),2));
end
   State;
   State=dec2hex(State)
   state=State;



