//
//  MenuViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "MenuViewController.h"
#import "User.h"
#import "UserDAO.h"
#import "FinAppsPartyApp/FinAppsPartyAppBackend/FinAppsPartyAppBackend/PayloadService.h"
#import "FinAppsPartyApp/FinAppsPartyAppBackend/FinAppsPartyAppBackend/TwilioService.h"

@interface MenuViewController () {
    BOOL _isCalling;
}

@end

int const CallSupportCase = 0;
int const MortgageApplicationCase = 1;

@implementation MenuViewController
@synthesize callSupportButton, mortgageApplicationButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _isCalling = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event handlers
- (IBAction)buttonTapped:(id)sender {
    int button = [(UIButton*)sender tag];
    switch (button) {
        case CallSupportCase:
        {
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            CallingEngine *callingEngine = [appDelegate callingEngine];
            
            UIButton *senderButton = (UIButton *)sender;
            
            if (!_isCalling) {
                
                [[[TwilioService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]] tokenForTwilioWithSuccessBlock:^(NSString *twilioToken) {
                    PayloadService *service = [[PayloadService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];

                    __block User *user = nil;
                    
                    [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
                        user = [[[UserDAO alloc] initWithManagedObjectContext:managedObjectContext] recentUser];
                        return NO;
                    }];
                    
                    
                    [service sendPayloadWithToken:twilioToken userId:user.userId context:@"Call Support" actions:nil properties:nil successBlock:^(NSDictionary *response) {

                        [callingEngine connect:@"+442033221655"];
                        [senderButton setTitle:@"Disconnect" forState:UIControlStateNormal];
                        _isCalling = YES;

                    } failureBlock:^(UserError *error) {
                        //
                    }];
                    
                } failureBlock:^(UserError *error) {
                    //
                }];
                
            } else {
                [callingEngine disconnect];
                [senderButton setTitle:@"Call Support" forState:UIControlStateNormal];
                _isCalling = NO;
            }
        }
            break;
        case MortgageApplicationCase:
            [self performSegueWithIdentifier:@"MortgageApplication" sender:self];
            break;
        default:
            break;
    }
    
}


@end
