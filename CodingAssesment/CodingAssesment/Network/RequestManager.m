//
//  RequestManager.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "RequestManager.h"
#import "APIClient.h"
#import "MBProgressHUD.h"

@implementation RequestManager


+(instancetype)sharedInstance{
    static dispatch_once_t once;
    static RequestManager *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void)makeRequest:(NSString*)text dataDictionary:(NSDictionary*)data{
    __weak typeof(self) weakSelf = self;
    if(self.progressReferenceView != nil){
        [MBProgressHUD showHUDAddedTo:self.progressReferenceView animated:YES];
    }
    [[APIClient sharedInstance] makeRequest:text dataDictionary:data andSuccess:^(id response){
        if (weakSelf.delegate != nil){
            NSArray* results = ((NSArray*)response).firstObject;
            NSArray* acronymsArray = [results valueForKey:@"lfs"];
            if(weakSelf.progressReferenceView != nil){
                [MBProgressHUD hideHUDForView:weakSelf.progressReferenceView animated:YES];
            }
            [weakSelf.delegate searchCompletedWithSuccess:acronymsArray];
        }
    }andFail:^(NSError* error){
        if(weakSelf.progressReferenceView != nil){
            [MBProgressHUD hideHUDForView:weakSelf.progressReferenceView animated:YES];
        }
        [weakSelf.delegate searchFail:error];
    }];
}

@end
