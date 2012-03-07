//
//  vista1.m
//  ejemploNavigationView
//
//  Created by jose garcia on 05/03/12.
//  Copyright (c) 2012 freelance. All rights reserved.
//

#import "vista1.h"
#import "vista11.h"
#import "vista12.h"
@implementation vista1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickVista12:(id)sender {
    vista12 *v11=[[vista12 alloc] initWithNibName:@"vista12" bundle:nil];
    [self.navigationController pushViewController:v11 animated:NO];

}

- (IBAction)clickVista11:(id)sender {
    //Creamos una nueva vista (vista11)
    //creamos controlador                         //le pasamos el xib
    vista11 *v11=[[vista11 alloc] initWithNibName:@"vista11" bundle:nil];
    [self.navigationController pushViewController:v11 animated:NO];
}
@end
