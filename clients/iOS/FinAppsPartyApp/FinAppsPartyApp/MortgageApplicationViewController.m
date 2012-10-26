//
//  MortgageApplicationViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "MortgageApplicationViewController.h"

@interface MortgageApplicationViewController ()

@end

@implementation MortgageApplicationViewController
@synthesize productTypePickerView, purchasingPriceTextField, requestedAmountTextField, applyButton;
@synthesize scrollView;

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
    productTypes = [[NSArray alloc] initWithObjects:@"Fixed", @"Tracker and Variable", @"Other", nil];
    
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
    //do something
}


#pragma mark - Picker View Methods

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [productTypes count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [productTypes objectAtIndex:row];
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



@end
