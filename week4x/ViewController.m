//
//  ViewController.m
//  week4x
//
//  Created by Janis Jae on 8/23/12.
//  Copyright (c) 2012 Janis Jae. All rights reserved.
//

#import "ViewController.h"

#define LOGIN_BUTTON 0
#define DATE_BUTTON 1
#define INFO_BUTTON 2

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    self.view.backgroundColor = [UIColor whiteColor];
    
    userLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 90.0f, 30.0f)];
    if (userLabel != nil)
    {
        userLabel.text = @"Username: ";
    }
    [self.view addSubview:userLabel];
    
    txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(100.0f, 10.0f, 200.0f, 30.0f)];
    if (txtUsername != nil)
    {
        txtUsername.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:txtUsername];
    }
    
    
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (loginButton != nil) {
        loginButton.tag = LOGIN_BUTTON;
        loginButton.frame = CGRectMake(10.0f, 50.0f, 75.0f, 35.0f);
        loginButton.tintColor = [UIColor purpleColor];
        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginButton];
    }
    
    loginTxt = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 90.0f, 300.0f, 70.0f)];
    if (loginTxt != nil)
    {
        loginTxt.text = @"Please Enter Username";
    }
    [self.view addSubview:loginTxt];
    
    dateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (dateButton != nil) {
        dateButton.tag = DATE_BUTTON;
        dateButton.frame = CGRectMake(10.0f, 170.0f, 100.0f, 35.0f);
        dateButton.tintColor = [UIColor purpleColor];
        [dateButton setTitle:@"Show Date" forState:UIControlStateNormal];
        [dateButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dateButton];
    }
    
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    if (infoButton != nil) {
        infoButton.tag = INFO_BUTTON;
        infoButton.frame = CGRectMake(10.0f, 250.0f, 25.0f, 25.0f);
        infoButton.tintColor = [UIColor purpleColor];
        [infoButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:infoButton];
    }
    myInfo = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 280.0f, 300.0f, 70.0f)];
    if (myInfo != nil)
    {
        
    }
    [self.view addSubview:myInfo];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)onClick:(UIButton*)button
{
    if(button.tag == LOGIN_BUTTON && txtUsername.text == 0)
    {
        loginTxt.text = @"Username cannot be empty";
        loginTxt.textColor = [UIColor redColor];
    }else if (button.tag == LOGIN_BUTTON)
    {
        NSString *theUser = [[NSString alloc] initWithString:txtUsername.text];
        loginTxt.text = [NSString stringWithFormat:@"User: '%@' is logged in", theUser];
        loginTxt.textColor = [UIColor purpleColor];
        loginTxt.numberOfLines = 3;
    }else if (button.tag == DATE_BUTTON)
    {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (dateFormatter != nil)
        {
            [dateFormatter setDateFormat:@"MMMM d, yyyy h:mm:s:a zzzz"];
            NSString* dateLabel = [dateFormatter stringFromDate:date];
            UIAlertView *dateAlertView = [[UIAlertView alloc] initWithTitle:@"Date" message:dateLabel delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(dateAlertView != nil)
            {
                [dateAlertView show];
            }
        }
    }else if (button.tag == INFO_BUTTON)
    {
        myInfo.text = @"This application was created by:                   Jae Rowe";
        myInfo.textAlignment = UITextAlignmentCenter;
        myInfo.textColor = [UIColor redColor];
        myInfo.numberOfLines = 3;
        
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
