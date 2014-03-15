//
//  MainViewController.h
//  TaskApp1
//
//  Created by GK Reddy on 3/15/14.
//  Copyright (c) 2014 gkSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface MainViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIDocumentInteractionControllerDelegate>
{
    NSString *messageString;
    UIButton *postButton;
    
    SLComposeViewController *mySLComposerSheet;
    UINavigationBar *navBar;
    
}
@property (nonatomic, retain) UIDocumentInteractionController *dic;

@end
