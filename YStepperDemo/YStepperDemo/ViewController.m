//
//  ViewController.m
//  YStepperDemo
//
//  Created by yuvraj on 21/08/14.
//  Copyright (c) 2014 yuvrajsinh. All rights reserved.
//

#import "ViewController.h"
#import "YStepperView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    YStepperView *yStepper = [[YStepperView alloc] initWithFrame:CGRectMake(100.0, 100.0, 150.0, 25.0)];
    [yStepper setStepperColor:[UIColor redColor] withDisableColor:nil];
//    [yStepper setTextColor:[UIColor blackColor]];
//    [yStepper setStepperRange:2 andMaxValue:5];
//    [yStepper setValue:6];
//    [yStepper setTextLabelFont:[UIFont systemFontOfSize:15.0f]];
    
    [self.view addSubview:yStepper];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
