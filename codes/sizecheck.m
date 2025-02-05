%x:285 41
%y 253 40 

H0 = 41;W0 = 285;

Conv2d = @(H_in,W_in,kernel_size,padding,dilation,stride) deal(floor((H_in+2*padding(1)-dilation(1)*(kernel_size(1)-1)-1)/stride(1)+1),floor((W_in+2*padding(2)-dilation(2)*(kernel_size(2)-1)-1)/stride(2)+1));
Maxpool2d = @(H_in,W_in,kernel_size,padding,dilation,stride) deal(floor((H_in+2*padding(1)-dilation(1)*(kernel_size(1)-1)-1)/stride(1)+1),floor((W_in+2*padding(2)-dilation(2)*(kernel_size(2)-1)-1)/stride(2)+1));
Maxpool2d_ceil = @(H_in,W_in,kernel_size,padding,dilation,stride) deal(ceil((H_in+2*padding(1)-dilation(1)*(kernel_size(1)-1)-1)/stride(1)+1),ceil((W_in+2*padding(2)-dilation(2)*(kernel_size(2)-1)-1)/stride(2)+1));
ConvTranspose2d =  @(H_in,W_in,kernel_size,padding,output_padding,stride) deal((H_in-1)*stride(1)-2*padding(1)+kernel_size(1)+output_padding(1), (W_in-1)*stride(2)-2*padding(2)+kernel_size(2)+output_padding(2));
UpsamplingNearest2d = @(H_in,W_in,scale) deal(floor(H_in*scale(1)),floor(W_in*scale(1)));
%%
% H0 = 28;W0= 28;
% [H1,W1]=Conv2d(H0,W0,[3,3],[1,1],[1,1],[3,3]);
% [H2,W2]=Maxpool2d(H1,W1,[2,2],[0,0],[1,1],[2,2]);
% [H3,W3]=Conv2d(H2,W2,[3,3],[1,1],[1,1],[2,2]);
% [H4,W4]=Maxpool2d(H3,W3,[2,2],[0,0],[1,1],[1,1]);
% 
% [H5,W5]=ConvTranspose2d(H4,W4,[3,3],[0,0],[0,0],[2,2]);
% [H6,W6]=ConvTranspose2d(H5,W5,[5,5],[1,1],[0,0],[3,3]);
% [H7,W7]=ConvTranspose2d(H6,W6,[2,2],[1,1],[0,0],[2,2]);
%%
% H0 = 48;W0= 288;
% [H1,W1]=Conv2d(H0,W0,[3,3],[1,1],[1,1],[1,1]);
% [H2,W2]=Maxpool2d(H1,W1,[2,2],[0,0],[1,1],[2,2]);
% [H3,W3]=Conv2d(H2,W2,[3,3],[1,1],[1,1],[1,1]);
% [H4,W4]=Maxpool2d(H3,W3,[2,2],[0,0],[1,1],[2,2]);
% [H5,W5]=Conv2d(H4,W4,[3,3],[1,1],[1,1],[1,1]);
% [H6,W6]=Maxpool2d(H5,W5,[2,2],[0,0],[1,1],[2,2]);
% [H5,W5]=Conv2d(H6,W6,[3,3],[1,1],[1,1],[1,1]);
% [H7,W7]=Maxpool2d(H6,W6,[2,2],[0,0],[1,1],[2,2]);
% 
% [H8,W8]=UpsamplingNearest2d(H7,W7,2);
% [H9,W9]=ConvTranspose2d(H8,W8,[3,3],[1,1],[0,0],[1,1]);
% [H10,W10]=UpsamplingNearest2d(H9,W9,2);
% [H11,W11]=ConvTranspose2d(H10,W10,[3,3],[1,1],[0,0],[1,1]);
% [H12,W12]=UpsamplingNearest2d(H11,W11,2);
% [H13,W13]=ConvTranspose2d(H12,W12,[3,3],[1,1],[0,0],[1,1]);
% [H14,W14]=UpsamplingNearest2d(H13,W13,2);
% [H15,W15]=ConvTranspose2d(H14,W14,[3,3],[1,1],[0,0],[1,1]);
%%
H0 = 48;W0= 288;
[H1,W1]=Conv2d(H0,W0,[3,3],[1,1],[1,1],[1,1]);
[H2,W2]=Conv2d(H1,W1,[3,3],[1,1],[1,1],[1,1]);
[H3,W3]=Conv2d(H2,W2,[2,2],[0,0],[1,1],[2,2]);

[H4,W4]=Conv2d(H3,W3,[3,3],[1,1],[1,1],[1,1]);
[H5,W5]=Conv2d(H4,W4,[3,3],[1,1],[1,1],[1,1]);
[H6,W6]=Conv2d(H5,W5,[2,2],[0,0],[1,1],[2,2]);

[H7,W7]=Conv2d(H6,W6,[3,3],[1,1],[1,1],[1,1]);
[H8,W8]=Conv2d(H7,W7,[3,3],[1,1],[1,1],[1,1]);
[H9,W9]=Conv2d(H8,W8,[2,2],[0,0],[1,1],[2,2]);

