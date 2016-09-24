#import "NSString+RemoveEmoji.h"

static NSMutableCharacterSet* EmojiCharacterSet = nil;

@implementation NSString (RemoveEmoji)

+ (void)load {
    EmojiCharacterSet = [[NSMutableCharacterSet alloc] init];
    
    // U+FE00-FE0F (Variation Selectors)
    [EmojiCharacterSet addCharactersInRange:NSMakeRange(0xFE00, 0xFE0F - 0xFE00 + 1)];
    
    // U+2100-27BF
    [EmojiCharacterSet addCharactersInRange:NSMakeRange(0x2100, 0x27BF - 0x2100 + 1)];
    
    // U+1D000-1F9FF
    [EmojiCharacterSet addCharactersInRange:NSMakeRange(0x1D000, 0x1F9FF - 0x1D000 + 1)];
}

- (BOOL)isEmoji {
    return [self rangeOfCharacterFromSet:EmojiCharacterSet].location != NSNotFound;
}

- (BOOL)containsEmoji {
    BOOL __block result = NO;

    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
        if ([substring isEmoji]) {
            *stop = YES;
            result = YES;
        }
    }];

    return result;
}

- (BOOL)isIncludingEmoji {
    return [self containsEmoji];
}

- (instancetype)stringByRemovingEmoji {
    NSMutableString* __block buffer = [NSMutableString stringWithCapacity:[self length]];

    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
        [buffer appendString:([substring isEmoji])? @"": substring];
    }];

    return buffer;
}

@end
