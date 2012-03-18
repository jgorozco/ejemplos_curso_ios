//
//  vista2.h
//  animacion2
//
//  Created by INDUSTRIA TRANSF. ESPECIAL SL on 11/03/12.
//  Copyright (c) 2012 INDUSTRIA TRANSFORMADORA ESPECIA SL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "vista1.h"
#import "vista3.h"

@interface vista2 : UIViewController

{
    BOOL continuarAnimacion;
    
    NSTimer *timer;//timer, temporizador.
    CGRect projectileFrame;
    CGRect initialFrame;
    CGPoint actualPointBall2;// punto actual donde hemos tocado.
    AVAudioPlayer *audioPlayer;//Declarar una variable
    
}

@property (weak, nonatomic) IBOutlet UIButton *birdblue;
@property (weak, nonatomic) IBOutlet UIImageView *birdgreenimage;


- (IBAction)irvista1:(id)sender;
- (IBAction)irvista3:(id)sender;
- (IBAction)touchbirdblue:(id)sender;



-(void)ponerEncimaBoton;
-(void)empezarAnimacionRepetitiva;
-(void)empezarAnimacionRepetitiva2;
-(void)ejecutarSonido;


@end
