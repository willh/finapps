//
//  MortgageApplicationViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortgageApplicationViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate> {
    UITextField *purchasingPriceTextField;
    UITextField *requestedAmountTextField;
    UIPickerView *productTypePickerView;
}

@property (nonatomic, retain) IBOutlet UITextField *purchasingPriceTextField;
@property (nonatomic, retain) IBOutlet UITextField *requestedAmountTextField;
@property (nonatomic, retain) IBOutlet UIPickerView *productTypePickerView;

@end
