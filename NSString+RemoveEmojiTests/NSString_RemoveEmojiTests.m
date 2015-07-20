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
	XCTAssert([unicodeString isIncludingEmoji]);
}

- (void)testLastNonSurrogatePairEmojiIsNotSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U000027BF"]; // ➿
	XCTAssertFalse([unicodeString isIncludingSurrogatePair]);
	XCTAssertFalse([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
	XCTAssert([unicodeString isIncludingEmoji]);
}

- (void)testLastNonSurrogateCharacterIsNotSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U0000D7FF"]; // ퟿
	XCTAssertFalse([unicodeString isIncludingSurrogatePair]);
	XCTAssertFalse([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
	XCTAssertFalse([unicodeString isIncludingEmoji]);
}

- (void)testFirstSurrogatePairUnicodeCharacterIsSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U0000E000"]; // 
	XCTAssert([unicodeString isIncludingSurrogatePair]);
	XCTAssert([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
	XCTAssertFalse([unicodeString isIncludingEmoji]);
}

- (void)testFirstThreeByteUnicodeCharacterIsSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U00010000"]; // 𐀀
	NSLog(@"\n\nUnicode: %@\n\n",unicodeString);
	XCTAssert([unicodeString isIncludingSurrogatePair]);
	XCTAssert([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
	XCTAssertFalse([unicodeString isIncludingEmoji]);
}

- (void)testLowestUnicodeValueEmojiIsSurrogatePair {
	NSString* unicodeString = [NSString stringWithUTF8String:"\U0001F004"]; // 🀄️
	XCTAssert([unicodeString isIncludingSurrogatePair]);
	XCTAssert([[unicodeString removedSurrogatePairString] isEqualToString:@""]);
	XCTAssert([unicodeString isIncludingEmoji]);
}

@end
