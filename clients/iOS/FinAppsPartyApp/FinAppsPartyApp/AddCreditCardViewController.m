//
//  AddCreditCardViewController.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "AddCreditCardViewController.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/CardsService.h"

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

@end
