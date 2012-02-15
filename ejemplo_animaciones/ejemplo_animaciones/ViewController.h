//
//  ViewController.h
//  ejemplo_animaciones
//
//  Created by jose garcia on 14/02/12.
//  Copyright (c) 2012 freelance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL continuarAnimacion;


}
@property (weak, nonatomic) IBOutlet UIButton *ball1;
@property (weak, nonatomic) IBOutlet UIButton *ball2;
@property (weak, nonatomic) IBOutlet UIButton *ball3;

- (IBAction)touchBall1:(id)sender;

- (IBAction)touchBall2:(id)sender;
- (IBAction)touchBall3:(id)sender;
-(void)animarFase1Bola;
-(void)animarFase2Bola;
-(void)ejecutarSonido;
@end
