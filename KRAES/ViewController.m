//
//  ViewController.m
//  KRAES
//
//  Created by Kalvar on 2014/6/19.
//  Copyright (c) 2014年 Kalvar. All rights reserved.
//

#import "ViewController.h"
#import "KRAes.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self testSample];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testSample
{
    NSString *_content   = @"Something wanna keep secret ...";
    NSData *_encryptData = [[KRAes sharedAes] encryptAES256WithData:[_content dataUsingEncoding:NSUTF8StringEncoding] password:@"12345"];
    NSData *_decryptData = [[KRAes sharedAes] decryptAES256WithData:_encryptData password:@"12345"];
    NSString *_restoredContent = [[NSString alloc] initWithData:_decryptData encoding:NSUTF8StringEncoding];
    
    NSLog(@"_restoredContent : %@", _restoredContent);
}

@end
