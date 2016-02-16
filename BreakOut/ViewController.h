//
//  ViewController.h
//  BreakOut
//
//  Created by Pranav Bhandari on 2/11/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollisionBehaviorDelegate>


@property (strong, nonatomic) UILabel *brick;
@property (nonatomic, strong) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UIButton *NewGame;
@property (strong, nonatomic) UILabel *nameB;
@property (strong, nonatomic) UILabel *nameR;
@property (strong, nonatomic) UILabel *nameE;
@property (strong, nonatomic) UILabel *nameA;
@property (strong, nonatomic) UILabel *nameK;
@property (strong, nonatomic) UILabel *nameO;
@end

