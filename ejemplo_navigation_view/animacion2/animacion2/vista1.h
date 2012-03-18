//
//  vista1.h
//  animacion2
//
//  Created by INDUSTRIA TRANSF. ESPECIAL SL on 10/03/12.
//  Copyright (c) 2012 INDUSTRIA TRANSFORMADORA ESPECIA SL. All rights reserved.
//

#import <UIKit/UIKit.h>
// importamos el avfoundation
#import <AVFoundation/AVFoundation.h>


// definimos la clase vista1 del tipo UIViewController
@interface vista1 : UIViewController 

// de esto no entiendo para que es

{
    int continuarAnimacion;
    
   
    NSTimer *timer;//timer, temporizador.
    CGRect projectileFrame;
    CGPoint actualPointBall2;// punto actual donde hemos tocado.
    AVAudioPlayer *audioPlayer; //Declarar una variable
  
}



// definimos propiedades del boton birdyellow
@property (nonatomic,retain) IBOutlet UIImageView *leafFall;
@property (weak, nonatomic) IBOutlet UIButton *birdyellow;

// definimos propiedades del boton birdgreen
@property (weak, nonatomic) IBOutlet UIButton *birdgreen;

//acción tocar flecha para ir a siguiente vista
- (IBAction)irvista2:(id)sender;


//acción tocar pajaro amarillo para que inicie la animación.
- (IBAction)touchbirdyellow:(id)sender;


// acción tocar pajaro verde para que inicie la animación

- (IBAction)touchbirdgreen:(id)sender;

  //declaramos el metodo animarBirdYellow de la clase Vista1
-(void)animacionHojaCae;
-(void)animararribaBirdYellow;
-(void)animarabajoBirdYellow;
-(void)ejecutarSonido;
-(void)ejecutarSonido2;
-(void)animarBirdGreen;



































@end
