//
//  UserDetailsViewController.h
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView *tableView;
    NSDictionary *userData;
    NSMutableArray *keys;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
