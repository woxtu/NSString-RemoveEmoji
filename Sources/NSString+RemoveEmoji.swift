//
//  NSString+RemoveEmoji.swift
//  NSString+RemoveEmoji
//
//  Created by woxtu on 2017/01/07.
//  Copyright (c) 2017 woxtu. All rights reserved.
//

import Foundation

public extension NSString {
    public func containsEmoji() -> Bool {
        return self.rangeOfCharacter(from: EmojiCharacterSet).location != NSNotFound
    }
    
    @objc(stringByRemovingEmoji)
    public func removingEmoji() -> NSString {
        let buffer = NSMutableString(capacity: self.length)
        self.enumerateSubstrings(in: NSMakeRange(0, self.length), options: .byComposedCharacterSequences) { substring, _, _, _ in
            if let substring = substring, !substring.containsEmoji() {
                buffer.append(substring)
            }
        }
        return buffer
    }
}
