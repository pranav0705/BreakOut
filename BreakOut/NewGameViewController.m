//
//  NewGameViewController.m
//  BreakOut
//
//  Created by Pranav Bhandari on 2/11/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

#import "NewGameViewController.h"

@interface NewGameViewController ()

@end

@implementation NewGameViewController
@synthesize paddle, ball,brick,brick2,brick3,brick4,brick5,brick6,brick7,WelcomeMsg;
@synthesize bricks;
@synthesize timer;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"images.jpg"]];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:[UIImage imageNamed:@"images.jpg"]];
    
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFit];
    
 //   [self.view insertSubview:backgroundImage atIndex:0];
    //OR
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
    
   
    //displaying welcome message
    WelcomeMsg.hidden = NO;
    WelcomeMsg.alpha = 1.0f;
    // Then fades it away after 2 seconds (the cross-fade animation will take 0.5s)
    [UIView animateWithDuration:0.5 delay:2.0 options:0 animations:^{
        // Animate the alpha value of your imageView from 1.0 to 0.0 here
        self.WelcomeMsg.alpha = 0.0f;
    } completion:^(BOOL finished) {
        // Once the animation is completed and the alpha has gone to 0.0, hide the view for good
       
        WelcomeMsg.hidden = YES;
    }];
    
    
    
    
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
   
    
   
    //adding bricks to layout
    bricks = [NSMutableArray array];
    int y1 = 40;
   // int height = 15;
    int col_brick = (screenWidth/16 * 2);
    int nm = col_brick - ((screenWidth/16)/2);
   /*for (int i = 0; i <= 11; i++) {
       
       int y = 0;
        while (y<16) {
            UILabel *brik;
            int x = (screenWidth/16)*i;
           
            //adding 1st column
            if(i == 0)
            {
              //  brik= [[UILabel alloc] initWithFrame:CGRectMake(nm, 50, screenWidth/16, 20)];
                if(y>=2 && y <12)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i ==1)
            {
              //  brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 50, screenWidth/16, 20)];
                if(y == 6 || y == 7)
                {
                     brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i == 2)
            {
                if(y == 6 || y == 7)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i == 3)
            {
                if(y >= 5 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i ==4)
            {
                if(y >= 2 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i ==5)
            {
                if(y == 2)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i ==6)
            {
                if(y == 2)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i ==7)
            {
                if(y >= 2 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
           
            if(i == 8)
            {
                if(y >= 5 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
           
            if(i == 9)
            {
                if(y == 6 || y == 7)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
           if(i ==10)
            {
                if(y == 6 || y == 7)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
            if(i == 11)
            {
                if(y>=2 && y <12)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                }
            }
           
            [brik setBackgroundColor:[UIColor orangeColor]];
            brik.layer.borderColor = [UIColor blackColor].CGColor;
            brik.layer.borderWidth = 2;
            [self.view addSubview:brik];
            [bricks addObject:brik];
            y++;
        }
    } */
    
    
    for (int i = 0; i <= 11; i++) {
        
        int y = 0;
        while (y<=16) {
            UILabel *brik;
            UILabel *lbl;
            int x = (screenWidth/16)*i;
            
            //adding 1st column
            if(i == 0)
            {
                //brik= [[UILabel alloc] initWithFrame:CGRectMake(nm, 50, screenWidth/16, 20)];
                if(y == 0)
                {
                   brik= [[UILabel alloc] initWithFrame:CGRectMake(nm, 50, screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            if(i == 1)
            {
                //brik= [[UILabel alloc] initWithFrame:CGRectMake(nm, 50, screenWidth/16, 20)];
                if(y == 0)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 50, screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            if(i == 5 || i == 6 || i == 8 || i == 9 )
            {
                //brik= [[UILabel alloc] initWithFrame:CGRectMake(nm, 50, screenWidth/16, 20)];
                if(y == 0)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 50, screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            if( i == 5 || i == 6 || i == 7)
            {
                if(y == 9)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 60+(8*15), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
                if(y == 10)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 60+(9*15), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
                if(y == 11)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 60+(10*15), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            if(i == 6)
            {
                if(y == 14)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 70+(12*15), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
                if(y == 15)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 70+(13*15), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
                if(y == 16)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 70+(14*15), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            if(i == 5 || i == 6)
            {
                brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 80+(10*15), screenWidth/16, 20)];
                [brik setBackgroundColor:[UIColor redColor]];
                brik.layer.borderColor = [UIColor blackColor].CGColor;
                brik.layer.borderWidth = 2;
                [self.view addSubview:brik];
                [bricks addObject:brik];
            }
            if(i == 11 )
            {
                //brik= [[UILabel alloc] initWithFrame:CGRectMake(nm, 50, screenWidth/16, 20)];
                if(y == 0)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 50, screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                    
                    //adding last part
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x+screenWidth/16, 50, screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor redColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];

                }
            }
            y++;
        }
    }
    
            
            //adding main
    for (int i = 0; i <= 11; i++) {
        
        int y = 0;
        while (y<12) {
            UILabel *brik;
            UILabel *lbl;
            int x = (screenWidth/16)*i;
            
            //adding 1st column
            if(i == 0)
            {
                //brik= [[UILabel alloc] initWithFrame:CGRectMake(nm, 50, screenWidth/16, 20)];
                if(y>=2 && y <12)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            else if(i ==1)
            {
                //  brik= [[UILabel alloc] initWithFrame:CGRectMake(nm+x, 50, screenWidth/16, 20)];
                if(y == 6 || y == 7)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            else if(i == 2)
            {
                if(y == 6 || y == 7)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            else if(i == 3)
            {
                if(y >= 5 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            else if(i ==4)
            {
                if(y >= 2 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            else if(i ==5)
            {
                
                if(y == 2)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                    
                    
                    
                    
                    //adding label
                    lbl= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y)+20, screenWidth/16+screenWidth/16, 90)];
                    [lbl setBackgroundColor:[UIColor whiteColor]];
                    [lbl setNumberOfLines:2];
                    [lbl setText:[NSString stringWithFormat:@"  Break\n  Out"]];
                    
                    [lbl setFont:[UIFont fontWithName:@"chalkduster" size:20]];
                    lbl.layer.borderColor = [UIColor blackColor].CGColor;
                    lbl.layer.borderWidth = 2;
                    [self.view addSubview:lbl];
                    [bricks addObject:brik];
                    
                    [UIView transitionWithView:lbl duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                        [lbl setTextColor:[UIColor whiteColor]];
                        [lbl setBackgroundColor:[UIColor blackColor]];
                        
                        [lbl setShadowColor:[UIColor blueColor]];
                    } completion:nil];
                    
                    
                }
            }
            else if(i ==6)
            {
                if(y == 2)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            else if(i ==7)
            {
                if(y >= 2 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            
            else if(i == 8)
            {
                if(y >= 5 && y <= 8)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            
            else if(i == 9)
            {
                if(y == 6 || y == 7)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            else if(i ==10)
            {
                if(y == 6 || y == 7)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            //if(i == 11)
            else
            {
                if(y>=2 && y <12)
                {
                    brik= [[UILabel alloc] initWithFrame:CGRectMake(col_brick+x, 40+(15*y), screenWidth/16, 20)];
                    [brik setBackgroundColor:[UIColor orangeColor]];
                    brik.layer.borderColor = [UIColor blackColor].CGColor;
                    brik.layer.borderWidth = 2;
                    [self.view addSubview:brik];
                    [bricks addObject:brik];
                }
            }
            
           
            y++;
        }
    }
    
    
  /* for(int k=0; k<4; k ++){
        
        for (int i=0;i<16;i++){
            UILabel *brik;
            int x = (screenWidth/12)*i;
            brik= [[UILabel alloc] initWithFrame:CGRectMake(x, y, screenWidth/5, height)];
            [brik setBackgroundColor:[UIColor orangeColor]];
            brik.layer.borderColor = [UIColor blackColor].CGColor;
            brik.layer.borderWidth = 2;
            [self.view addSubview:brik];
            [bricks addObject:brik];
        }
        y = y + height;
    }
    
    NSLog(@"Number of Shows : %d", [bricks count]);
    
   */
    
   /* brick = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, screenWidth/7, 10)];
    [self.view addSubview:brick];
    [brick setBackgroundColor:[UIColor blueColor]];
    
    brick2 = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/7, 40, screenWidth/7, 10)];
    [self.view addSubview:brick2];
    [brick2 setBackgroundColor:[UIColor blueColor]];
    brick3 = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth/7)*2, 40, screenWidth/7, 10)];
    [self.view addSubview:brick3];
    [brick3 setBackgroundColor:[UIColor blueColor]];
    brick4 = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth/7)*3, 40, screenWidth/7, 10)];
    [self.view addSubview:brick4];
    [brick4 setBackgroundColor:[UIColor blueColor]];
    brick5 = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth/7)*4, 40, screenWidth/7, 10)];
    [self.view addSubview:brick5];
    [brick5 setBackgroundColor:[UIColor blueColor]];
    brick6 = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth/7)*5, 40, screenWidth/7, 10)];
    [self.view addSubview:brick6];
    [brick6 setBackgroundColor:[UIColor blueColor]];
    brick7 = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth/7)*6, 40, screenWidth/7, 10)];
    [self.view addSubview:brick7];
    [brick7 setBackgroundColor:[UIColor blueColor]];
    
    */
    
    
    
    paddle = [[UIView alloc] initWithFrame:CGRectMake(230, 690, 60, 10)];
    [self.view addSubview:paddle];
    [paddle setBackgroundColor:[UIColor yellowColor]];
    
    ball = [[UIView alloc] initWithFrame:CGRectMake(100, 500, 15, 15)];
    [self.view addSubview:ball];
    [ball setBackgroundColor:[UIColor redColor]];
    self.ball.layer.cornerRadius = 5.9;
    dx = 10;
    dy = 10;
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.1	target:self selector:@selector(timerEvent:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (UITouch *t in touches)
    {
        CGPoint p = [t locationInView:self.view];
        p.y = 690;
        [paddle setCenter:p];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)timerEvent:(id)sender
{
    CGRect bounds = [self.view bounds];
    
    // NSLog(@"Timer event.");
    CGPoint p = [ball center];
    

    
   
    
    if ((p.x + dx) < 0)
        dx = -dx;
    
    if ((p.y + dy) < 0)
        dy = -dy;
    
    if ((p.x + dx) > bounds.size.width)
        dx = -dx;
    
    if ((p.y + dy) > bounds.size.height)
        dy = -dy;
    
    p.x += dx;
    p.y += dy;
    [ball setCenter:p];
    
    // Now check to see if we intersect with paddle.  If the movement
    // has placed the ball inside the paddle, we reverse that motion
    // in the Y direction.
    if (CGRectIntersectsRect([ball frame], [paddle frame]))
    {
        dy = -dy;
        p.y += 2*dy;
        [ball setCenter:p];
    }
    
  /*  if(CGRectIntersectsRect([ball frame], [brick frame]))
    {
        if(!brick.isHidden)
        {
            brick.hidden = YES;
            dy = -dy;
        }
        
    }
    if(CGRectIntersectsRect([ball frame], [brick2 frame]))
    {
        if(!brick2.isHidden)
        {
            brick2.hidden = YES;
            dy = -dy;
        }
    }
    if(CGRectIntersectsRect([ball frame], [brick3 frame]))
    {
        if(!brick3.isHidden)
        {
            brick3.hidden = YES;
            dy = -dy;
        }
    }
    if(CGRectIntersectsRect([ball frame], [brick4 frame]))
    {
        if(!brick4.isHidden)
        {
            brick4.hidden = YES;
            dy = -dy;
        }
       
    }
    if(CGRectIntersectsRect([ball frame], [brick5 frame]))
    {
        if(!brick5.isHidden)
        {
            brick5.hidden = YES;
            dy = -dy;
        }
    }
    if(CGRectIntersectsRect([ball frame], [brick6 frame]))
    {
        if(!brick6.isHidden)
        {
            brick6.hidden = YES;
            dy = -dy;
        }
    }
    if(CGRectIntersectsRect([ball frame], [brick7 frame]))
    {
        if(!brick7.isHidden)
        {
            brick7.hidden = YES;
            dy = -dy;
        }
    } */
    
    
    NSUInteger arraySize = [bricks count];
   
    for(int j=0; j<arraySize; j++)
    {
        UILabel *x =[bricks objectAtIndex:j];
        if (CGRectIntersectsRect([ball frame], [x frame]))
        {
            NSLog(@"inside this loop");
            if(!x.isHidden){
                //YourClass found!!
                dy = -dy;
                x.hidden = YES;
            }
        }
        
    }
    
    Boolean flg = TRUE;
    Boolean b_for = false;
    for(int c = 0 ; c < arraySize;c++)
    {
        if (![[bricks objectAtIndex:c] isHidden]) {
            flg = false;
            b_for = true;
        }
        if (b_for) {
            break;
        }
    }
    if(flg)
    {
        if (!UIAccessibilityIsReduceTransparencyEnabled()) {
            self.view.backgroundColor = [UIColor clearColor];
            
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            blurEffectView.frame = self.view.bounds;
            blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [self.view addSubview:blurEffectView];
            
            
            
            
            
            ///additonal
            // Vibrancy effect
            UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
            UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
            [vibrancyEffectView setFrame:self.view.bounds];
            
            // Label for vibrant text
            UILabel *vibrantLabel = [[UILabel alloc] init];
            UIButton *vibrantButton = [[UIButton alloc] init];
            [vibrantLabel setNumberOfLines:2];
            [vibrantLabel setText:@"Congrats, You Broke the Bricks Successfully!!!"];
            [vibrantLabel setFont:[UIFont systemFontOfSize:26.0f]];
            [vibrantLabel sizeToFit];
            [vibrantLabel setCenter: self.view.center];
            
            // Add label to the vibrancy view
            [[vibrancyEffectView contentView] addSubview:vibrantLabel];
            
            // Add the vibrancy view to the blur view
            [[blurEffectView contentView] addSubview:vibrancyEffectView];
        }
        else {
            self.view.backgroundColor = [UIColor blackColor];
        }
        [timer invalidate];
    }
    
    
    
    if (p.y > 690) {
        if (!UIAccessibilityIsReduceTransparencyEnabled()) {
            self.view.backgroundColor = [UIColor clearColor];
            
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            blurEffectView.frame = self.view.bounds;
            blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [self.view addSubview:blurEffectView];
            
            
            
            
            
            ///additonal
            // Vibrancy effect
            UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
            UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
            [vibrancyEffectView setFrame:self.view.bounds];
            
            // Label for vibrant text
            UILabel *vibrantLabel = [[UILabel alloc] init];
            UIButton *vibrantButton = [[UIButton alloc] init];
            
            [vibrantLabel setText:@"Sorry, You Lose!!"];
        //    [vibrantLabel setFont:[UIFont systemFontOfSize:20.0f]];
            [vibrantLabel setFont:[UIFont fontWithName:@"chalkduster" size:22]];
            [vibrantLabel sizeToFit];
            [vibrantLabel setCenter: self.view.center];
            
            // Add label to the vibrancy view
            [[vibrancyEffectView contentView] addSubview:vibrantLabel];
            
            // Add the vibrancy view to the blur view
            [[blurEffectView contentView] addSubview:vibrancyEffectView];
        }
        [timer invalidate];
    }
    
}

@end
