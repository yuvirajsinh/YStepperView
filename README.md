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
In ViewController.m file

To open YCameraViewController
```objc
YCameraViewController *camController = [[YCameraViewController alloc] initWithNibName:@"YCameraViewController" bundle:nil];
camController.delegate=self;
[self presentViewController:camController animated:YES completion:^{
    // completion code
}];
```
Using YCameraViewControllerDelegate
```objc
-(void)didFinishPickingImage:(UIImage *)image{
    // Use image as per your need
}
-(void)yCameraControllerdidSkipped{
    // Called when user clicks on Skip button on YCameraViewController view
}
-(void)yCameraControllerDidCancel{
    // Called when user clicks on "X" button to close YCameraViewController
}
```
