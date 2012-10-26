//
//  MortgageApplicationViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "MortgageApplicationViewController.h"
#import "LoanAmountViewController.h"

@interface MortgageApplicationViewController ()

@end

@implementation MortgageApplicationViewController
@synthesize annualIncomeTextBox, annualSalaryTextBox, monthlyCreditTextBox, dependantsLabel, dependantsSlider, applyButton;

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

- (IBAction)applyButtonTapped {
    [self performSegueWithIdentifier:@"LoanAmount" sender:self];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    int dependants = (int)[sender value];
    dependantsLabel.text = [NSString stringWithFormat:@"%i", dependants];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LoanAmountViewController *loanAmountVC = (LoanAmountViewController *)[segue destinationViewController];
    NSArray *values = [NSArray arrayWithObjects:[annualIncomeTextBox text], [annualSalaryTextBox text], [monthlyCreditTextBox text], [dependantsLabel text], nil];
    NSArray *keys = [NSArray arrayWithObjects:@"ExtraIncome", @"AnnualSalary", @"MonthlyCredits", @"Dependants", nil];
    NSDictionary *formData = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    loanAmountVC.formData = formData;
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



@end
