//
//  LoginViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "LoginViewController.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/LoginService.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/UserService.h"
#import "ActionDAO.h"
#import "Action.h"
#import "UserDAO.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize submitLoginButton;
@synthesize usernameTextField, passwordTextField;
@synthesize passwordMessageLabel, usernameMessageLabel, loginMessageLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboards)];
    [self.view addGestureRecognizer:gestureRecognizer];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboards {
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}

#pragma mark - Event Handlers

- (IBAction)loginButtonTapped:(id)sender {
    [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
        
        ActionDAO *actionDAO = [[ActionDAO alloc] initWithManagedObjectContext:managedObjectContext];
        
        Action *action = [actionDAO newActionWithPropertiesCleared];
        action.actionDescription = @"Login button clicked";
        
        return YES;
    }];
    
    if ([usernameTextField.text isEqualToString:@""] || [passwordTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to submit login credentials" message:@"Please provide a username and password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        //some verification
        
        NSString *username = usernameTextField.text;
        NSString *password = passwordTextField.text;
        
        LoginService *service = [[LoginService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];
        UserService *userService = [[UserService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];
        
        // Get the user token first
        [service loginWithUsername:username password:password successBlock:^(NSString *token) {

            // If it succeeds, get user data
            [userService userDataWithSuccessBlock:^(NSDictionary *userDict) {
                
                NSString *userId = userDict[@"id"];
                if ([userId length] == 0) {
                    return;
                }
                
                NSDictionary *holderDict = userDict[@"holder"];
                NSDictionary *addressDict = holderDict[@"address"];
                
                [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
                    
                    UserDAO *userDAO = [[UserDAO alloc] initWithManagedObjectContext:managedObjectContext];
                    
                    User *user = [userDAO createObject];
        
                    user.userId = userId;
                    user.createdAt = [NSDate date];
                    user.firstName = holderDict[@"firstName"];
                    user.secondName = holderDict[@"lastName"];
                    user.street = addressDict[@"street"];
                    user.streetNumber = addressDict[@"number"];
                    user.city = addressDict[@"city"];
                    user.postalCode = addressDict[@"postalCode"];
                    user.country = addressDict[@"country"];
                    
                    ActionDAO *actionDAO = [[ActionDAO alloc] initWithManagedObjectContext:managedObjectContext];
                    Action *loginAction = [actionDAO newActionWithPropertiesCleared];
                    loginAction.actionDescription = [NSString stringWithFormat:@"User logged in with id: %@", userId];
                    
                    return YES;
                }];

                [self performSegueWithIdentifier:@"Menu" sender:self];
                
            } failureBlock:^(UserError *error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:error.title message:error.message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alertView show];
            }];
                        
        } failureBlock:^(UserError *error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:error.title message:error.message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alertView show];
        }];
    }

}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
