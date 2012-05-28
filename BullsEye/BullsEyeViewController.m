//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by Calvin Cheng on 28/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BullsEyeViewController.h"
#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController 
{
    int currentValue;
    int targetValue;
    int score;
    int round;
}

@synthesize roundLabel;
@synthesize scoreLabel;
@synthesize targetLabel;
@synthesize slider;

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)startNewRound
{
    
    round += 1;
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    self.slider.value = currentValue;
}

- (void)startNewGame
{
    score = 0;
    round = 0;
    [self startNewRound];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.slider = nil;
    self.targetLabel = nil;
    self.scoreLabel = nil;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)sliderMoved:(UISlider *)sender
{
    currentValue = lroundf(sender.value);
}

- (IBAction)showAlert   

{
    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
        points += 100;
    } else if (difference < 5) {
        if (difference == 1) {
            points += 50;
        }
        title = @"You almost had it!";
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    score += points;
    
    NSString *message = [NSString stringWithFormat:
                         @"Your scored %d ", points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self 
                              cancelButtonTitle:@"Done" 
                              otherButtonTitles:nil];
    
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{

    [self startNewRound];
    [self updateLabels];
}

- (IBAction)startOver
// This button resets the game
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    
    [self startNewGame];
    [self updateLabels];
    
    [self.view.layer addAnimation:transition forKey:nil];
}

- (IBAction)showInfo
{
    AboutViewController *controller = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
    
}
@end
