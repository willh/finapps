//
//  MortgageApplicationViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortgageApplicationViewController : UIViewController <UITextFieldDelegate> {
    UITextField *annualSalaryTextBox;
    UITextField *annualIncomeTextBox;
    UITextField *monthlyCreditTextBox;
    UILabel *dependantsLabel;
    UISlider *dependantsSlider;
    UIButton *applyButton;
}

@property (nonatomic, retain) IBOutlet UITextField *annualSalaryTextBox;
@property (nonatomic, retain) IBOutlet UITextField *annualIncomeTextBox;
@property (nonatomic, retain) IBOutlet UITextField *monthlyCreditTextBox;
@property (nonatomic, retain) IBOutlet UILabel *dependantsLabel;
@property (nonatomic, retain) IBOutlet UISlider *dependantsSlider;
@property (nonatomic, retain) IBOutlet UIButton *applyButton;


@end
