//
//  LoginViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {
    UIButton *submitLoginButton;
    UILabel *loginMessageLabel;
    UILabel *usernameMessageLabel;
    UILabel *passwordMessageLabel;
    UITextField *usernameTextField;
    UITextField *passwordTextField;
}

@property(nonatomic, retain) IBOutlet UIButton *submitLoginButton;
@property(nonatomic, retain) IBOutlet UILabel *loginMessageLabel;
@property(nonatomic, retain) IBOutlet UILabel *usernameMessageLabel;
@property(nonatomic, retain) IBOutlet UILabel *passwordMessageLabel;
@property(nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property(nonatomic, retain) IBOutlet UITextField *passwordTextField;

@end
