//
//  ViveSanoViewController.m
//  ViveSano
//
//  Created by Claudia Oliva on 20/03/12.
//  Copyright (c) 2012 ASTA. All rights reserved.
//

#import "ViveSanoViewController.h"
#import "OperacionesIMC.h"


@interface ViveSanoViewController ()

@end

@implementation ViveSanoViewController

@synthesize imagenView, abrirGaleria, tomarFoto;

- (void)viewDidLoad
{
   
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"backBlue.jpg"]];
    
    
    [super viewDidLoad];
    
    //scrollCalorias
    [scrollPrincipal setScrollEnabled:YES];
    [scrollPrincipal setContentSize:CGSizeMake(50, 100)];
    
    //scrollCalorias
    [scrollCalorias setScrollEnabled:YES];
    [scrollCalorias setContentSize:CGSizeMake(50, 907)];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Metodos de Programa

-(IBAction)GuardarDato:(id)sender{
    
    NSString *savestring = textResultado.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:savestring forKey:@"savestring"];
    [defaults synchronize];
    
}

-(IBAction)CargarDato:(id)sender{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadstring = [defaults objectForKey:@"savestring"];
    [textResultado setText:loadstring];
    [labelResultado setText:loadstring];
    
    
}

-(IBAction)ocultarTeclado:(id)sender{
    
    
}

#pragma mark - Metodos referencias a Clases

-(IBAction)dimeIMC{
    
    float peso, altura, valorImc;
    
    peso = [textPeso.text floatValue];
    altura = [textAltura.text floatValue];
    
    
    valorImc = [[OperacionesIMC objIMC] calcularIMC:peso altura:altura];
    
    textResultado.text = [NSString stringWithFormat:@"%f", valorImc];
    

    
    
    
    
    //Verificamos la validez de los datos...
    if ([textResultado.text isEqualToString:@"nan"] || [textResultado.text isEqualToString:@"inf"] || [textResultado.text isEqualToString:@"0.000000"]) {
        
        textResultado.text = @"";
        textAltura.text = @"";
        textPeso.text = @"";
        botonDetails.enabled = FALSE;
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Espere" message:@"Complete los campos con valores numericos" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];


    }
    else {
        //Si todo sale bien se almacenan los datos...
        NSString *savestring = textResultado.text;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:savestring forKey:@"savestring"];
        [defaults synchronize];
        
        botonDetails.enabled = TRUE;
    }
     
    
}

-(IBAction)estabilizarProgress:(id)sender{
    
    //Inicialmente se carga el valor del IMC calculado.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadstring = [defaults objectForKey:@"savestring"];
    [textResultado setText:loadstring];
    [labelResultado setText:loadstring];

    
    
    //Ese valor se convierte a un tipo float
    float imc= [labelImc.text floatValue];
    
    //con el valor tipo float se manipula el estado del progressView dependiendo del rango definido
    
    if (imc < 20) {
        
        NSLog(@"Peso BAJO");
        
        progressImc.progress = 0.0;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.026 target:self selector:@selector(Progreso01) userInfo: nil repeats:YES];
        
        pesoBajo.textColor = [UIColor redColor];
        pesoNormal.textColor = [UIColor grayColor];
        pesoAlto.textColor = [UIColor grayColor];
        
    }
    
    if (imc>20 && imc<22) {
        NSLog(@"Peso NORMAL");
        
        progressImc.progress = 0.0;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.026 target:self selector:@selector(Progreso02) userInfo: nil repeats:YES];
        
        pesoNormal.textColor = [UIColor blueColor];
        pesoBajo.textColor = [UIColor grayColor];
        pesoAlto.textColor = [UIColor grayColor];
    }
    
    if (imc>22 && imc<25) {
        NSLog(@"Peso NORMAL");
        
        progressImc.progress = 0.0;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.026 target:self selector:@selector(Progreso03) userInfo: nil repeats:YES];
        
        pesoNormal.textColor = [UIColor blueColor];
        pesoBajo.textColor = [UIColor grayColor];
        pesoAlto.textColor = [UIColor grayColor];
    }
    
    if (imc>25 && imc<27) {
        NSLog(@"Sobre Peso");
        
        progressImc.progress = 0.0;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.026 target:self selector:@selector(Progreso04) userInfo: nil repeats:YES];
        pesoNormal.textColor = [UIColor grayColor];
        pesoBajo.textColor = [UIColor grayColor];
        pesoAlto.textColor = [UIColor redColor];
        
    }
    
    if (imc>27 && imc<28) {
        NSLog(@"Sobre Peso");
        
        progressImc.progress = 0.0;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.026 target:self selector:@selector(Progreso05) userInfo: nil repeats:YES];
        
        pesoNormal.textColor = [UIColor grayColor];
        pesoBajo.textColor = [UIColor grayColor];
        pesoAlto.textColor = [UIColor redColor];
        
    }
    
    if (imc>28) {
        NSLog(@"Obesidad");
        
        progressImc.progress = 0.0;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.026 target:self selector:@selector(Progreso06) userInfo: nil repeats:YES];
        
        pesoNormal.textColor = [UIColor grayColor];
        pesoBajo.textColor = [UIColor grayColor];
        pesoAlto.textColor = [UIColor redColor];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Precaución" message:@"Usted sufre un grave problema de Obesidad, contacte a su médico a la brevedad" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];

        
    }
    
    //Se evalua el valor de perdida.
    float valor = [labelResultado.text floatValue];
    
    labelProspecta.text = [[OperacionesIMC objIMC] Reducir:valor];

    
}

