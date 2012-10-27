//
//  CreditCardViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 27/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "CreditCardViewController.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/CardsService.h"
#import "ActionDAO.h"
#import "CreditCardCell.h"

@interface CreditCardViewController () {
    NSArray *_creditCardIds;
    NSMutableArray *_creditCardData;
    
    CardsService *_service;
}

@end

@implementation CreditCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _service = [[CardsService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];
    }
    return self;
}

- (void)refreshData
{
    _service = [[CardsService alloc] initWithNetworkingEngine:[NetworkingEngineProvider networkEngine]];
    
    [_service cardsListWithSuccessBlock:^(NSArray *cards) {
        _creditCardIds = cards;
        _creditCardData = [[NSMutableArray alloc] init];
        for (int i = 0; i < [_creditCardIds count]; i++) {
            [_creditCardData addObject:[NSNull null]];
        }
        
        [_tableView reloadData];
    } failureBlock:^(UserError *error) {
        //
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
        Action *action = [[[ActionDAO alloc] initWithManagedObjectContext:managedObjectContext] newActionWithPropertiesCleared];
        
        action.actionDescription = @"Credit card list accessed";

        return YES;
    }];
    
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
    
    [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
        Action *action = [[[ActionDAO alloc] initWithManagedObjectContext:managedObjectContext] newActionWithPropertiesCleared];
        
        action.actionDescription = [NSString stringWithFormat:@"Added credit card with number: %@, of id: %@", cardData[@"number"], cardData[@"id"]];
        
        return YES;
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddCreditCardSegue"]) {
        AddCreditCardViewController *addCreditCardVC = segue.destinationViewController;
        addCreditCardVC.delegate = self;
        
        [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
            Action *action = [[[ActionDAO alloc] initWithManagedObjectContext:managedObjectContext] newActionWithPropertiesCleared];
            
            action.actionDescription = @"Add credit card button tapped";
            
            return YES;
        }];
    }
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_creditCardIds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    CreditCardCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *cardId = _creditCardIds[indexPath.row];
    
    if (_creditCardData[indexPath.row] == [NSNull null]) {
        [cell setActive:NO];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        
        dispatch_async(queue, ^{
            [_service cardDetailsWithId:cardId SuccessBlock:^(NSDictionary *cardData) {
                _creditCardData[indexPath.row] = cardData;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.titleLabel.text = cardData[@"number"];
                    cell.detailLabel.text = cardData[@"issuer"];
                    [cell setActive:YES];
                    [cell setNeedsLayout];
                });
            } failureBlock:^(UserError *error) {
                //
            }];
        });
    } else {
        [cell setActive:YES];
        NSDictionary *card = _creditCardData[indexPath.row];
        cell.titleLabel.text = card[@"number"];
        cell.detailLabel.text = card[@"issuer"];
    }
    
    
    return cell;
}

@end
