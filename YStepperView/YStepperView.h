//
//  YStepperView.h
//  YStepperDemo
//
//  Created by yuvraj on 21/08/14.
//  Copyright (c) 2014 yuvrajsinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YStepperView : UIView{
    CGFloat cornerRadious;
    NSInteger value;
    NSInteger minRange;
    NSInteger maxRange;
    UIColor *stepperColor, *stepperDisableColor;
}

#pragma mark - Stepper Configration methods
- (void)setStepperColor:(UIColor *)color withDisableColor:(UIColor *)disColor;
- (void)setTextLabelFont:(UIFont *)font;
- (void)setTextColor:(UIColor *)color;
- (void)setStepperRange:(int)minValue andMaxValue:(int)maxValue;
- (void)setValue:(int)defValue;
- (NSInteger)getValue;

@end
