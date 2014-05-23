//
// Created by Mustafin Askar on 22/05/2014.
// Copyright (c) 2014 Asich. All rights reserved.
//

#import "AMTumblrHud.h"

#define kTumblrHudViewWidth 55
#define kTumblrHudViewHeight 20
#define kShowHideAnimateDuration 0.2


static AMTumblrHud *_sharedInstance = nil;

@implementation AMTumblrHud {
    NSMutableArray *hudCubes;

}


+(AMTumblrHud *)sharedInstance {
    if(!_sharedInstance) {
        _sharedInstance = [[AMTumblrHud alloc] initWithFrame:CGRectMake(0, 0, kTumblrHudViewWidth, kTumblrHudViewHeight)];
    }
    return _sharedInstance;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
        self.userInteractionEnabled = NO;
        self.alpha = 0;
    }
    return self;
}

#pragma mark - config UI

- (void)configUI {
    self.backgroundColor = [UIColor clearColor];

    UIView *q1 = [self drawCubeAtPosition:CGPointMake(0, 0)];
    UIView *q2 = [self drawCubeAtPosition:CGPointMake(20, 0)];
    UIView *q3 = [self drawCubeAtPosition:CGPointMake(40, 0)];

    [self addSubview:q1];
    [self addSubview:q2];
    [self addSubview:q3];

    [self animateInQueueQuads:@[q1, q2, q3]];
}

#pragma mark - animation

- (void)animateInQueueQuads:(NSArray *)quads {
    __weak typeof(self) wSelf = self;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.25 * 0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [wSelf animateCube:quads[0] withDuration:0.25];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.25 * 0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [wSelf animateCube:quads[1] withDuration:0.2];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.2 * 0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [wSelf animateCube:quads[2] withDuration:0.15];
            });
        });
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animateInQueueQuads:quads];
    });
}

- (void)animateCube:(UIView *)cube withDuration:(NSTimeInterval)duration {
    [cube setAutoresizingMask:UIViewAutoresizingFlexibleHeight];

    [UIView animateWithDuration:duration
                     animations:^{
                         cube.alpha = 1;
                         cube.transform = CGAffineTransformMakeScale(1, 1.3);
                     } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration
                         animations:^{
                             cube.alpha = 0.5;
                             cube.transform = CGAffineTransformMakeScale(1, 1);
                         } completion:^(BOOL f) {
        }];
    }];
}

#pragma mark - drawing

- (UIView *)drawCubeAtPosition:(CGPoint)positionPoint {
    UIView *quad = [[UIView alloc] init];
    CGRect quadFrame;
    quadFrame.size.width = 15;
    quadFrame.size.height = 16.5;
    quadFrame.origin.x = positionPoint.x;
    quadFrame.origin.y = 0;
    quad.frame = quadFrame;
    quad.backgroundColor = [UIColor redColor];
    quad.alpha = 0.5;
    quad.layer.cornerRadius = 3;

    if (hudCubes == nil) {
        hudCubes = [[NSMutableArray alloc] init];
    }
    [hudCubes addObject:quad];

    return quad;
}

#pragma mark - Setters

- (void)setHudColor:(UIColor *)hudColor {
    for (UIView *cubes in hudCubes) {
        cubes.backgroundColor = hudColor;
    }
}

#pragma mark -
#pragma mark - show / hide

+(void)hide {
    if(_sharedInstance) {
        [UIView animateWithDuration:kShowHideAnimateDuration animations:^{
            _sharedInstance.alpha = 0;
        } completion:^(BOOL finished) {
            [_sharedInstance removeFromSuperview];
            _sharedInstance = nil;
        }];
    }
}

-(void)showAnimated:(BOOL)animated {
    if(animated) {
        [UIView animateWithDuration:kShowHideAnimateDuration animations:^{
            self.alpha = 1;
        }];
    } else {
        self.alpha = 1;
    }
}

- (void)dealloc {
    hudCubes = nil;
}

@end