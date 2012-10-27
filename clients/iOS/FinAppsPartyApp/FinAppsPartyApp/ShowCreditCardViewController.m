//
//  ShowCreditCardViewController.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "ShowCreditCardViewController.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/CardsService.h"

@interface ShowCreditCardViewController () {
    NSString *_cardId;
    
    NSDictionary *_creditCardDict;
}

@end

@implementation ShowCreditCardViewController
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setCardId:(NSString *)cardId {
    _cardId = cardId;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[[CardsService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]] cardDetailsWithId:_cardId SuccessBlock:^(NSDictionary *cardData) {
        NSDictionary *creditOptionsDict = cardData[@"creditOptions"];
        
        NSMutableDictionary *returnDictionary = [NSMutableDictionary new];
        
        [returnDictionary addEntriesFromDictionary:@{
        @"Card Number": cardData[@"number"],
         @"Issuer": cardData[@"issuer"]}];
        
        if (creditOptionsDict != [NSNull null] ) {
            [returnDictionary addEntriesFromDictionary:@{
            @"Card Type": cardData[@"mode"],
            @"Credit Limit": [creditOptionsDict[@"creditLimit"] stringValue],
             @"Total Debt": [creditOptionsDict[@"totalDebt"] stringValue]
             }];
        }
        
        _creditCardDict = returnDictionary;
         
        [self.tableView reloadData];
        
    } failureBlock:^(UserError *error) {
        //
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_creditCardDict count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    NSString *key = [_creditCardDict allKeys][indexPath.row];
    NSString *value = _creditCardDict[key];
    
    cell.textLabel.text = key;
    cell.detailTextLabel.text = value;
    
    return cell;
}

@end
