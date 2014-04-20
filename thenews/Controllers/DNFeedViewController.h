//
//  DNFeedViewController.h
//  The News
//
//  Created by Tosin Afolabi on 25/03/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>

int dnFeedType;

@interface DNFeedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSNumber *feedType;

- (void)switchDnFeedType;

@end
