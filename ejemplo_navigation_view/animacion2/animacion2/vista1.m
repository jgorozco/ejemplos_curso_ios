//
//  vista1.m
//  animacion2
//
//  Created by INDUSTRIA TRANSF. ESPECIAL SL on 10/03/12.
//  Copyright (c) 2012 INDUSTRIA TRANSFORMADORA ESPECIA SL. All rights reserved.
//

#import "vista1.h"
#import "vista2.h"
#import <AudioToolbox/AudioToolbox.h>

#define DegreesToRadians(X) (X*M_PI/180.0) 

//implementamos la clase vista1, no se porque me aparece este error de implementación incompleta??

@implementation vista1


@synthesize birdyellow;
@synthesize birdgreen;
@synthesize leafFall;
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
    [self animacionHojaCae];
    // Do any additional setup after loading the view from its nib.
}

-(void)animacionHojaCae
{
    //Se puede crear una animacion customizada calculando la aceleracion o bien usar EaseIn
    //que se basa en ir acelerando cada vez mas
    [UIView animateWithDuration:1.0 
                          delay:4.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^
     {
         
         leafFall.center=CGPointMake(leafFall.center.x, 1024);
     }      
                     completion:^(BOOL finished) 
     {

     }
     
     ]; 

}

- (void)viewDidUnload
{
    leafFall = nil;
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
    



//--------- inicio animarbirdyellow


    // no se como hacer para que solo se mueva una par de veces

}

-(void)animararribaBirdYellow
    {
    
       // NSLog(@"el valor de numeroVeces es:%d",numeroVeces);
    //Si queremos que la animacion se ejecute solo 3 veces, cambiamos el tipo de 
    //ContinuarAnimacion a entero
    if (continuarAnimacion<3){
        [UIView animateWithDuration:1.0 
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^
         {
             
             birdyellow.center=CGPointMake(birdyellow.center.x-0, birdyellow.center.y-70);
         }      
                         completion:^(BOOL finished) 
         {
             [self animarabajoBirdYellow];
               [self ejecutarSonido];
             //cada vez que ejecutamos la animacion, aniadimos uno
             continuarAnimacion=continuarAnimacion+1;
             /* si el self animarabajoBirdYellow se sustitulle por animararribaBirYellow, el siguiente void no tiene efecto y la animación sigue una trallectoria hacia arribo o abajo, dependiendo de las coordenadas*/
         }
       
         ]; 
    }else
    {
            [birdyellow.imageView stopAnimating];
        //Cuando terminamos la animacion volvemos a poner la imagen original
        birdyellow.imageView.image=[UIImage imageNamed:@"birdblue1.png"];
    }
  
}

   
-(void)animarabajoBirdYellow

{
    
    [UIView animateWithDuration:1.7 
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         
         birdyellow.center=CGPointMake(birdyellow.center.x+0, birdyellow.center.y+70);
     }      
                     completion:^(BOOL finished) 
     {
         [self animararribaBirdYellow];
         
     }
     
     ];
     
}

     

- (IBAction)touchbirdyellow:(id)sender {
    continuarAnimacion=0;
    //Cuando tocamos el elemento, dentro tiene un imageview,
    //el cual puede añadirsele unc onjunto de imagenes, las cuales se deben programar
    //de tal manera que cierren la animacion
    birdyellow.imageView.animationImages = [NSArray arrayWithObjects: 
                                 [UIImage imageNamed:@"birdblue11.png"],                                  
                                 [UIImage imageNamed:@"birdblue12.png"],                              
                                 [UIImage imageNamed:@"birdblue13.png"],
                                            [UIImage imageNamed:@"birdblue14.png"],                                  
                                            [UIImage imageNamed:@"birdblue13.png"],                              
                                            [UIImage imageNamed:@"birdblue12.png"],nil];
    //cuantas veces repetimos la animacion
    birdyellow.imageView.animationRepeatCount = 30;
    //cuanto dura la animacion de las imagenes
    birdyellow.imageView.animationDuration = 0.5;
    [birdyellow.imageView startAnimating];

    [self animararribaBirdYellow];
    
    /*[self animararribaBirdYellow]; dependieno si se pone esto o [self animarabajoBirdYellow]; inicia la animación hacia arriba o hacia abajo.
     
     */
  // [self animarabajoBirdYellow];


{

/* esto no se para lo que es
    [self setBirdyellow:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
*/

}  

    
    /* añadimos sonido, este sonido lo podemos aplicar a cualquier evento con [self ejecutarsonico] no olvidar importar el framewor avfoundation
     Los dos sonido no se pueden superponer, no suenan a la vez.
     
    */
    //--------- fin animacion birdyellow
    
    
    
    //-------- inicio sonidos
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


-(void)ejecutarSonido2
{
    NSURL *url=[[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle] 
                                                  pathForResource:@"pato1" ofType:@"mp3"] ];
    audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];    
    audioPlayer.volume=0.6;
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    
    
    
    //---------fin sonidos
}
    
         
// esto lo he copiado del otro programa, no se lo que es


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




//-----------iniciamos animación del bridgreen
    



-(void)animarBirdGreen

{
        if (continuarAnimacion<3){  // hay que poner esto para que continue la animacion
    [UIView animateWithDuration:1.7 
                          delay:1.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         /* si ponemos las dos coordenadas seguidas el primer desplazamiento lo hace muy rápido, solo tiene en cuenta el ultimo parr desplazarse con la duración */
         
      //   birdgreen.center=CGPointMake(birdgreen.center.x+0, birdgreen.center.y-70);
     
        // birdgreen.center=CGPointMake(birdgreen.center.x+70, birdgreen.center.y-0);
         
         birdgreen.center=CGPointMake(birdgreen.center.x-70, birdgreen.center.y-20);
     }
                     completion:^(BOOL finished) 
     {         
[self animarBirdGreen];
         [self ejecutarSonido2];
     }
     
     ];
    
}

}

- (IBAction)touchbirdgreen:(id)sender {
    //en vez de YES, decimos que es 0 e iremos aniadiendo 1 por cada iteracion
   continuarAnimacion=0; // con esto
    [self animarBirdGreen];
    
}
@end
