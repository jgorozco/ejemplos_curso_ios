//
//  ViewController.h
//  ejemplo_animaciones
//
//  Created by jose garcia on 14/02/12.
//  Copyright (c) 2012 freelance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController
{
    BOOL continuarAnimacion;
    
    NSTimer *timer;//timer, temporizador.
    CGRect projectileFrame;
    CGPoint actualPointBall2;// punto actual donde hemos tocado.
    AVAudioPlayer *audioPlayer;//Declarar una variable

}
@property (weak, nonatomic) IBOutlet UIButton *ball1;
@property (weak, nonatomic) IBOutlet UIButton *ball2;
@property (weak, nonatomic) IBOutlet UIButton *ball3;
@property (weak, nonatomic) IBOutlet UIImageView *ball_image;
- (IBAction)touchBall1:(id)sender;

- (IBAction)touchBall2:(id)sender;
- (IBAction)touchBall3:(id)sender;
//evento cuando tocas
-(IBAction)beginTouchBall2:(id) sender withEvent:(UIEvent *) event;
//elevento cuando arrastras
-(IBAction)moveBall2:(id) sender withEvent:(UIEvent *) event;
//evento cuando termina
-(IBAction)stopMoveBall2:(id) sender withEvent:(UIEvent *) event;


-(void)animarFase1Bola;
-(void)animarFase2Bola;
-(void)ejecutarSonido;
-(void)ponerEncimaBoton;
-(void)empezarAnimacionRepetitiva;
@end
