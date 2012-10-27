//
//  AddCreditCardViewController.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "AddCreditCardViewController.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/CardsService.h"
#import "MTStatusBarOverlay.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/PayloadService.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/TwilioService.h"
#import "User.h"
#import "UserDAO.h"
#import "Action.h"
#import "ActionDAO.h"

@interface AddCreditCardViewController ()

@end

@implementation AddCreditCardViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)applyButtonTapped:(id)sender {
    int cardTypeId = cardTypeSegmentedControl.selectedSegmentIndex;
    int issuerId = cardIssuerSegmentedControl.selectedSegmentIndex;
    
    [[[CardsService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]] addCardWithAccountNumber:@"508ae040e4b0d77699b69329" cardType:cardTypeId cardsIssuer:issuerId successBlock:^(NSDictionary *cardData) {
        
        [self.delegate addCreditCardVC:self didAddCard:cardData];
        
    } failureBlock:^(UserError *error) {
        //
    }];
}

- (IBAction)assistanceRequest:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    CallingEngine *callingEngine = [appDelegate callingEngine];
    [MTStatusBarOverlay sharedInstance].animation = MTStatusBarOverlayAnimationNone;
    [MTStatusBarOverlay sharedInstance].delegate = self;
    
    [[[TwilioService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]] tokenForTwilioWithSuccessBlock:^(NSString *twilioToken) {
        PayloadService *service = [[PayloadService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];
        
        __block User *user = nil;
        __block NSArray *actions = nil;
        
        [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
            user = [[[UserDAO alloc] initWithManagedObjectContext:managedObjectContext] recentUser];
            actions = [[[ActionDAO alloc] initWithManagedObjectContext:managedObjectContext] allAsDictionaries];
            
            return NO;
        }];
        
        NSString *callerName = [NSString stringWithFormat:@"%@ %@", user.firstName, user.secondName];
        
        NSDictionary *properties = @{
        @"Card type": @(cardTypeSegmentedControl.selectedSegmentIndex),
        @"Card issuer id": @(cardIssuerSegmentedControl.selectedSegmentIndex)
        };
        
        [service sendPayloadWithToken:twilioToken userId:user.userId context:@"Adding Credit Card Process" actions:actions properties:properties successBlock:^(NSDictionary *response) {
            
            [callingEngine connect:@"+442033221655" withCallerName:callerName];
            [[MTStatusBarOverlay sharedInstance] postMessage:@"Call in progress" animated:YES];
            
        } failureBlock:^(UserError *error) {
            //
        }];
        
    } failureBlock:^(UserError *error) {
        //
    }];
}

@end
