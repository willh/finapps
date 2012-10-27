//
//  ReplaceSegue.m
//  FinAppsPartyApp
//
//  Created by Kyle Davidson on 26/10/2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "ReplaceSegue.h"

@implementation ReplaceSegue

-(void) perform {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    UIViewController *srcViewController = (UIViewController *) self.sourceViewController;
    UIViewController *destViewController = (UIViewController *) self.destinationViewController;
    [UIView transitionFromView:srcViewController.view
                        toView:destViewController.view
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    completion:^(BOOL complete) {
                        [srcViewController.view removeFromSuperview];
                        appDelegate.window.rootViewController = destViewController;
                        
                    }];




}


@end
