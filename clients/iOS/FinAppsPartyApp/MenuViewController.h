//
//  MenuViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController {
    UIButton *callSupportButton;
    UIButton *insuranceQuoteCaseButton;
    UIButton *cardApplicationCaseButton;
    UIButton *transferCreditCaseButton;
}

@property(nonatomic, retain) IBOutlet UIButton *callSupportButton;
@property(nonatomic, retain) IBOutlet UIButton *insuranceQuoteCaseButton;
@property(nonatomic, retain) IBOutlet UIButton *cardApplicationCaseButton;
@property(nonatomic, retain) IBOutlet UIButton *transferCreditCaseButton;

@end
