//
//  UserDetailsViewController.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "UserDetailsViewController.h"
#import "UserDAO.h"
#import "User.h"

@interface UserDetailsViewController ()

@end

@implementation UserDetailsViewController
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [CoreDataProvider transactionInContext:^BOOL(NSManagedObjectContext *managedObjectContext) {
        UserDAO *userDAO = [[UserDAO alloc] initWithManagedObjectContext:managedObjectContext];
        User *user = [userDAO recentUser];
        NSArray *keys = [[NSArray alloc] initWithObjects:@"FirstName", @"SecondName", @"Street",
                         @"StreetNumber", @"City", @"Postcode", nil];
        NSArray *values = [[NSArray alloc] initWithObjects:user.firstName, user.secondName, user.street, user.streetNumber, user.city, user.postalCode, nil];
        userData = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
        
        return NO;
    }];
    
    self.navigationItem.title = [[NSString alloc] initWithFormat:@"%@'s details", [userData valueForKey:@"FirstName"]];
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [userData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DetailsCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }

    NSString *sectionName = [[userData allKeys] objectAtIndex:[indexPath row]];
    NSString *sectionValue = [userData valueForKey:sectionName];
    
    cell.textLabel.text = sectionName;
    cell.detailTextLabel.text = sectionValue;
    
    return cell;
    
}


@end
