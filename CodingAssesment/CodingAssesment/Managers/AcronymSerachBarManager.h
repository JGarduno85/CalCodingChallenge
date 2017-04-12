//
//  AcronymSerachBarManager.h
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface AcronymSerachBarManager : NSObject <UISearchBarDelegate>


+ (instancetype)sharedInstance;
-(BOOL)validateSearchBarInputText:(NSString*)text;

@end
