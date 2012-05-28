//
//  BullsEyeViewController.h
//  BullsEye
//
//  Created by Calvin Cheng on 28/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel *roundLabel;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) IBOutlet UILabel *targetLabel;
@property (nonatomic, strong) IBOutlet UISlider *slider;

- (IBAction)showAlert;

- (IBAction)sliderMoved:(UISlider *)sender;

- (IBAction)startOver;

- (IBAction)showInfo;

@end
