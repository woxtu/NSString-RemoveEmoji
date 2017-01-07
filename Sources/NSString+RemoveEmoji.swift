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
        return self.components(separatedBy: EmojiCharacterSet).joined() as NSString
    }
}
