import torch
from torch import nn




class autoencoder(nn.Module):
    def __init__(self):
        super(autoencoder, self).__init__()
        self.encoder = nn.Sequential(
            # datasize, channelsize, height, width
            # b, 1, 41, 285 
            nn.Conv2d(in_channels=1, out_channels=64, kernel_size=3, stride=3, padding=1),  # b, 16, 14, 95
            nn.ReLU(True),
            nn.MaxPool2d(kernel_size=2, stride=2),  # b, 16, 7, 47
            nn.Conv2d(in_channels=64, out_channels=128, kernel_size=3, stride=2, padding=1),  # b, 8, 4, 24
            nn.ReLU(True),
            nn.MaxPool2d(kernel_size=2, stride=1)  # b, 8, 3, 23
        )
        self.decoder = nn.Sequential(
            # datasize, channelsize, height, width
            # b, 8, 3, 23
            nn.ConvTranspose2d(in_channels=128, out_channels=128, kernel_size=2, stride=(2,1), padding=1),  # b, 16, 4, 22
            nn.ReLU(True),
            nn.ConvTranspose2d(in_channels=128, out_channels=64, kernel_size=3, stride=2, padding=1),  # b, 16, 7, 43
            nn.ReLU(True),
            nn.Upsample(scale_factor=2),  # b, 16, 14, 86
            nn.ConvTranspose2d(in_channels=64, out_channels=1, kernel_size=(3,2), stride=3, padding=(1,2)),  # b, 1, 40, 253
        )

    def forward(self, x):
        x = self.encoder(x)
        x = self.decoder(x)
        return x
        
        
        
class fcn(nn.Module):
    def __init__(self):
        super(fcn, self).__init__()
        self.Conv1 = nn.Sequential(
            nn.Conv2d(in_channels=1, out_channels=64, kernel_size=3, stride=1, padding=100), 
            nn.ReLU(True),
            nn.Conv2d(in_channels=64, out_channels=64, kernel_size=3, stride=1, padding=1),  
            nn.ReLU(True),
            nn.MaxPool2d(kernel_size=2, stride=2)  
        )
        self.Conv2 = nn.Sequential(
            nn.Conv2d(in_channels=64, out_channels=128, kernel_size=3, stride=1, padding=1),  
            nn.ReLU(True),
            nn.Conv2d(in_channels=128, out_channels=128, kernel_size=3, stride=1, padding=1),  
            nn.ReLU(True),
            nn.MaxPool2d(kernel_size=2, stride=2)  
        )
        self.Conv3 = nn.Sequential(
            nn.Conv2d(in_channels=128, out_channels=256, kernel_size=3, stride=1, padding=1),  
            nn.ReLU(True),
            nn.Conv2d(in_channels=256, out_channels=256, kernel_size=3, stride=1, padding=1), 
            nn.ReLU(True),
            nn.Conv2d(in_channels=256, out_channels=256, kernel_size=3, stride=1, padding=1), 
            nn.ReLU(True),
            nn.MaxPool2d(kernel_size=2, stride=2)
        )
        self.Conv4 = nn.Sequential(
            nn.Conv2d(in_channels=256, out_channels=512, kernel_size=3, stride=1, padding=1),  
            nn.ReLU(True),
            nn.Conv2d(in_channels=512, out_channels=512, kernel_size=3, stride=1, padding=1), 
            nn.ReLU(True),
            nn.Conv2d(in_channels=512, out_channels=512, kernel_size=3, stride=1, padding=1),  
            nn.ReLU(True),
            nn.MaxPool2d(kernel_size=2, stride=2) 
        )
        self.Conv5 = nn.Sequential(
            nn.Conv2d(in_channels=512, out_channels=512, kernel_size=3, stride=1, padding=1), 
            nn.ReLU(True),
            nn.Conv2d(in_channels=512, out_channels=512, kernel_size=3, stride=1, padding=1), 
            nn.ReLU(True),
            nn.Conv2d(in_channels=512, out_channels=512, kernel_size=3, stride=1, padding=1), 
            nn.ReLU(True),
            nn.MaxPool2d(kernel_size=2, stride=2) 
        )
        self.FC6 = nn.Sequential(
            nn.Conv2d(in_channels=512, out_channels=4096, kernel_size=5),  
            nn.ReLU(True),
            nn.Dropout2d(),
            nn.Conv2d(in_channels=4096, out_channels=4096, kernel_size=1),  
            nn.ReLU(True),
            nn.Dropout2d()
        )
        self.DConv7 = nn.Sequential(
            nn.ConvTranspose2d(in_channels=4096, out_channels=512, kernel_size=(3,5), stride=(2,1), padding=0), 
            nn.ReLU(True),
            nn.ConvTranspose2d(in_channels=512, out_channels=256, kernel_size=2, stride=2, padding=0),  
            nn.ReLU(True),
            nn.ConvTranspose2d(in_channels=256, out_channels=128, kernel_size=(3,2), stride=2, padding=0), 
            nn.ReLU(True),
            nn.ConvTranspose2d(in_channels=128, out_channels=1, kernel_size=(12,17), stride=(1,4), padding=0),  
        )
    def forward(self, x):
        x = self.Conv1(x)
        x = self.Conv2(x)
        x = self.Conv3(x)
        x = self.Conv4(x)
        x = self.Conv5(x)
        x = self.FC6(x)
        x = self.DConv7(x)
        return x