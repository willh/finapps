//
//  AddCreditCardViewController.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTStatusBarOverlay.h"
#import "AccountSelectViewController.h"

@class AddCreditCardViewController;

@protocol AddCreditCardViewControllerDelegate <NSObject, MTStatusBarOverlayDelegate>

- (void)addCreditCardVC:(AddCreditCardViewController *)addCreditCardVC didAddCard:(NSDictionary *)cardData;

@end

@interface AddCreditCardViewController : UIViewController <AccountSelectViewControllerDelegate> {
    
    __weak IBOutlet UISegmentedControl *cardTypeSegmentedControl;
    __weak IBOutlet UISegmentedControl *cardIssuerSegmentedControl;
    __weak IBOutlet UILabel *linkedAccountLabel;
}

- (IBAction)applyButtonTapped:(id)sender;


@property (nonatomic, weak) id<AddCreditCardViewControllerDelegate> delegate;

@end
