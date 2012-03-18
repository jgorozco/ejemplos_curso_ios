//
//  AppDelegate.h
//  animacion2
//
//  Created by INDUSTRIA TRANSF. ESPECIAL SL on 10/03/12.
//  Copyright (c) 2012 INDUSTRIA TRANSFORMADORA ESPECIA SL. All rights reserved.
//

#import <UIKit/UIKit.h>

// esta parte no aparece
@class ViewController;


// esto ya es igual
@interface AppDelegate : UIResponder <UIApplicationDelegate>



@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;
// esta propiedad también la añado
@property (strong, nonatomic) ViewController *viewController;


@end
