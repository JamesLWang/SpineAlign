# SpineAlign

SpineAligns aims to diagnosis scoliosis through using gyroscopic data and computer vision systems on iOS devices. This effectively reduces the cost of diagnosing scoliosis and exponentially increases its accessibility. Specifically, this application uses curve detection and shoulder imaging to determine a patient's degree of scoliosis. 

Curve detection uses real-time gyroscopic data on an iOS device while it is run along a patient's spine. As the device is run through the patient's spine, concavities caused by scoliosis are detected as an unleved surface on the y-axis. 

Shoulder imaging uses the OpenCV library to pre-process photos of patients' shoulders for analysis of imbalance. Imbalance is detected through locating points on the shoulders equidistant from a point on the line that runs across the patient's vertical center. 

## Installation

Download this repository. 

```bash
git clone https://github.com/JamesLWang/SpineAlign.git
```
## Usage

To build this application, the opencv.framework file must be imported into the workspace. This file can be found [here](https://sourceforge.net/projects/opencvlibrary/files/4.0.1/opencv-4.0.1-ios-framework.zip/download). Add this into the repository's root directory. 


## Credits
Created by Luvena Huo, Havi Nguyen, Annie Sui, and James Wang at DevFest 2019. 
Columbia University in the City of New York

## License
The MIT License

Copyright (c) 2019 Luvena Huo, Havi Nguyen, Annie Sui, James Wang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]></content>