-(void)Progreso01{
    
    progressImc.progress = progressImc.progress +.01;
    
    if (progressImc.progress > 0.20 && progressImc.progress < 0.21) {
        
        [timer invalidate];
    }
    
}
-(void)Progreso02{
    
    progressImc.progress = progressImc.progress +.01;
    
    if (progressImc.progress > 0.49 && progressImc.progress < 0.50) {
        
        [timer invalidate];
    }
    
}
-(void)Progreso03{
    
    progressImc.progress = progressImc.progress +.01;
    
    if (progressImc.progress > 0.60 && progressImc.progress < 0.61) {
        
        [timer invalidate];
    }
    
}
-(void)Progreso04{
    
    progressImc.progress = progressImc.progress +.01;
    
    if (progressImc.progress > 0.70 && progressImc.progress < 0.71) {
        
        [timer invalidate];
    }
    
}
-(void)Progreso05{
    
    progressImc.progress = progressImc.progress +.01;
    
    if (progressImc.progress > 0.80 && progressImc.progress < 0.81) {
        
        [timer invalidate];
    }
    
}
-(void)Progreso06{
    
    progressImc.progress = progressImc.progress +.01;
    
    if (progressImc.progress > 0.99 && progressImc.progress < 0.100) {
        
        [timer invalidate];
    }
    
}


-(IBAction)ProspectarIMC:(id)sender{
    
    float valor = [labelResultado.text floatValue];
    
    labelProspecta.text = [[OperacionesIMC objIMC] Reducir:valor];
    
    
}

-(IBAction)GuardarReduccion:(id)sender{
    
    NSString *savestring = labelReduccion.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:savestring forKey:@"savestring01"];
    [defaults synchronize];
    
}

-(IBAction)CargarReduccion:(id)sender{
    
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString *loadstring1 = [defaults1 objectForKey:@"savestring"];
    [textResultado setText:loadstring1];
    [labelResultado setText:loadstring1];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadstring = [defaults objectForKey:@"savestring01"];
    [labelSeleccion setText:loadstring];
    [labelReduccion setText:loadstring];
    
    float valor01, valor02;
    
    valor01 = [labelResultado.text floatValue];
    
    valor02 = valor01 - 1.0000;
    
    NSString *sobrante = [NSString stringWithFormat:@"%f", valor02];
    
    labelResultante.text = sobrante;
    
    slider.enabled = TRUE;
    
}

-(IBAction)CambioSlider:(id)sender{
    
    UISlider *slider1 = (UISlider *)sender; 
    
    NSString *newText = [[NSString alloc] initWithFormat:@"%1.2f", slider1.value];    
    labelDespues.text = newText; 
    
    float valorMaximo = [labelSeleccion.text floatValue];
    
    //Definimos los valores iniciales del Slider...
    slider1.minimumValue = 1.0;
    
    slider1.maximumValue = valorMaximo;
    
    //labelResultante.text = [NSString stringWithFormat:@"%f",despues];
    
    float ahora = [labelResultado.text floatValue];
    float seleccionado = [valorResta.text floatValue];
    
    labelResultante.text = [[OperacionesIMC objIMC] RestadeImc:ahora :seleccionado];
    
    //labelDespues.text = @"1.00";
    
}

