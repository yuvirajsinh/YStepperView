YStepperView
===========

Custom Stepper View

YStepperView is custom Stepper View. It is similar to the native Stepper view in iOS but allow user to see the current value of YStepperView.

Required Framework
==================

QuartzCore.framework


How to Use it
=============

Import "YStepperView.h" in your ViewController.h file where you want to use this.
```objc
#import "YStepperView.h"
```

To create YStepperView
```objc
YStepperView *yStepper = [[YStepperView alloc] initWithFrame:CGRectMake(10.0, 10.0, 120.0, 25.0)];
[myView addSubview:yStepper];
```
Configure YStepperView

Set YStepperView Color
```
[yStepper setStepperColor:[UIColor redColor] withDisableColor:nil];
```
Set YStepperView Text Label
```
[yStepper setTextColor:[UIColor blackColor]];
[yStepper setTextLabelFont:[UIFont systemFontOfSize:15.0f]];
```

Set YStepperView Value Range
```
[yStepper setStepperRange:2 andMaxValue:5];
```

Set YStepperView Initial Value
```
[yStepper setValue:6];
```

Get YStepperView Current Value
```
[yStepper getValue];
```
