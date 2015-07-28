#import <Foundation/Foundation.h>

@interface NSString (RemoveEmoji)

- (BOOL)isIncludingEmoji;

- (instancetype)removedEmojiString;

@end