[H10,W10]=ConvTranspose2d(H9,W9,[3,3],[1,1],[0,0],[1,1]);
[H11,W11]=ConvTranspose2d(H10,W10,[3,3],[1,1],[0,0],[1,1]);
[H12,W12]=ConvTranspose2d(H11,W11,[2,2],[0,0],[0,0],[2,2]);

[H13,W13]=ConvTranspose2d(H12,W12,[3,3],[1,1],[0,0],[1,1]);
[H14,W14]=ConvTranspose2d(H13,W13,[3,3],[1,1],[0,0],[1,1]);
[H15,W15]=ConvTranspose2d(H14,W14,[2,2],[0,0],[0,0],[2,2]);

[H16,W16]=ConvTranspose2d(H15,W15,[3,3],[1,1],[0,0],[1,1]);
[H17,W17]=ConvTranspose2d(H16,W16,[3,3],[1,1],[0,0],[1,1]);
[H18,W18]=ConvTranspose2d(H17,W17,[2,2],[0,0],[0,0],[2,2]);

%%
% [H1,W1]=Conv2d(H0,W0,[3,3],[1,1],[1,1],[3,3]);
% [H2,W2]=Maxpool2d(H1,W1,[2,2],[0,0],[1,1],[2,2]);
% [H3,W3]=Conv2d(H2,W2,[3,3],[1,1],[1,1],[2,2]);
% [H4,W4]=Maxpool2d(H3,W3,[2,2],[0,0],[1,1],[1,1]);
% 
% [H5,W5]=ConvTranspose2d(H4,W4,[2,2],[1,1],[0,0],[2,1]);
% [H6,W6]=ConvTranspose2d(H5,W5,[3,3],[1,1],[0,0],[2,2]);
% [H7,W7]=UpsamplingNearest2d(H6,W6,2);
% [H8,W8]=ConvTranspose2d(H7,W7,[3,2],[1,2],[0,0],[3,3]);
%%
% Conv1
% [H1,W1]=Conv2d(H0,W0,[3,3],[1,1],[1,1],[1,1]);
% [H2,W2]=Conv2d(H1,W1,[3,3],[1,1],[1,1],[1,1]);
% [H3,W3]=Maxpool2d(H2,W2,[2,2],[0,0],[1,1],[2,2]);
% Conv2
% [H4,W4]=Conv2d(H3,W3,[3,3],[1,1],[1,1],[1,1]);
% [H5,W5]=Conv2d(H4,W4,[3,3],[1,1],[1,1],[1,1]);
% [H6,W6]=Maxpool2d(H5,W5,[2,2],[0,0],[1,1],[2,2]);
% 
% [H7,W7]=ConvTranspose2d(H6,W6,[3,2],[1,2],[0,0],[2,1]);
% [H8,W8]=ConvTranspose2d(H7,W7,[3,3],[1,2],[0,0],[2,1]);
% [H9,W9]=ConvTranspose2d(H8,W8,[3,3],[1,2],[0,0],[1,1]);
% [H10,W10]=ConvTranspose2d(H9,W9,[4,3],[1,1],[0,0],[1,2]);
% [H11,W11]=ConvTranspose2d(H10,W10,[5,3],[1,1],[0,0],[1,2]);
%%
% H0 = 48;W0= 288;
% %Conv1
% [H1,W1]=Conv2d(H0,W0,[3,3],[1,1],[1,1],[1,1]);
% [H2,W2]=Conv2d(H1,W1,[3,3],[1,1],[1,1],[1,1]);
% [H3,W3]=Conv2d(H2,W2,[3,3],[1,1],[1,1],[2,2]);
% 
% %Conv2
% [H4,W4]=Conv2d(H3,W3,[3,3],[1,1],[1,1],[1,1]);
% [H5,W5]=Conv2d(H4,W4,[3,3],[1,1],[1,1],[1,1]);
% [H6,W6]=Conv2d(H5,W5,[3,3],[1,1],[1,1],[2,2]);
% 
% %Conv3
% [H7,W7]=Conv2d(H6,W6,[3,3],[1,1],[1,1],[1,1]);
% [H8,W8]=Conv2d(H7,W7,[3,3],[1,1],[1,1],[1,1]);
% [H9,W9]=Conv2d(H8,W8,[3,3],[1,1],[1,1],[1,1]);
% [H10,W10]=Conv2d(H9,W9,[3,3],[1,1],[1,1],[2,2]);
% 
% %Conv4
% [H11,W11]=Conv2d(H10,W10,[3,3],[1,1],[1,1],[1,1]);
% [H12,W12]=Conv2d(H11,W11,[3,3],[1,1],[1,1],[1,1]);
% [H13,W13]=Conv2d(H12,W12,[3,3],[1,1],[1,1],[1,1]);
% [H14,W14]=Conv2d(H13,W13,[3,3],[1,1],[1,1],[2,2]);
% 
% %FC5
% [H15,W15]=Conv2d(H14,W14,[1,1],[0,0],[1,1],[1,1]);
% 
% %DConv6
% [H16,W16]=ConvTranspose2d(H15,W15,[2,2],[0,0],[0,0],[2,2]);
% [H17,W17]=ConvTranspose2d(H16,W16,[3,3],[1,1],[0,0],[1,1]);
% [H18,W18]=ConvTranspose2d(H17,W17,[3,3],[1,1],[0,0],[1,1]);
% [H19,W19]=ConvTranspose2d(H18,W18,[3,3],[1,1],[0,0],[1,1]);
% 
% %DConv7
% [H20,W20]=ConvTranspose2d(H19,W19,[2,2],[0,0],[0,0],[2,2]);
% [H21,W21]=ConvTranspose2d(H20,W20,[3,3],[1,1],[0,0],[1,1]);
% [H22,W22]=ConvTranspose2d(H21,W21,[3,3],[1,1],[0,0],[1,1]);
% [H23,W23]=ConvTranspose2d(H22,W22,[3,3],[1,1],[0,0],[1,1]);
% 
% %DConv8
% [H24,W24]=ConvTranspose2d(H23,W23,[2,2],[0,0],[0,0],[2,2]);
% [H25,W25]=ConvTranspose2d(H24,W24,[3,3],[1,1],[0,0],[1,1]);
% [H26,W26]=ConvTranspose2d(H25,W25,[3,3],[1,1],[0,0],[1,1]);
% [H27,W27]=ConvTranspose2d(H26,W26,[3,3],[1,1],[0,0],[1,1]);
% 
% %DConv9
% [H28,W28]=ConvTranspose2d(H27,W27,[2,2],[0,0],[0,0],[2,2]);
% [H29,W29]=ConvTranspose2d(H28,W28,[3,3],[1,1],[0,0],[1,1]);
% [H30,W30]=ConvTranspose2d(H29,W29,[3,3],[1,1],[0,0],[1,1]);
% [H31,W31]=ConvTranspose2d(H30,W30,[3,3],[1,1],[0,0],[1,1]);

