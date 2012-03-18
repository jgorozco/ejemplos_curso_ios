//
//  vista2.m
//  animacion2
//
//  Created by INDUSTRIA TRANSF. ESPECIAL SL on 11/03/12.
//  Copyright (c) 2012 INDUSTRIA TRANSFORMADORA ESPECIA SL. All rights reserved.
//

#import "vista1.h"
#import "vista2.h"
#import "vista3.h"
#import <AudioToolbox/AudioToolbox.h>
@implementation vista2


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
    //Cuando iniciamos debemos guardar el frame del pajarito ( x, y, tamanio)
    
    initialFrame=birdgreenimage.frame;
    [self empezarAnimacionRepetitiva];
    //    [NSThread detachNewThreadSelector:<#(SEL)#> toTarget:<#(id)#> withObject:<#(id)#>]

    /*Es similar a poner [self ponerEncimaBoton] pero ejecutandose de manera secuencial, o en un hilo a parte...*/
}
-(void)ponerEncimaBoton
{
    projectileFrame = [[birdgreenimage.layer presentationLayer] frame];
    
    //cogemos el frame de la bola en movimiento
    //   NSLog(@"Pongo encima en:x:%f  y:%f",projectileFrame.origin.x,projectileFrame.origin.y);
    
    [birdblue setFrame:projectileFrame];
    //ponemos el frame
    
}


-(void)empezarAnimacionRepetitiva
{       // los valores son el origen de la animación
    //cuando empezamos animacion le damos el frame inicial o el que decidamos
    birdgreenimage.frame=initialFrame;
    birdgreenimage.center=CGPointMake(500, 1100);
    //iniciamos el timer con la animacion ya que la activaremos en varios momentos.
    if (timer)
    {
        [timer invalidate];
    }
    timer=[NSTimer scheduledTimerWithTimeInterval:0.05 //temporizador. 
                                           target:self//quien va a recibir evento.
                                         selector:@selector(ponerEncimaBoton) //funcion que queremos que se ejecute cada intervalo de tiempo
                                         userInfo:nil repeats:YES];
    
    
    [UIView animateWithDuration:6.0
                          delay:0
                        options:( UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAutoreverse)
                     animations:^
     {      // estros otros el final de la animación
         birdgreenimage.center=CGPointMake(520+birdgreenimage.bounds.size.width, -90);
     }      
                     completion:^(BOOL finished) 
     {
         if (finished)
         
         {
             [self empezarAnimacionRepetitiva2];
             // esto hace que sea repititiva la animación
         }
     }
     
     ];
}       // ahora encadenamos una segunda animación
    -(void)empezarAnimacionRepetitiva2
    {       // los valores son el origen de la animación
        birdgreenimage.center=CGPointMake(400+birdgreenimage.bounds.size.width, 1100);
        
        [UIView animateWithDuration:6.0
                              delay:0
                            options:( UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAutoreverse)
                         animations:^
         {      // estros otros el final de la animación
             birdgreenimage.center=CGPointMake(420+birdgreenimage.bounds.size.width, -70);
         }      
                         completion:^(BOOL finished) 
         {
             if (finished)
             {
                [self empezarAnimacionRepetitiva];
                 // esto hace que sea repititiva la animación
             }
         }
         
         ];

    
}

- (IBAction)touchbirdblue:(id)sender {
 
   [self ejecutarSonido];
    // al ejecutar sonido se ralentiza mucho la animación
    
    // NSLog(@"touchbirdblue");
    
    // esto no se lo que es
    
    //elimina las animaciones de este elemento
    [birdgreenimage.layer removeAllAnimations];
    //para la ejecucion del timer.
    [timer invalidate];
    
    [birdgreenimage setFrame:projectileFrame];
    //tiempo que tarda la imagen en hacerse más pequeña
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^
     {      
         // Esto cambia la imagen del higligted, digamos la sombra
         [birdgreenimage setHighlighted:YES];
         //No es que la animacion no se ejecutara, es que el pajaro tenia un tamanio de 0,0!
         birdgreenimage.frame=CGRectMake(projectileFrame.origin.x, 
                                         // medida que tiene la imagen al final de la animación
                                     projectileFrame.origin.y, 0.0, 0.0);
     }      
                     completion:^(BOOL finished) 
     {
         //al tocarlo, volvemos a empezar otra vez con el ciclo
         [self empezarAnimacionRepetitiva];
     }
      
     ];
    
 
}

// Do any additional setup after loading the view from its nib.


-(void)ejecutarSonido
{
    NSURL *url=[[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle] 
                                                  pathForResource:@"bird" ofType:@"mp3"] ];
    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];    
    audioPlayer.volume=0.6;
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    
    
    
    
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
	return YES;
}

- (IBAction)irvista1:(id)sender {
    
    //Creamos una nueva vista (vista1)
    //creamos controlador                         
    //le pasamos el xib
    vista1 *v11=[[vista1 alloc] initWithNibName:@"vista1" bundle:nil];
    [self.navigationController pushViewController:v11 animated:YES];
    
}

- (IBAction)irvista3:(id)sender {
    //Creamos una nueva vista (vista3)
    //creamos controlador                        
    //le pasamos el xib
    vista3 *v11=[[vista3 alloc] initWithNibName:@"vista3" bundle:nil];
    [self.navigationController pushViewController:v11 animated:YES];


}
@end
