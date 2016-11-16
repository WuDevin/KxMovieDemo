//
//  ViewController.m
//  KxMovieDemo
//
//  Created by DevinWu on 16/10/21.
//  Copyright © 2016年 蓝鸽. All rights reserved.
//

#import "ViewController.h"
#include "avformat.h"
#include "avcodec.h"
#import "KxMovieViewController.h"
#import "KxMovieController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(100, 100, 100, 40);
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)buttonAction:(UIButton *)sender{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@5 forKey:KxMovieParameterMinBufferedDuration];
    [parameters setValue:@20 forKey:KxMovieParameterMaxBufferedDuration];
    
    NSString *urlString = @"http://183.63.90.221:3333/Others/201608/25113244453/Content/加菲猫.flv";
    NSString *decodeStrinfg = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    KxMovieController *vc = [KxMovieController movieViewControllerWithContentPath:decodeStrinfg
                                                                       parameters:parameters];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    //    [self presentViewController:vc animated:YES completion:nil];
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
    
}

@end