%%
% %Conv1
% [H1,W1]=Conv2d(H0,W0,[3,3],[1,1],[1,1],[1,1]);
% [H2,W2]=Conv2d(H1,W1,[3,3],[1,1],[1,1],[1,1]);
% [H3,W3]=Maxpool2d(H2,W2,[2,2],[0,0],[1,1],[2,2]);
% %Conv2
% [H4,W4]=Conv2d(H3,W3,[3,3],[1,1],[1,1],[1,1]);
% [H5,W5]=Conv2d(H4,W4,[3,3],[1,1],[1,1],[1,1]);
% [H6,W6]=Maxpool2d(H5,W5,[2,2],[0,0],[1,1],[2,2]);
% %Conv3
% [H7,W7]=Conv2d(H6,W6,[3,3],[1,1],[1,1],[1,1]);
% [H8,W8]=Conv2d(H7,W7,[3,3],[1,1],[1,1],[1,1]);
% [H9,W9]=Conv2d(H8,W8,[3,3],[1,1],[1,1],[1,1]);
% [H10,W10]=Maxpool2d(H9,W9,[2,2],[0,0],[1,1],[1,2]);
% %Conv4
% [H11,W11]=Conv2d(H10,W10,[3,3],[1,1],[1,1],[1,1]);
% [H12,W12]=Conv2d(H11,W11,[3,3],[1,1],[1,1],[1,1]);
% [H13,W13]=Conv2d(H12,W12,[3,3],[1,1],[1,1],[1,1]);
% [H14,W14]=Maxpool2d(H13,W13,[2,2],[0,0],[1,1],[1,2]);
% %Conv5
% [H15,W15]=Conv2d(H14,W14,[3,3],[1,1],[1,1],[1,1]);
% [H16,W16]=Conv2d(H15,W15,[3,3],[1,1],[1,1],[1,1]);
% [H17,W17]=Conv2d(H16,W16,[3,3],[1,1],[1,1],[1,1]);
% [H18,W18]=Maxpool2d(H17,W17,[2,2],[0,0],[1,1],[1,1]);
% %FC6
% [H19,W19]=Conv2d(H18,W18,[5,5],[0,0],[1,1],[1,1]);
% [H20,W20]=Conv2d(H19,W19,[1,1],[0,0],[1,1],[1,1]);
% %DConv7
% [H21,W21]=ConvTranspose2d(H20,W20,[3,4],[0,0],[0,0],[2,1]);
% [H22,W22]=ConvTranspose2d(H21,W21,[2,2],[0,0],[0,0],[2,2]);
% [H23,W23]=ConvTranspose2d(H22,W22,[3,2],[0,0],[0,0],[2,2]);
% [H24,W24]=ConvTranspose2d(H23,W23,[12,17],[0,0],[0,0],[1,4]);