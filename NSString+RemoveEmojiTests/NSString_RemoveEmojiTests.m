#import <XCTest/XCTest.h>

#import "NSString+RemoveEmoji.h"

@interface NSString_RemoveEmojiTests : XCTestCase

@end

@implementation NSString_RemoveEmojiTests

- (void)testHasEmoji {
	XCTAssertFalse([@"Party Hard" isIncludingEmoji]);
	XCTAssert([@"✨" isIncludingEmoji]);
	XCTAssert([@"✨Party✨ ✨Hard✨" isIncludingEmoji]);
}

- (void)testRemovedEmojiString {
	XCTAssert([[@"Party Hard" removedEmojiString] isEqualToString:@"Party Hard"]);
	XCTAssert([[@"✨" removedEmojiString] isEqualToString:@""]);
	XCTAssert([[@"✨Party✨ ✨Hard✨" removedEmojiString] isEqualToString:@"Party Hard"]);
}

- (void)testHasSurrogate {
	XCTAssertFalse([@"Business Professional ☺️" isIncludingSurrogatePair]);
	XCTAssert([@"🌍" isIncludingSurrogatePair]);
	XCTAssert([@"Business🌍 Professional ☺️" isIncludingSurrogatePair]);
}

- (void)testRemovedSurrogateString {
	XCTAssert([[@"Business Professional ☺️" removedSurrogatePairString] isEqualToString:@"Business Professional ☺️"]);
	XCTAssert([[@"🌍" removedSurrogatePairString] isEqualToString:@""]);
	XCTAssert([[@"Business🌍 Professional ☺️" removedSurrogatePairString] isEqualToString:@"Business Professional ☺️"]);
}

@end
