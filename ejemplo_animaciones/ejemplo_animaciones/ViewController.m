//
//  ViewController.m
//  ejemplo_animaciones
//
//  Created by jose garcia on 14/02/12.
//  Copyright (c) 2012 freelance. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#define DegreesToRadians(X) (X*M_PI/180.0) 
@implementation ViewController
@synthesize ball1;
@synthesize ball2;
@synthesize ball3;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)touchBall1:(id)sender {
    [UIView animateWithDuration:1.7 
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         
         ball1.center=CGPointMake(ball1.center.x+80, ball1.center.y+80);
     }      
    completion:^(BOOL finished) 
    {
     ball1.center=CGPointMake(50,50);
    
    }
     
     ];
    

}


- (IBAction)touchBall2:(id)sender {
   continuarAnimacion=NO;
    [self ejecutarSonido];
    [UIView animateWithDuration:1.7 
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         
         CGAffineTransform swingTransform = CGAffineTransformIdentity;
         swingTransform = CGAffineTransformRotate(swingTransform, DegreesToRadians(90));
         ball2.transform = swingTransform;   
         ball2.center=CGPointMake(ball2.center.x-80, ball2.center.y-80);
     }      
                     completion:^(BOOL finished) 
     {
         ball2.center=CGPointMake(150,150);
         CGAffineTransform swingTransform = CGAffineTransformIdentity;
          ball2.transform = swingTransform;   
     }
     
     ];

    
}


-(void)ejecutarSonido
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"click"
                                         ofType:@"mp4"]];
    
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc]
                                  initWithContentsOfURL:url
                                  error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    

}

-(void)animarFase1Bola
{

//    NSLog(@"el valor de numeroVeces es:%d",numeroVeces);

    if (continuarAnimacion){
        [UIView animateWithDuration:1.7 
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
         {
         
         ball3.center=CGPointMake(ball3.center.x+80, ball3.center.y+80);
         }      
                     completion:^(BOOL finished) 
         {
         [self animarFase2Bola];
         
        }
     
         ];
    }

}


-(void)animarFase2Bola
{

    [UIView animateWithDuration:1.7 
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         
         ball3.center=CGPointMake(ball3.center.x-80, ball3.center.y-80);
     }      
                     completion:^(BOOL finished) 
     {
         [self animarFase1Bola];
         
     }
     
     ];

}

- (IBAction)touchBall3:(id)sender {
    continuarAnimacion=YES;
    [self animarFase1Bola];
}

- (void)viewDidUnload
{
    [self setBall1:nil];
    [self setBall2:nil];
    [self setBall3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
