//
//  NSString+RemoveSurrogatePair.h
//  NSString+RemoveEmoji
//
//  Created by Mark Rogers on 7/28/15.
//  Copyright (c) 2015 woxtu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RemoveSurrogatePair)

- (BOOL)isIncludingSurrogatePair;

- (instancetype)removedSurrogatePairString;

@end
