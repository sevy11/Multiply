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
    //view addSubview:slider;
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 10;
    self.slider.value = 5;
    self.slider.continuous = YES;

    self.multiplierLabel.text = [NSString stringWithFormat:@"%.0f", self.slider.value];

}
- (IBAction)onCalculateButtonPressed:(UIButton *)calcButton {
    self.inputNumber = [self.numberTextField.text intValue];//why are we using intValue? where does this come from?
    self.inputMultiplier = [self.multiplierLabel.text intValue];

    //choosing which segmented control to use * or /
    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        self.result = self.inputNumber * self.inputMultiplier;
    } else if (self.operatorSegmentControl.selectedSegmentIndex ==1) {
        self.result = self.inputMultiplier / self.inputNumber;
    }

    //turns the result value(int) into a String
    NSString *resultText = [@(self.result) stringValue];
    self.answerLabel.text = resultText;

    NSLog(@"%@", resultText);

    if (self.result >= 20) {
        self.view.backgroundColor = [UIColor greenColor];

    } else  {
        self.view.backgroundColor = [UIColor whiteColor];
    }

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


- (IBAction)slider:(UISlider *)sender {

    //self.multiplierLabel.text =

}



@end
