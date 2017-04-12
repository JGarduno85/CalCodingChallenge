//
//  RequestManager.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "RequestManager.h"
#import "APIClient.h"

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
    [[APIClient sharedInstance] makeRequest:text dataDictionary:data andSuccess:^(id response){
        if (weakSelf.delegate != nil){
            NSArray* results = ((NSArray*)response).firstObject;
            NSArray* acronymsArray = [results valueForKey:@"lfs"];
            [weakSelf.delegate searchCompletedWithSuccess:acronymsArray];
        }
    }andFail:^(NSError* error){
        [weakSelf.delegate searchFail:error];
    }];
}

@end
