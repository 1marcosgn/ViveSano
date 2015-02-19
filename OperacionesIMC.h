//
//  OperacionesIMC.h
//  ViveSano
//
//  Created by Claudia Oliva on 21/03/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperacionesIMC : UIViewController

+(OperacionesIMC *)objIMC;

-(float)calcularIMC:(float)peso altura:(float)altura;

-(NSString *)Reducir:(float)imcActual;

-(NSString *)RestadeImc:(float)ahora:(float)seleccionado;

@end
