//
//  ViewController.m
//  ejemplo_animaciones
//
//  Created by jose garcia on 14/02/12.
//  Copyright (c) 2012 freelance. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

#define DegreesToRadians(X) (X*M_PI/180.0) 
@implementation ViewController
@synthesize ball1;
@synthesize ball2;
@synthesize ball3;
@synthesize ball_image;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self empezarAnimacionRepetitiva];
//    [NSThread detachNewThreadSelector:<#(SEL)#> toTarget:<#(id)#> withObject:<#(id)#>]
    timer=[NSTimer scheduledTimerWithTimeInterval:0.05 //temporizador. 
                            target:self//quien va a recibir evento.
                          selector:@selector(ponerEncimaBoton) //funcion que queremos que se ejecute cada intervalo de tiempo
                          userInfo:nil repeats:YES];
    /*Es similar a poner [self ponerEncimaBoton] pero ejecutandose de manera secuencial, o en un hilo a parte...*/
}
-(void)ponerEncimaBoton
{
    projectileFrame = [[ball_image.layer presentationLayer] frame];
    //cogemos el frame de la bola en movimiento
 //   NSLog(@"Pongo encima en:x:%f  y:%f",projectileFrame.origin.x,projectileFrame.origin.y);

    [ball1 setFrame:projectileFrame];
    //ponemos el frame

}


-(void)empezarAnimacionRepetitiva
{
ball_image.center=CGPointMake(-ball_image.bounds.size.width, 53);
    
     [UIView animateWithDuration:6.0
                          delay:0
                        options:( UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAutoreverse)
                     animations:^
     {      
         ball_image.center=CGPointMake(320+ball_image.bounds.size.width, 80);
     }      
                     completion:^(BOOL finished) 
     {
         if (finished){
         [self empezarAnimacionRepetitiva];
         }
     }
     
     ];
   

}

- (IBAction)touchBall1:(id)sender {
    NSLog(@"touchBall1");
    //elimina las animaciones de este elemento
    [ball_image.layer removeAllAnimations];
    //para la ejecucion del timer.
    [timer invalidate];
    
    [ball_image setFrame:projectileFrame];
    [UIView animateWithDuration:3.0
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^
     {      
         
         [ball_image setHighlighted:YES];
         ball_image.frame=CGRectMake(projectileFrame.origin.x, 
                                     projectileFrame.origin.y, 0.0, 0.0);
     }      
                     completion:^(BOOL finished) 
     {
     }
     
     ];
//---------------- animacion birdblue
}

-(IBAction)beginTouchBall2:(id) sender withEvent:(UIEvent *) event
{
    actualPointBall2=[[[event allTouches] anyObject] locationInView:[self view]];
}

-(IBAction)moveBall2:(id) sender withEvent:(UIEvent *) event
{
    //cogemos otro punto
    CGPoint punto=[[[event allTouches] anyObject] locationInView:[self view]];
    //creamos un punto, que es la diferencia en x e y al punto inicial
    CGPoint diference=CGPointMake(actualPointBall2.x-punto.x,
                                  actualPointBall2.y-punto.y);
    NSLog(@"movemos hacia:x%f  y:%f",diference.x,diference.y);
   actualPointBall2=punto;//actualizamos punto actual, que se ha movido
/*   \---comentando esto
 Si no voy actualizando el punto incial, las diferencias enpre el punto inicial y el final son cada vez más grandes.
 */    
    ball2.center=CGPointMake(ball2.center.x-diference.x,
                             ball2.center.y-diference.y)  ;
}
-(IBAction)stopMoveBall2:(id) sender withEvent:(UIEvent *) event
{
    NSLog(@"Soltamos en :x:%f  y:%f",ball2.center.x,ball2.center.y);
    [self ejecutarSonido];
}

/*
 
 
 
 
 
 */

- (IBAction)touchBall2:(id)sender {
   continuarAnimacion=NO;
//    [self ejecutarSonido];
    [UIView animateWithDuration:1.7 
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         //movimiento ala de pajaro
         
         CGAffineTransform swingTransform = CGAffineTransformIdentity;
         swingTransform = CGAffineTransformRotate(swingTransform, DegreesToRadians(300));
         ball2.transform = swingTransform;   
         ball2.center=CGPointMake(ball2.center.x-5, ball2.center.y-5);
     }      
                     completion:^(BOOL finished) 
     {
         ball2.center=CGPointMake(150,150);
         CGAffineTransform swingTransform = CGAffineTransformIdentity;
          ball2.transform = swingTransform;   
     }
     
     ];
//-----fin animacion bird blue
    
}


-(void)ejecutarSonido
{
    NSURL *url=[[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle] 
                                                 pathForResource:@"bird" ofType:@"mp3"] ];
    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];    
//audioPlayer.volume=0.6;
    [audioPlayer prepareToPlay];
    [audioPlayer play];

   
    

}

-(void)animarFase1Bola
{

//    NSLog(@"el valor de numeroVeces es:%d",numeroVeces);

    if (continuarAnimacion){
        [UIView animateWithDuration:0.7 
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
