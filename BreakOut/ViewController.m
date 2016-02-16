//
//  ViewController.m
//  BreakOut
//
//  Created by Pranav Bhandari on 2/11/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>;

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UIView *orangeBall;
@end

@implementation ViewController
@synthesize brick,NewGame,nameB,timer,nameR,nameA,nameE,nameK,nameO;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [nameB setHidden:TRUE];
    [nameR setHidden:TRUE];
    [nameE setHidden:TRUE];
    [nameA setHidden:TRUE];
    [nameK setHidden:TRUE];
    [nameO setHidden:TRUE];
    
    [UIView beginAnimations:@"bucketsOff" context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    //position off screen
    [NewGame setCenter:CGPointMake(200, 377)];
    [UIView setAnimationDidStopSelector:@selector(finishAnimation:finished:context:)];
    //animate off screen
    [UIView commitAnimations];
    NewGame.titleLabel.font= [UIFont fontWithName:@"chalkduster" size:20.0f];
    
 
    
    
    self.orangeBall = [[UIView alloc] initWithFrame:CGRectMake(200.0, 100.0, 50.0, 50.0)];
    self.orangeBall.backgroundColor = [UIColor orangeColor];
    self.orangeBall.layer.cornerRadius = 25.0;
    self.orangeBall.layer.borderColor = [UIColor blackColor].CGColor;
    self.orangeBall.layer.borderWidth = 0.0;
    [self.view addSubview:self.orangeBall];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(targetMethod:)
                                   userInfo:nil
                                    repeats:YES];
    
    // Initialize the animator.
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
     [self demoGravity];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)demoGravity{
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.orangeBall]];
    
    [self.animator addBehavior:gravityBehavior];
    gravityBehavior.action = ^{
        NSLog(@"%f", self.orangeBall.center.y);
    };
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.orangeBall, brick]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [collisionBehavior addBoundaryWithIdentifier:@"tabbar"
                                       fromPoint:self.tabBarController.tabBar.frame.origin
                                         toPoint:CGPointMake(self.tabBarController.tabBar.frame.origin.x + self.tabBarController.tabBar.frame.size.width, self.tabBarController.tabBar.frame.origin.y)];
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    collisionBehavior.collisionDelegate = self;
    [self.animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = self;
    
    
    
    UIDynamicItemBehavior *ballBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.orangeBall]];
    ballBehavior.elasticity = 0.75;
    //ballBehavior.resistance = 0.0;
    //ballBehavior.friction = 0.0;
    ballBehavior.allowsRotation = NO;
    [self.animator addBehavior:ballBehavior];
    
    UIDynamicItemBehavior *obstacles1And2Behavior = [[UIDynamicItemBehavior alloc] initWithItems:@[brick]];
    obstacles1And2Behavior.allowsRotation = NO;
    obstacles1And2Behavior.density = 100000.0;
    
    [self.animator addBehavior:obstacles1And2Behavior];
    
    
   
   }

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id)item withBoundaryIdentifier:(id)identifier atPoint:(CGPoint)p{
    
    self.orangeBall.backgroundColor = [UIColor blueColor];
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id)item withBoundaryIdentifier:(id)identifier{
    
    self.orangeBall.backgroundColor = [UIColor orangeColor];
}


-(void) targetMethod : (NSTimer*) timer {
    static int count = 0;
    nameB.hidden = false;
    NSString* letter = nil;
    switch(count) {
        case 0: letter = @"B "; break;
        case 1: letter = @"R "; break;
        case 2: letter = @"E "; break;
        case 3: letter = @"A "; break;
            case 4: letter = @"K "; break;
            case 5: letter = @"O "; break;
            case 6: letter = @"U "; break;
        case 7: letter = @"T ";[timer invalidate]; break;
    }
    count++;
    nameB.text = [NSString stringWithFormat:@"%@%@", nameB.text, letter];
    [nameB setFont:[UIFont fontWithName:@"chalkduster" size:25]];
    
    nameB.textColor = [UIColor yellowColor];
    nameB.layer.shadowColor = [UIColor redColor].CGColor;
    nameB.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    nameB.layer.shadowRadius = 10.0;
    nameB.layer.shadowOpacity = 0.3;
    nameB.layer.masksToBounds = NO;
}


@end
