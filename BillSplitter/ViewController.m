//
//  ViewController.m
//  BillSplitter
//
//  Created by Bennett on 2018-08-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *totalAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *splitAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.splitAmountLabel.text = @"$0";
    
    NSInteger val = lround(self.numberOfPeopleSlider.value);
    self.sliderValueLabel.text = [NSString stringWithFormat:@"%ld",(long)val];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateSplitAmount:(UIButton *)sender {
    
    NSDecimalNumber *amount = [[NSDecimalNumber alloc]initWithFloat:self.totalAmountTextField.text.floatValue];
    NSDecimalNumber *numberOfPeople = [[NSDecimalNumber alloc]initWithFloat:self.numberOfPeopleSlider.value];
    
    NSDecimalNumber *splitAmount = [amount decimalNumberByDividingBy:numberOfPeople];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    self.splitAmountLabel.text = [NSString stringWithFormat:@"$%@", [numberFormatter stringFromNumber:splitAmount] ];
    
}
- (IBAction)sliderValueChanged:(UISlider *)sender {
    UISlider *slider = (UISlider *)sender;
    NSInteger integerValue = lround(slider.value);
    self.sliderValueLabel.text = [NSString stringWithFormat:@"%ld",(long)integerValue];
    
    //make sure the slider only stops at integer numnbers
    [self.numberOfPeopleSlider setValue:integerValue];
    [self calculateSplitAmount:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.totalAmountTextField) {
        [self calculateSplitAmount:nil];
    }

}

@end
