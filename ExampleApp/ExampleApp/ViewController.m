//
//  ViewController.m
//  ExampleApp
//
//  Created by Sebastien on 6/2/13.
//  Copyright (c) 2013 Sebastien. All rights reserved.
//

#import "ViewController.h"
#import "IcoMoon.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIFont *icoFont = [UIFont fontWithName:@"icomoon" size:64.0f];
    [self.label1 setFont:icoFont];
    [self.label2 setFont:icoFont];
    [self.label3 setFont:icoFont];
    [self.label4 setFont:icoFont];
    [self.label5 setFont:icoFont];
    
    
    self.label1.text = [IcoMoon iconString:ICOMOON_BUBBLES];
    self.label2.text = [IcoMoon iconString:ICOMOON_TARGET];
    self.label3.text = [IcoMoon iconString:ICOMOON_SNOWY];
    self.label4.text = [IcoMoon iconString:ICOMOON_MUSIC];
    self.label5.text = [IcoMoon iconString:ICOMOON_CHART];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
