//
//  NewGameViewController.h
//  BreakOut
//
//  Created by Pranav Bhandari on 2/11/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewGameViewController : UIViewController{
    float dx, dy;  // Ball motion
}
@property (nonatomic, strong) UIView *paddle;
@property (nonatomic, strong) UIView *ball;
@property (nonatomic, strong) NSTimer *timer;
@property(nonatomic,strong) UILabel *brick,*brick2,*brick3,*brick4,*brick5,*brick6,*brick7;
@property(nonatomic,strong) NSMutableArray *bricks;
@property (strong, nonatomic) UILabel *WelcomeMsg;

@end
