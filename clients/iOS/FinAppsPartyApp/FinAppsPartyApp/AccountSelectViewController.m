//
//  AccountSelectViewController.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "AccountSelectViewController.h"
#import "CreditCardCell.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/AccountService.h"

@interface AccountSelectViewController () {
    NSArray *_accountIds;
    NSMutableArray *_accountData;
 
    AccountService *_service;
    int _selectedIndex;
}

@end

@implementation AccountSelectViewController
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)refreshData {
    _accountData = nil;
    
    [_service accountsListWithSuccessBlock:^(NSArray *accounts) {
        _accountIds = accounts;
        _accountData = [NSMutableArray new];
        
        for (int i = 0; i < [accounts count]; i++) {
            [_accountData addObject:[NSNull null]];
        }
        
        [_tableView reloadData];
    } failureBlock:^(UserError *error) {
        //
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _selectedIndex = -1;
    _service = [[AccountService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];

    
    [self refreshData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonTapped:(id)sender {
    if (_selectedIndex >= 0) {
        [self.delegate accountSelected:_accountIds[_selectedIndex] accountNumber:_accountData[_selectedIndex][@"accountNumber"]];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Please select an account." message:@"New card has to be linked to one of your accounts" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self.delegate accountSelectionCanceled];
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_accountIds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *AccountCell = @"AccountCell";
    
    CreditCardCell *cell = [tableView dequeueReusableCellWithIdentifier:AccountCell];
    
    NSString *accountId = _accountIds[indexPath.row];
    
    if (_accountData[indexPath.row] == [NSNull null]) {
        [cell setActive:NO];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        
        dispatch_async(queue, ^{
            [_service accountWithId:accountId successBlock:^(NSDictionary *accountData) {
                _accountData[indexPath.row] = accountData;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.titleLabel.text = accountData[@"accountNumber"];
                    cell.detailLabel.text = [accountData[@"actualBalance"] stringValue];
                    [cell setActive:YES];
                    [cell setNeedsLayout];
                    if (_selectedIndex == indexPath.row) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    
                });
            } failureBlock:^(UserError *error) {
                //
            }];
        });
    } else {
        [cell setActive:YES];
        NSDictionary *accountData = _accountData[indexPath.row];
        cell.titleLabel.text = accountData[@"accountNumber"];
        cell.detailLabel.text = [accountData[@"actualBalance"] stringValue];
        if (_selectedIndex == indexPath.row) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedIndex = indexPath.row;
    [tableView reloadData];
}

@end
