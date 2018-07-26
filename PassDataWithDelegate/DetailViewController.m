//
//  ViewController.m
//  PassDataWithDelegate
//
//  Created by Vu Ngoc Cong on 6/27/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField.text = self.name;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)saveButton:(id)sender {
    [self.delegate passData: self.nameTextField.text];
    [self.navigationController popViewControllerAnimated:true];
}

@end
