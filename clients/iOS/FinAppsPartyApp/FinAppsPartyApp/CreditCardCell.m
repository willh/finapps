//
//  CreditCardCell.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "CreditCardCell.h"

@implementation CreditCardCell

@synthesize activityIndicator = _activityIndicator;
@synthesize titleLabel = _titleLabel;
@synthesize detailLabel = _detailLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setActive:(BOOL)active {
    self.titleLabel.hidden = !active;
    self.detailLabel.hidden = !active;

    if (active) {
        [self.activityIndicator stopAnimating];
    } else {
        [self.activityIndicator startAnimating];
    }
    self.activityIndicator.hidden = active;
    
    self.userInteractionEnabled = active;
    
    if (active) {
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end
