//
//  OperacionesIMC.m
//  ViveSano
//
//  Created by Claudia Oliva on 21/03/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import "OperacionesIMC.h"

@interface OperacionesIMC ()

@end

@implementation OperacionesIMC

static OperacionesIMC *objIMC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Implementacion

+(OperacionesIMC *)objIMC{
    
    if (objIMC == nil) {
        objIMC = [[OperacionesIMC alloc]init];
    }
    return objIMC;
}

-(float)calcularIMC:(float)peso altura:(float)altura{
    
    float imc = 0.0;
    
    float alturaCuad = altura * altura;
    
    imc = peso / alturaCuad;
    
    imc = imc * 10000;
    
    return imc;
    
}

-(NSString *)Reducir:(float)imcActual{
    
    float prospecta = 0.0;
    NSString *prospText = @"";
    
    if (imcActual > 25) {
        
        prospecta = imcActual - 25;
        
        prospText = [NSString stringWithFormat:@"%f",prospecta];
        
        return prospText;
        
    }
    
    if (imcActual > 20 && imcActual < 25) {
        
        prospecta = imcActual - 20;
        
        prospText = [NSString stringWithFormat:@"%f",prospecta];
        
        //return @"Rango Adecuado";
        
        return prospText;
    }
    
    if (imcActual < 20) {
        
        prospecta = 25 - imcActual;
        
        prospText = [NSString stringWithFormat:@"%f",prospecta];
        
        //return @"Ocupa Aumentar";
        
        return prospText;
       
        
    }
    
    return prospText;
    
}

-(NSString *)RestadeImc:(float)ahora:(float)seleccionado{
    
    float despues = 0.0;
    
    despues = ahora - seleccionado;
    
    NSString *resImc =  [NSString stringWithFormat:@"%f",despues];
    
    return resImc;
    
}

@end
