//
//  CreditCardCell.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardCell : UITableViewCell {

}

@property (nonatomic, assign) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) IBOutlet UILabel *detailLabel;

- (void)setActive:(BOOL)active;

@end
