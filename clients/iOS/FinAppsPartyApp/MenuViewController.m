//
//  MenuViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

int const CallSupportCase = 0;
int const CreditCardCase = 1;
int const InsuranceQuoteCase = 2;
int const TransferCreditCase = 3;

@implementation MenuViewController
@synthesize callSupportButton, transferCreditCaseButton, cardApplicationCaseButton, insuranceQuoteCaseButton;

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

#pragma mark - Event handlers
- (IBAction)buttonTapped:(id)sender {
    int button = [(UIButton*)sender tag];
    
    switch (button) {
        case CallSupportCase:
            NSLog(@"Call support hit");
            break;
        case CreditCardCase:
            [self performSegueWithIdentifier:@"Credit Card Application" sender:self];
            NSLog(@"Credit card hit");
            break;
        case InsuranceQuoteCase:
            NSLog(@"Insurance quote hit");
            break;
        case TransferCreditCase:
            NSLog(@"Transfer credit hit");
            break;
        default:
            break;
    }
    
}


@end
