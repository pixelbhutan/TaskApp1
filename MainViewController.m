//
//  MainViewController.m
//  Task1
//
//  Created by GK Reddy on 3/14/14.
//  Copyright (c) 2014 gkSolutions. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    
        
    UITextField *textField1= [[UITextField alloc]initWithFrame:
                              CGRectMake(10, 85, 280, 30)];
    textField1.delegate = self;
    textField1.font =[UIFont systemFontOfSize:16];
    textField1.tag = 3001;
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField1.placeholder = @"Enter Message here";
    [self.view addSubview:textField1];
    
    
    postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [postButton setFrame:CGRectMake(10, 140, 200, 200)];
    postButton.tag = 3002;
    postButton.backgroundColor = [UIColor lightGrayColor];
    //[postButton setTitle:@"Submit" forState:UIControlStateNormal];
    [postButton addTarget:self action:@selector(submitButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    postButton.userInteractionEnabled = YES;
    [self.view addSubview:postButton];
    
    UIButton *fbButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [fbButton setFrame:CGRectMake(220, 140, 80, 30)];
    fbButton.tag = 3003;
    [fbButton setTitle:@"FaceBook" forState:UIControlStateNormal];
    [self.view addSubview:fbButton];
    [fbButton addTarget:self action:@selector(faceBookButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *twButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [twButton setFrame:CGRectMake(220, 190, 80, 30)];
    twButton.tag = 3004;
    [twButton setTitle:@"Twitter" forState:UIControlStateNormal];
    [self.view addSubview:twButton];
    [twButton addTarget:self action:@selector(twitterButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *instButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [instButton setFrame:CGRectMake(220, 240, 80, 30)];
    instButton.tag = 3005;
    [instButton setTitle:@"Instagram" forState:UIControlStateNormal];
    [self.view addSubview:instButton];
    [instButton addTarget:self action:@selector(instagramButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    navBar = self.navigationController.navigationBar;
    //UIImage *image = [UIImage imageNamed:@"nab_bar.png"];
    UIImage *image = [UIImage imageNamed:@"navigationBackground-7.png"];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    messageString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    
    
    
    return YES;
}

-(void)submitButtonClicked
{
    UIImagePickerController *pickerController=[[UIImagePickerController alloc]init];
    pickerController.delegate = self;
    pickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pickerController animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [postButton setImage:image forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}
-(void)faceBookButtonClicked
{
    mySLComposerSheet = [[SLComposeViewController alloc] init];
    mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];    [mySLComposerSheet setInitialText:messageString];
    [mySLComposerSheet addImage:[postButton imageForState:UIControlStateNormal]];
    
    [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Post Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Posted Successfull";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
    
}

-(void)twitterButtonClicked
{
    mySLComposerSheet = [[SLComposeViewController alloc] init];
    mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [mySLComposerSheet setInitialText:messageString];
    [mySLComposerSheet addImage:[postButton imageForState:UIControlStateNormal]];
    
    [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Post Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Posted Successfull";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
    
}

-(void)instagramButtonClicked
{
    
    CGRect rect = CGRectMake(0 ,0 , 0, 0);
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIGraphicsEndImageContext();
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/test.igo"];
    
    NSURL *igImageHookFile = [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"file://%@", jpgPath]];
    //    NSURL *igImageHookFile = [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"file://%@", screenshot]];
    
    self.dic.UTI = @"com.instagram.photo";
    self.dic = [self setupControllerWithURL:igImageHookFile usingDelegate:self];
    self.dic=[UIDocumentInteractionController interactionControllerWithURL:igImageHookFile];
    [self.dic presentOpenInMenuFromRect: rect    inView: self.view animated: YES ];
    self.dic.annotation = [NSDictionary dictionaryWithObject:@"Here Give what you want to share" forKey:@"InstagramCaption"];
    
    
    
}


- (UIDocumentInteractionController *) setupControllerWithURL: (NSURL*) fileURL usingDelegate: (id <UIDocumentInteractionControllerDelegate>) interactionDelegate
{
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
    interactionController.delegate = interactionDelegate;
    return interactionController;
    
}


@end
