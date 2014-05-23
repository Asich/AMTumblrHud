//
// Created by Mustafin Askar on 22/05/2014.
// Copyright (c) 2014 Asich. All rights reserved.
//


#import "ViewController.h"
#import "AMTumblrHud.h"


@implementation ViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor darkGrayColor];

    AMTumblrHud *tumblrHUD = [[AMTumblrHud alloc] initWithFrame:CGRectMake((CGFloat) ((self.view.frame.size.width - 55) * 0.5),
            (CGFloat) ((self.view.frame.size.height - 20) * 0.5), 55, 20)];
    tumblrHUD.hudColor = [UIColor magentaColor];
    [tumblrHUD showAnimated:YES];
    [self.view addSubview:tumblrHUD];

}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end