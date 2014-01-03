//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UIView *colorView;
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indi;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;

- (IBAction)onColorSliderChanged:(id)sender;

@end

@implementation ViewController
- (IBAction)powerOnOff:(id)sender {
	BOOL isOn = ((UISwitch *)sender).on;
	
	_redSlider.enabled = isOn;
	_greenSlider.enabled = isOn;
	_blueSlider.enabled = isOn;
	
	if(isOn){
		[_indi startAnimating];
		
		[self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
		
	} else {
		_colorView.backgroundColor = [UIColor grayColor];
		_indi.hidesWhenStopped = YES;
	}
}

- (IBAction)onColorSliderChanged:(id)sender {
	if([_indi isAnimating]) {
		[_indi stopAnimating];
	}
	_colorView.backgroundColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1.0];
}

- (void)viewWillAppear:(BOOL)animated {
	[self onColorSliderChanged:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