bool noConsumire01 = TRUE;
bool noConsumire02 = TRUE;
bool noConsumire03 = TRUE;
bool noConsumire04 = TRUE;
bool noConsumire05 = TRUE;
bool noConsumire06 = TRUE;
bool noConsumire07 = TRUE;
bool noConsumire08 = TRUE;
bool noConsumire09 = TRUE;

float valorCalorias = 0.0;


#pragma mark - Alimentos Impacto
-(IBAction)Alimento01:(id)sender{
    
    if (noConsumire01 == TRUE) {
        consumoCalorias01.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire01 = FALSE;
        
        valorCalorias = valorCalorias + 0.07;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        
    }
    else {
        consumoCalorias01.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire01 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.07;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
        
    }
}

-(IBAction)Alimento02:(id)sender{
    
    if (noConsumire02 == TRUE) {
        consumoCalorias02.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire02 = FALSE;
        
        valorCalorias = valorCalorias + 0.05;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        
    }
    else {
        consumoCalorias02.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire02 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.05;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
    }
    
}
-(IBAction)Alimento03:(id)sender{
    if (noConsumire03 == TRUE) {
        consumoCalorias03.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire03 = FALSE;
        
        valorCalorias = valorCalorias + 0.02;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];

    }
    else {
        consumoCalorias03.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire03 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.02;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
        
    }
}
-(IBAction)Alimento04:(id)sender{
    if (noConsumire04 == TRUE) {
        consumoCalorias04.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire04 = FALSE;
        
        valorCalorias = valorCalorias + 0.02;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];

    }
    else {
        consumoCalorias04.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire04 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.02;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
        
    }
}
-(IBAction)Alimento05:(id)sender{
    if (noConsumire05 == TRUE) {
        consumoCalorias05.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire05 = FALSE;
        
        valorCalorias = valorCalorias + 0.05;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
    }
    else {
        consumoCalorias05.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire05 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.05;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
        
    }
}
-(IBAction)Alimento06:(id)sender{
    if (noConsumire06 == TRUE) {
        consumoCalorias06.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire06 = FALSE;
        
        valorCalorias = valorCalorias + 0.05;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
    }
    else {
        consumoCalorias06.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire06 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.05;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }

    }
}
-(IBAction)Alimento07:(id)sender{
    if (noConsumire07 == TRUE) {
        consumoCalorias07.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire07 = FALSE;
        
        valorCalorias = valorCalorias + 0.10;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
    }
    else {
        consumoCalorias07.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire07 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.10;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
        
    }
}
-(IBAction)Alimento08:(id)sender{
    if (noConsumire08 == TRUE) {
        consumoCalorias08.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire08 = FALSE;
        
        valorCalorias = valorCalorias + 0.07;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
    }
    else {
        consumoCalorias08.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire08 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.07;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
        
    }
}
-(IBAction)Alimento09:(id)sender{
    if (noConsumire09 == TRUE) {
        consumoCalorias09.image = [UIImage imageNamed:@"paloma.png"];
        noConsumire09 = FALSE;
        
        valorCalorias = valorCalorias + 0.04;
        sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];

    }
    else {
        consumoCalorias09.image = [UIImage imageNamed:@"tacha.png"];
        noConsumire09 = TRUE;
        
        if(valorCalorias == 0.0)
        {
            valorCalorias = 0.0;
        }
        else {
            valorCalorias = valorCalorias - 0.04;
            sumatoriaCalorias.text = [NSString stringWithFormat:@"%f",valorCalorias];
        }
    }
}

-(IBAction)abrirGaleria:(id)sender{
    
    //Iniciar el controlador
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    //Definir el Delegate
    picker.delegate = self;
    
    //Establecer el origen de la Imagen
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    //Agrega la vista del controlador a la pantalla
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        UIPopoverController *popover = [[UIPopoverController alloc]initWithContentViewController:picker];
        
        //        [popover presentPopoverFromRect:CGRectMake(200, 940.0, 0.0, 0.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        [popover presentPopoverFromRect:CGRectMake(100, 490.0, 0.0, 0.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        
    }
    else {
        [self presentModalViewController:picker animated:YES];
    }
    
    
}

-(IBAction)tomarFoto:(id)sender{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:picker animated:YES];    
}


//Recibe el mensaje cuando el controlador a finalizado.
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //Quita la vista del controlador.
    [picker dismissModalViewControllerAnimated:YES];
    
    //Establece la imagen tomada en el objeto UIImageView.
    imagenView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
}

@end
