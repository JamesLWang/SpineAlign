//
//  OpenCVWrapper.m
//  SpineAlign
//
//  Created by James Wang on 2/3/19.
//  Copyright © 2019 Havi Nguyen. All rights reserved.
//
#import <opencv2/opencv.hpp>
#import "OpenCVWrapper.h"
#import <opencv2/imgcodecs/ios.h>

@implementation OpenCVWrapper

+ (NSString *)openCVVersionString {
    return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
}

+ (UIImage *)imageProcessing:(UIImage*)image{
    cv::Mat imageMat;
    UIImageToMat(image, imageMat);
    cv::Mat grayMat;
    cv::cvtColor(imageMat, grayMat, cv::COLOR_BGR2GRAY);
    cv::Canny(grayMat,grayMat,100,200);
    std::cout << "Width : " << grayMat.size().width << std::endl;
    std::cout << "Height: " << grayMat.size().height << std::endl;
    cv::Mat left(grayMat, cv::Rect(0, 0, 400, 1080));
    cv::Mat right(grayMat, cv::Rect(1520, 0, 400, 1080));
    std::cout << "Width : " << left.size().width << std::endl;
    std::cout << "Height: " << left.size().height << std::endl;
    std::cout << "Width : " << right.size().width << std::endl;
    std::cout << "Height: " << right.size().height << std::endl;
    
    int percent;
    int l = 1;
    int lf = 0;
    int r = 1;
    int rf = 0;
    
    std::cout << "Running... " <<std::endl ;
    
    while(l < (left.size().height-40)){
        std::cout << "c";
        std::cout << left.at<int>(l,390);
        if(left.at<int>(l,390) > 120){
            std::cout << l;
            break;
        }
        l++;
    }
    
    while(r < (right.size().height-40)){
        std::cout << "d";
        if(right.at<int>(r,10) > 120){
            std::cout << rf;
            break;
        }
        r++;
    }
    
    std::cout << "L: "<< l << std::endl;
    std::cout << "R: "<< r << std::endl;
    
    if(l > r){
        int traversal= (left.size().height) - r;
        percent = double(100 * abs(l-r) / traversal);
        
    }
    else{
        int traversal= (right.size().height) - l;
        percent = double(100 * abs(l-r) / traversal);
    }
    
    std::cout << 12 << "%" << std::endl;
    
   return MatToUIImage(grayMat) ;
    //return percent;
    

}

@end
