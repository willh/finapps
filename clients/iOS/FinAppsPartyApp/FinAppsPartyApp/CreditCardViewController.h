//
//  CreditCardViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 27/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCreditCardViewController.h"

@interface CreditCardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddCreditCardViewControllerDelegate> {
    __weak IBOutlet UITableView *_tableView;
}

@end
