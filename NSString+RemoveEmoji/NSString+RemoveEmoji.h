#import <Foundation/Foundation.h>

@interface NSString (RemoveEmoji)

- (BOOL)containsEmoji;

- (BOOL)isIncludingEmoji __attribute__((deprecated));

- (instancetype)stringByRemovingEmoji;

@end
