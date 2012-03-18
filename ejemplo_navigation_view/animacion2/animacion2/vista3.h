//
//  vista3.h
//  animacion2
//
//  Created by INDUSTRIA TRANSF. ESPECIAL SL on 12/03/12.
//  Copyright (c) 2012 INDUSTRIA TRANSFORMADORA ESPECIA SL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "vista2.h"
#import "vista3.h"


@interface vista3 : UIViewController

{
    BOOL continuarAnimacion;  // Esto no se lo que es
    
    NSTimer *timer;//timer, temporizador.
    CGRect projectileFrame;
    CGPoint actualPointBirdblue;// punto actual donde hemos tocado.
    AVAudioPlayer *audioPlayer;//Declarar una variable
    
}

@property (weak, nonatomic) IBOutlet UIButton *birdgreen;
@property (weak, nonatomic) IBOutlet UIImageView *birdgreenimage;
@property (weak, nonatomic) IBOutlet UIButton *birdblue;
- (IBAction)irvista2:(id)sender;
- (IBAction)touchbirdgreen:(id)sender;

- (IBAction)touchbirdblue:(id)sender;


//evento cuando tocas
-(IBAction)beginTouchBirdblue:(id) sender withEvent:(UIEvent *) event;
//elevento cuando arrastras
-(IBAction)moveBirdblue:(id) sender withEvent:(UIEvent *) event;
//evento cuando termina
-(IBAction)stopMoveBirdblue:(id) sender withEvent:(UIEvent *) event;



-(void)animararribaBirdGreen;
-(void)ejecutarSonido;


@end
