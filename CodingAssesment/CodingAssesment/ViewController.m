//
//  ViewController.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "ViewController.h"
#import "AcronymSerachBarManager.h"
#import "TableViewCell.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "RequestManager.h"

@interface ViewController () <RequestManagerDelegate>

@property(nonatomic,strong) TableViewDataSource* dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupAcronymSearchBar];
    [self setupTableView];
    [self setupRequestManager];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupRequestManager{
    [RequestManager sharedInstance].delegate = self;
    [RequestManager sharedInstance].progressReferenceView = self.view;
}


-(void)setupAcronymSearchBar{
    self.acronymSearchBar.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    self.acronymSearchBar.delegate = [AcronymSerachBarManager sharedInstance];
}


-(void)setupTableView{
    [self.acronymTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    self.acronymTableView.rowHeight = UITableViewAutomaticDimension;
    self.acronymTableView.estimatedRowHeight = 44;
    self.dataSource = [[TableViewDataSource alloc] init];
    self.acronymTableView.dataSource = self.dataSource;
}


-(void)searchCompletedWithSuccess:(id)response{
    NSArray* dataArray = (NSArray*)response;
    self.dataSource.data = dataArray;
    [self.acronymTableView reloadData];
}

-(void)searchFail:(NSError *)error{
    
}


@end
