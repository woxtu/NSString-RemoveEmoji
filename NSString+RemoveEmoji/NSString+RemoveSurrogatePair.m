//
//  NSString+RemoveSurrogatePair.m
//  NSString+RemoveEmoji
//
//  Created by Mark Rogers on 7/28/15.
//  Copyright (c) 2015 woxtu. All rights reserved.
//

#import "NSString+RemoveSurrogatePair.h"

@implementation NSString (RemoveSurrogatePair)


- (BOOL)isSurrogatePair {
	const unichar high = [self characterAtIndex: 0];
	
	return (0xd800 <= high);
}

- (BOOL)isIncludingSurrogatePair {
	BOOL __block result = NO;
	
	[self enumerateSubstringsInRange:NSMakeRange(0, [self length])
							 options:NSStringEnumerationByComposedCharacterSequences
						  usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
							  if ([substring isSurrogatePair]) {
								  *stop = YES;
								  result = YES;
							  }
						  }];
	
	return result;
}

- (instancetype)removedSurrogatePairString {
	NSMutableString* __block buffer = [NSMutableString stringWithCapacity:[self length]];
	
	[self enumerateSubstringsInRange:NSMakeRange(0, [self length])
							 options:NSStringEnumerationByComposedCharacterSequences
						  usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
							  [buffer appendString:([substring isSurrogatePair])? @"": substring];
						  }];
	
	return buffer;
}

@end
