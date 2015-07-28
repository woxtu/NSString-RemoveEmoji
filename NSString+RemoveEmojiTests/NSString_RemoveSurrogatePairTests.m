//
//  NSString_RemoveSurrogatePairTests.m
//  NSString+RemoveEmoji
//
//  Created by Mark Rogers on 7/28/15.
//  Copyright (c) 2015 woxtu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+RemoveSurrogatePair.h"

@interface NSString_RemoveSurrogatePairTests : XCTestCase

@end

@implementation NSString_RemoveSurrogatePairTests

- (void)testHasSurrogate {
	XCTAssertFalse([@"Business Professional ☺️" isIncludingSurrogatePair]);
	XCTAssert([@"🌍" isIncludingSurrogatePair]);
	XCTAssert([@"🌍Business Professional ☺️" isIncludingSurrogatePair]);
}

- (void)testRemovedSurrogateString {
	XCTAssert([[@"Business Professional ☺️" removedSurrogatePairString] isEqualToString:@"Business Professional ☺️"]);
	XCTAssert([[@"🌍" removedSurrogatePairString] isEqualToString:@""]);
	XCTAssert([[@"🌍Business Professional ☺️" removedSurrogatePairString] isEqualToString:@"Business Professional ☺️"]);
}

- (void)testFirstNonSurrogatePairEmojiIsNotSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U00002100"]; // ℀
	XCTAssertFalse([unicodeString isIncludingSurrogatePair]);
	XCTAssertFalse([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
}

- (void)testLastNonSurrogatePairEmojiIsNotSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U000027BF"]; // ➿
	XCTAssertFalse([unicodeString isIncludingSurrogatePair]);
	XCTAssertFalse([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
}

- (void)testLastNonSurrogateCharacterIsNotSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U0000D7FF"]; // ퟿
	XCTAssertFalse([unicodeString isIncludingSurrogatePair]);
	XCTAssertFalse([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
}

- (void)testFirstSurrogatePairUnicodeCharacterIsSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U0000E000"]; // 
	XCTAssert([unicodeString isIncludingSurrogatePair]);
	XCTAssert([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
}

- (void)testFirstThreeByteUnicodeCharacterIsSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U00010000"]; // 𐀀
	NSLog(@"\n\nUnicode: %@\n\n",unicodeString);
	XCTAssert([unicodeString isIncludingSurrogatePair]);
	XCTAssert([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
}

- (void)testLowestUnicodeValueEmojiIsSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U0001F004"]; // 🀄️
	XCTAssert([unicodeString isIncludingSurrogatePair]);
	XCTAssert([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
}

@end
