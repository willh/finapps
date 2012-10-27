//
//  AccountSelectViewController.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AccountSelectViewControllerDelegate <NSObject>

- (void)accountSelected:(NSString *)accountId accountNumber:(NSString *)accountNumber;
- (void)accountSelectionCanceled;

@end

@interface AccountSelectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *_tableView;
}

@property (nonatomic, assign) id<AccountSelectViewControllerDelegate> delegate;
- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;

@end
