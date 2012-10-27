//
//  CreditCardViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 27/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "CreditCardViewController.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/CardsService.h"

@interface CreditCardViewController () {
    NSArray *_creditCards;
}

@end

@implementation CreditCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)refreshData
{
    CardsService *service = [[CardsService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];
    
    [service cardsListWithSuccessBlock:^(NSArray *cards) {
        _creditCards = cards;
        [_tableView reloadData];
    } failureBlock:^(UserError *error) {
        //
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCreditCardVC:(AddCreditCardViewController *)addCreditCardVC didAddCard:(NSDictionary *)cardData {
    [self refreshData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddCreditCardSegue"]) {
        AddCreditCardViewController *addCreditCardVC = segue.destinationViewController;
        addCreditCardVC.delegate = self;
    }
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_creditCards count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *cardId = _creditCards[indexPath.row];
    cell.textLabel.text = cardId;
    
    return cell;
}

@end
