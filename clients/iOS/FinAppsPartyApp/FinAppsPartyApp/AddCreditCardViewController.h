//
//  AddCreditCardViewController.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddCreditCardViewController;

@protocol AddCreditCardViewControllerDelegate <NSObject>

- (void)addCreditCardVC:(AddCreditCardViewController *)addCreditCardVC didAddCard:(NSDictionary *)cardData;

@end

@interface AddCreditCardViewController : UIViewController {
    
    __weak IBOutlet UISegmentedControl *cardTypeSegmentedControl;
    __weak IBOutlet UISegmentedControl *cardIssuerSegmentedControl;
}

- (IBAction)applyButtonTapped:(id)sender;

@property (nonatomic, weak) id<AddCreditCardViewControllerDelegate> delegate;

@end
