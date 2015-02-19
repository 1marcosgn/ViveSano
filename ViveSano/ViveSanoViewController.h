//
//  ViveSanoViewController.h
//  ViveSano
//
//  Created by Claudia Oliva on 20/03/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViveSanoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    
    IBOutlet UIScrollView *scrollPrincipal;
    
    IBOutlet UIScrollView *scrollCalorias;
    
    IBOutlet UITextField *textResultado;
    IBOutlet UILabel *labelResultado;
    
    IBOutlet UITextField *textPeso;
    IBOutlet UITextField *textAltura;
    
    IBOutlet UIButton *botonDetails;
    
    IBOutlet UIProgressView *progressImc;
    
    IBOutlet UILabel *labelImc;
    
    NSTimer *timer;
    
    IBOutlet UILabel *pesoBajo;
    IBOutlet UILabel *pesoNormal;
    IBOutlet UILabel *pesoAlto;
    
    IBOutlet UILabel *labelProspecta;
    
    IBOutlet UILabel *labelReduccion;
    IBOutlet UILabel *labelSeleccion;
    
    
    IBOutlet UILabel *labelDespues;
    
    IBOutlet UISlider *slider;
    
    IBOutlet UILabel *valorResta;
    IBOutlet UILabel *labelResultante;
    
    IBOutlet UILabel *descripcionSlider;
    
    
#pragma mark Metodos Calorias
    IBOutlet UIImageView *consumoCalorias01;
    
    
     IBOutlet UIImageView *consumoCalorias02;
     IBOutlet UIImageView *consumoCalorias03;
     IBOutlet UIImageView *consumoCalorias04;
     IBOutlet UIImageView *consumoCalorias05;
     IBOutlet UIImageView *consumoCalorias06;
     IBOutlet UIImageView *consumoCalorias07;
     IBOutlet UIImageView *consumoCalorias08;
     IBOutlet UIImageView *consumoCalorias09;
   
    IBOutlet UILabel * sumatoriaCalorias;
    
#pragma mark Metodos Fotografia
    UIImageView *imagenView;
    UIButton *abrirGaleria;
    UIButton *tomarFoto;
    
}

@property (nonatomic, retain) IBOutlet UIImageView *imagenView;
@property (nonatomic, retain) IBOutlet UIButton *abrirGaleria;
@property (nonatomic, retain) IBOutlet UIButton *tomarFoto;

-(IBAction)abrirGaleria:(id)sender;
-(IBAction)tomarFoto:(id)sender;


-(IBAction)GuardarDato:(id)sender;
-(IBAction)CargarDato:(id)sender;

-(IBAction)ocultarTeclado:(id)sender;



-(IBAction)dimeIMC;


-(void)Progreso01;
-(void)Progreso02;
-(void)Progreso03;
-(void)Progreso04;
-(void)Progreso05;
-(void)Progreso06;

-(IBAction)ProspectarIMC:(id)sender;

-(IBAction)GuardarReduccion:(id)sender;
-(IBAction)CargarReduccion:(id)sender;

//-(IBAction)reduceSlider:(id)sender;

-(IBAction)CambioSlider:(id)sender;


 #pragma mark - Alimentos Impacto
 -(IBAction)Alimento01:(id)sender;
 -(IBAction)Alimento02:(id)sender;
 -(IBAction)Alimento03:(id)sender;
 -(IBAction)Alimento04:(id)sender;
 -(IBAction)Alimento05:(id)sender;
 -(IBAction)Alimento06:(id)sender;
 -(IBAction)Alimento07:(id)sender;
 -(IBAction)Alimento08:(id)sender;
 -(IBAction)Alimento09:(id)sender;


@end
