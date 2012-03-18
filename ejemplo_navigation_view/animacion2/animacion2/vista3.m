//
//  vista3.m
//  animacion2
//
//  Created by INDUSTRIA TRANSF. ESPECIAL SL on 12/03/12.
//  Copyright (c) 2012 INDUSTRIA TRANSFORMADORA ESPECIA SL. All rights reserved.
//

#import "vista1.h"
#import "vista2.h"
#import "vista3.h"
#import <AudioToolbox/AudioToolbox.h>

#define DegreesToRadians(X) (X*M_PI/180.0) 

@implementation vista3

@synthesize birdgreen;
@synthesize birdblue;
@synthesize birdgreenimage;




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
//-------inicio animacion birdgreen
-(void)animararribaBirdGreen
{
    
    // NSLog(@"el valor de numeroVeces es:%d",numeroVeces);
    
    if (continuarAnimacion){
        [UIView animateWithDuration:2.0 
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^
         {
             
             birdgreen.center=CGPointMake(birdgreen.center.x-50, birdgreen.center.y-150);
         }      
                         completion:^(BOOL finished) 
         {
             [self animararribaBirdGreen];
             //[self ejecutarSonido];
             /* si el self animarabajoBirdYellow se sustitulle por animararribaBirYellow, el siguiente void no tiene efecto y la animación sigue una trallectoria hacia arribo o abajo, dependiendo de las coordenadas*/
         }
         
         ]; 
        //-------------fin animacion desplazamiento
    }
}

//--------- inicio animacion rotacion----------



-(IBAction)beginTouchBirdblue:(id)sender withEvent:(UIEvent *)event
{
    actualPointBirdblue=[[[event allTouches] anyObject] locationInView:[self view]];
}

-(IBAction)moveBirdblue:(id) sender withEvent:(UIEvent *) event
{
    //cogemos otro punto
    CGPoint punto=[[[event allTouches] anyObject] locationInView:[self view]];
    //creamos un punto, que es la diferencia en x e y al punto inicial
    CGPoint diference=CGPointMake(actualPointBirdblue.x-punto.x,
                                  actualPointBirdblue.y-punto.y);
    NSLog(@"movemos hacia:x%f  y:%f",diference.x,diference.y);
    actualPointBirdblue=punto;//actualizamos punto actual, que se ha movido
    /*   \---comentando esto
     Si no voy actualizando el punto incial, las diferencias enpre el punto inicial y el final son cada vez más grandes.
     */    
    birdblue.center=CGPointMake(birdblue.center.x-diference.x,
                             birdblue.center.y-diference.y)  ;
}
-(IBAction)stopMoveBirdblue:(id)sender withEvent:(UIEvent *)event
{
    NSLog(@"Soltamos en :x:%f  y:%f",birdblue.center.x,birdblue.center.y);
   // [self ejecutarSonido];
}



- (IBAction)touchbirdblue:(id)sender {
    continuarAnimacion=YES;   // Si  ponemos NO, al tocar birdblue se para esta
     [self ejecutarSonido];
    [UIView animateWithDuration:1.7 
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         //movimiento ala de pajaro
         
         CGAffineTransform swingTransform = CGAffineTransformIdentity;
         swingTransform = CGAffineTransformRotate(swingTransform, DegreesToRadians(300));
         birdblue.transform = swingTransform;   
         birdblue.center=CGPointMake(birdblue.center.x-5, birdblue.center.y-5);
     }      
                     completion:^(BOOL finished) 
     {
         birdblue.center=CGPointMake(500,500);
         CGAffineTransform swingTransform = CGAffineTransformIdentity;
         birdblue.transform = swingTransform;   
     }
     
     ];
    



//--------fin animacion rotacion-------------------
    
//-----inicio sonio birdblue    
}
    -(void)ejecutarSonido
    {
        NSURL *url=[[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle] 
                                                      pathForResource:@"bird" ofType:@"mp3"] ];
        audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];    
        audioPlayer.volume=0.6;
        [audioPlayer prepareToPlay];
        [audioPlayer play];
        
        
        
        
    }

    
    
//------fin sonido birdblue
    
    

    - (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
- (IBAction)irvista2:(id)sender {
    
    //Creamos una nueva vista (vista2)
    //creamos controlador                        
    //le pasamos el xib
    vista2 *v11=[[vista2 alloc] initWithNibName:@"vista2" bundle:nil];
    [self.navigationController pushViewController:v11 animated:YES];

    
}
        
- (IBAction)touchbirdgreen:(id)sender{
    
    continuarAnimacion=YES;
    [self animararribaBirdGreen];


}
  
   
@end
