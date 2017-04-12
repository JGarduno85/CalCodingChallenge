//
//  Acronym.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "Acronym.h"

@implementation Acronym


-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)init:(NSString*)acronymValue{
    self  = [self init];
    if (self) {
        self.sf = acronymValue;
    }
    return self;
}

@end
