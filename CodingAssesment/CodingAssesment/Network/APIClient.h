//
//  APIClient.h
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface APIClient : NSObject

+ (instancetype)sharedInstance;
-(void)makeRequest:(NSString*)endPoint dataDictionary:(NSDictionary*)data andSuccess:(void(^)(id))successBlock andFail:(void(^)(NSError*))failBlock;

@end
