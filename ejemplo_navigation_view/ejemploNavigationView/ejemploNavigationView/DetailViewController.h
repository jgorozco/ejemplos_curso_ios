//
//  DetailViewController.h
//  ejemploNavigationView
//
//  Created by jose garcia on 05/03/12.
//  Copyright (c) 2012 freelance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
