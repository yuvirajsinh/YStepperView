//
//  YStepperView.m
//  YStepperDemo
//
//  Created by yuvraj on 21/08/14.
//  Copyright (c) 2014 yuvrajsinh. All rights reserved.
//

#import "YStepperView.h"
#import <QuartzCore/QuartzCore.h>

#define BTN_SIZE CGSizeMake(35.0, 30.0)
#define BORDER_WIDTH 1.0f
#define CORNER_RADIOUS 3.0
#define IOS7_TINT_COLOR [UIColor colorWithRed:0.0 green:0.478431 blue:1.0 alpha:1.0]

@implementation YStepperView{
    UIButton *minBtn;
    UIButton *maxBtn;
    UILabel *textLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Set Initial value
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        minRange = 0;
        maxRange = 10;
        value = 0;
        cornerRadious = CORNER_RADIOUS;
        stepperColor = IOS7_TINT_COLOR;
        stepperDisableColor = [UIColor lightGrayColor];
        
        // Create Buttons to change values
        // Create Decrease value button on left side
        minBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [minBtn setBackgroundImage:[self getHighlitedImageWithColor:stepperColor] forState:UIControlStateHighlighted];
        [minBtn setTitle:@"-" forState:UIControlStateNormal];
        [minBtn setFrame:CGRectMake(0.0, 0.0, BTN_SIZE.width, frame.size.height)];
        [minBtn setContentEdgeInsets:UIEdgeInsetsMake(-2.0, 0.0, 0.0, 0.0)];
        [minBtn setTitleColor:stepperColor forState:UIControlStateNormal];
        [minBtn setTitleColor:stepperDisableColor forState:UIControlStateDisabled];
        [minBtn setEnabled:NO]; // Set it disable because minRange==defaultValue (both are=0)
        [minBtn addTarget:self action:@selector(decreaseValue:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:minBtn];
        
        // Create Increase value button on right side
        maxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [maxBtn setBackgroundImage:[self getHighlitedImageWithColor:stepperColor] forState:UIControlStateHighlighted];
        [maxBtn setTitle:@"+" forState:UIControlStateNormal];
        [maxBtn setFrame:CGRectMake(frame.size.width-BTN_SIZE.width, 0.0, BTN_SIZE.width, frame.size.height)];
        [maxBtn setContentEdgeInsets:UIEdgeInsetsMake(-2.0, 0.0, 0.0, 0.0)];
        [maxBtn setTitleColor:stepperColor forState:UIControlStateNormal];
        [maxBtn setTitleColor:stepperDisableColor forState:UIControlStateDisabled];
        [maxBtn addTarget:self action:@selector(increaseValue:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:maxBtn];
        
        // Setup TextLabel to show value
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(BTN_SIZE.width, 0.0, frame.size.width-BTN_SIZE.width*2.0, frame.size.height)];
        [textLabel setBackgroundColor:[UIColor clearColor]];
        [textLabel setTextAlignment:NSTextAlignmentCenter];
        [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f]]; //HelveticaNeue-Thin
        [textLabel setText:[NSString stringWithFormat:@"%i", value]];
        [self addSubview:textLabel];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Draw border of stepper view
    self.layer.borderColor = stepperColor.CGColor;
    self.layer.borderWidth = BORDER_WIDTH;
    self.layer.cornerRadius = cornerRadious;
    
    // Draw seperator lines to seperate buttons and text
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [stepperColor CGColor]);
    CGContextSetLineWidth(context, BORDER_WIDTH);

    // Draw first line
    CGContextMoveToPoint(context, BTN_SIZE.width, 0.0);
    CGContextAddLineToPoint(context, BTN_SIZE.width, self.frame.size.height);

    // Draw second line
    CGContextMoveToPoint(context, self.frame.size.width-BTN_SIZE.width, 0.0);
    CGContextAddLineToPoint(context, self.frame.size.width-BTN_SIZE.width, self.frame.size.height);
    CGContextDrawPath(context, kCGPathStroke);

}

#pragma mark - Private methods

- (UIImage *)getHighlitedImageWithColor:(UIColor *)color{
    return [self imageWithColor:[self getLightColor:color]];
}

- (UIColor *)getLightColor:(UIColor *)color{
    
    const CGFloat* colors = CGColorGetComponents( color.CGColor );
    UIColor *newColor = [UIColor colorWithRed:colors[0] green:colors[1] blue:colors[2] alpha:0.2];
    return newColor;
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)stepperLog:(NSString *)message{
    NSLog(@"[YStepperView] : %@", message);
}

#pragma mark - Stepper Configration methods

- (void)setStepperColor:(UIColor *)color withDisableColor:(UIColor *)disColor{
    stepperColor = (color) ? color : stepperColor;
    stepperDisableColor = (disColor) ? disColor : stepperDisableColor;
    
    [minBtn setTitleColor:stepperColor forState:UIControlStateNormal];
    [maxBtn setTitleColor:stepperColor forState:UIControlStateNormal];
    
    [minBtn setTitleColor:stepperDisableColor forState:UIControlStateDisabled];
    [maxBtn setTitleColor:stepperDisableColor forState:UIControlStateDisabled];
    
    [minBtn setBackgroundImage:[self getHighlitedImageWithColor:stepperColor] forState:UIControlStateHighlighted];
    [maxBtn setBackgroundImage:[self getHighlitedImageWithColor:stepperColor] forState:UIControlStateHighlighted];
}

- (void)setTextLabelFont:(UIFont *)font{
    if (font) [textLabel setFont:font];
}

- (void)setTextColor:(UIColor *)color{
    if (color) [textLabel setTextColor:color];
}

- (void)setStepperRange:(int)minValue andMaxValue:(int)maxValue{
    if (minValue>=maxValue){
        [self stepperLog:@"Invalud Range Value. maxValue must be greater than minValue."];
    }
    else{
        minRange = minValue;
        maxRange = maxValue;

        if (value<minRange || value>maxRange) {
            value = minRange;
            [textLabel setText:[NSString stringWithFormat:@"%i", value]];
        }
    }
}

- (void)setValue:(int)defValue{
    if (defValue<minRange || defValue>maxRange) {
        [self stepperLog:@"Invalud Value. Value must be within minRange and maxRange."];
    }
    else{
        value = defValue;
        [textLabel setText:[NSString stringWithFormat:@"%i", value]];
        
        if (value==minRange){
            [minBtn setEnabled:NO];
            [maxBtn setEnabled:YES];
        }
        else if (value==maxRange){
            [minBtn setEnabled:YES];
            [maxBtn setEnabled:NO];
        }
        else{
            [minBtn setEnabled:YES];
            [maxBtn setEnabled:YES];
        }
    }
}

- (NSInteger)getValue{
    return value;
}

#pragma mark - Vaue change handlers
- (IBAction)decreaseValue:(id)sender{
    value--;
    if (value==minRange) {
        [minBtn setEnabled:NO];
    }
    [maxBtn setEnabled:YES];
    
    [textLabel setText:[NSString stringWithFormat:@"%i", value]];
}

- (IBAction)increaseValue:(id)sender{
    value++;
    if (value==maxRange) {
        [maxBtn setEnabled:NO];
    }
    [minBtn setEnabled:YES];
    
    [textLabel setText:[NSString stringWithFormat:@"%i", value]];
}

@end
