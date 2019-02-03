//
//  OpenCVWrapper.h
//  SpineAlign
//
//  Created by James Wang on 2/3/19.
//  Copyright © 2019 Havi Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject
+ (NSString *)openCVVersionString;
+ (UIImage *)imageProcessing:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
