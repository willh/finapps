//
//  MortgageApplicationViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortgageApplicationViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate> {
    UITextField *purchasingPriceTextField;
    UITextField *requestedAmountTextField;
    UITextField *termTimeTextField;

    NSArray *productTypes;
    UIButton *applyButton;
}

@property (nonatomic, retain) IBOutlet UITextField *purchasingPriceTextField;
@property (nonatomic, retain) IBOutlet UITextField *requestedAmountTextField;
@property (nonatomic, retain) IBOutlet UITextField *termTimeTextField;
@property (nonatomic, retain) IBOutlet UIButton *applyButton;


@end
