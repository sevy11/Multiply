//
//  ViewController.m
//  Multiply
//
//  Created by Michael Sevy on 3/9/15.
//  Copyright (c) 2015 Michael Sevy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;


@property int inputNumber;
@property int inputMultiplier;
@property int result;


@property UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(IBAction)slider:(UISlider *)sender {
    self.slider = (UISlider *)sender;
    NSString *sliderText = [NSString stringWithFormat:@"%.0f", self.slider.value];
    self.multiplierLabel.text = sliderText;
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 10;
}

#pragma mark- Calculate Button Method
- (IBAction)onCalculateButtonPressed:(UIButton *)calcButton {
    self.inputNumber = [self.numberTextField.text intValue];
    self.inputMultiplier = [self.multiplierLabel.text intValue];


#pragma mark Segment choose
    //Calculator Math and choosing which segmented control to use * or /
    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        self.result = self.inputNumber * self.inputMultiplier;
    } else if (self.operatorSegmentControl.selectedSegmentIndex ==1) {
        self.result = self.inputMultiplier / self.inputNumber;
    }

#pragma mark formats int to String for display
    NSString *resultText = [@(self.result) stringValue];
    self.answerLabel.text = resultText;
    //log return string
    NSLog(@"%@", resultText);

#pragma mark Conditional Formats for Result 

    if (self.result >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else  {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    //Fizz Buzz Logic
    if (self.result %3 == 0 && self.result %5 ==0) {
        self.answerLabel.text = @"Fizz Buzz";
    } else if (self.result %5 == 0){
        self.answerLabel.text = @"Buzz";
    } else if (self.result %3 == 0) {
        self.answerLabel.text = @"Fizz";
    }
    //getting the keyboard to dissapear after pressing calculate button
    [self.numberTextField resignFirstResponder];
}




@end
