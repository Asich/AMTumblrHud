//
// Created by Mustafin Askar on 22/05/2014.
// Copyright (c) 2014 Asich. All rights reserved.
//


#import "ViewController.h"
#import "AMTumblrHud.h"

#define UIColorFromRGB(rgbValue) [UIColor \
       colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
       green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
       blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation ViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColorFromRGB(0x34465C);

    AMTumblrHud *tumblrHUD = [[AMTumblrHud alloc] initWithFrame:CGRectMake((CGFloat) ((self.view.frame.size.width - 55) * 0.5),
            (CGFloat) ((self.view.frame.size.height - 20) * 0.5), 55, 20)];
    tumblrHUD.hudColor = UIColorFromRGB(0xF1F2F3);
    [self.view addSubview:tumblrHUD];

    [tumblrHUD showAnimated:YES];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end