//
//  MasterViewController.h
//  ejemploNavigationView
//
//  Created by jose garcia on 05/03/12.
//  Copyright (c) 2012 freelance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
