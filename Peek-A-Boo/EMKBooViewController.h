//
//  EMKBooViewController.h
//  BooHoo_iPhone
//
//  Created by Erik on 15.06.13.
//  Copyright (c) 2013 Kalaxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMKBooViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) UIImageView *booImageView;

@property (strong, nonatomic) AVCaptureSession *session;
@property (strong, nonatomic) AVCaptureMetadataOutput *metadataOutput;

@end
