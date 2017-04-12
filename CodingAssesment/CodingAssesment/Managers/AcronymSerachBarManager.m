//
//  AcronymSerachBarManager.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import "AcronymSerachBarManager.h"
#import "APIClient.h"

@interface AcronymSerachBarManager()



@end


@implementation AcronymSerachBarManager

+(instancetype)sharedInstance{
    static dispatch_once_t once;
    static AcronymSerachBarManager *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return [self validateSearchBarInputText:text];
}


-(BOOL)validateSearchBarInputText:(NSString*)text{
    if([text rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].length != 0 || [text isEqualToString:@""] || [text isEqualToString:@"\n"])
    {
        return YES;
    }
    else {
        return NO;
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString* text = searchBar.text;
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:text,@"sf", nil];
    [[APIClient sharedInstance] makeRequest:text dataDictionary:data andSuccess:^(id response){
        NSLog(response);
    }andFail:^(NSError* error){
        NSLog(error);
    }];
}

@end
