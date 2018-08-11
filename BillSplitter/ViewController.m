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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.splitAmountLabel.text = @"$0";
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

@end
