//
//  MenuViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTStatusBarOverlay.h"

@interface MenuViewController : UIViewController <MTStatusBarOverlayDelegate>{
    UIButton *callSupportButton;
    UIButton *mortgageApplicationButton;
}

@property(nonatomic, retain) IBOutlet UIButton *callSupportButton;
@property(nonatomic, retain) IBOutlet UIButton *mortgageApplicationButton;
@end
