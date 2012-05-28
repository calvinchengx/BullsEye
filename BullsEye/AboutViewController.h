//
//  AboutViewController.h
//  BullsEye
//
//  Created by Calvin Cheng on 28/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

- (IBAction)close;

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end
