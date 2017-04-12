//
//  SearchBarTest.m
//  CodingAssesment
//
//  Created by jose humberto partida garduño on 4/12/17.
//  Copyright © 2017 jose humberto partida garduño. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AcronymSerachBarManager.h"


@interface SearchBarTest : XCTestCase

@end

@implementation SearchBarTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString* userInput = @" ";
    BOOL result = [[AcronymSerachBarManager sharedInstance] validateSearchBarInputText:userInput];
    XCTAssertTrue(result);

}



@end
