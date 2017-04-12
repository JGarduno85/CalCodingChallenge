//
//  ViewController.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "ViewController.h"
#import "AcronymSerachBarManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupAcronymSearchBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupAcronymSearchBar{
    self.acronymSearchBar.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    self.acronymSearchBar.delegate = [AcronymSerachBarManager sharedInstance];
}




@end
