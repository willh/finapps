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
int const MortgageApplicationCase = 1;

@implementation MenuViewController
@synthesize callSupportButton, mortgageApplicationButton;

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
        case MortgageApplicationCase:
            NSLog(@"Insurance quote hit");
            [self performSegueWithIdentifier:@"MortgageApplication" sender:self];
            break;
        default:
            break;
    }
    
}


@end
