//
//  EMKBooViewController.m
//  BooHoo_iPhone
//
//  Created by Erik on 15.06.13.
//  Copyright (c) 2013 Kalaxy. All rights reserved.
//

#import "EMKBooViewController.h"

@interface EMKBooViewController ()

@end

@implementation EMKBooViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _booImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"boo"]];
        _booImageView.alpha = 0.0;
        _booImageView.frame = CGRectMake(101, 101, 117, 114);
        [self.view addSubview:_booImageView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [UIView animateWithDuration:2.5
                          delay:1.5
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         _booImageView.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                          [self setupAVCaptureSession];
                     }
     ];
}

- (void)setupAVCaptureSession
{
    _session = [[AVCaptureSession alloc] init];
    _session.sessionPreset = AVCaptureSessionPresetPhoto;

    NSError *error;

    NSArray *availableDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    AVCaptureDevice *chosenDevice;
    for(AVCaptureDevice *device in availableDevices){
        if([device position] == AVCaptureDevicePositionFront){
            chosenDevice = device;
            break;
        }
        chosenDevice = device;
    }

    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:chosenDevice error:&error];
    [_session addInput:input];

    _metadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [[_metadataOutput connectionWithMediaType:AVMediaTypeMetadata] setEnabled:YES];
    [_session addOutput:_metadataOutput];

    _metadataOutput.metadataObjectTypes = @[AVMetadataObjectTypeFace];

    [_session startRunning];
}

-(void) captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)faces fromConnection:(AVCaptureConnection *)connection
{
    if([faces count] != 0)
    {
        [self hideBoo];
    }else{
        [self showBoo];
    }
}

-(void)hideBoo
{
    _booImageView.image = [UIImage imageNamed:@"shy_boo"];
    [UIView animateWithDuration:0.5
                     animations:^{
                         _booImageView.alpha = 0.5;
                     }
     ];
}

-(void)showBoo
{
    _booImageView.image = [UIImage imageNamed:@"boo"];
    [UIView animateWithDuration:0.4
                     animations:^{
                         _booImageView.alpha = 1.0;
                     }
     ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
