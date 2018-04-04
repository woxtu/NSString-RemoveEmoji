//
//  NSString+RemoveEmoji.swift
//  NSString+RemoveEmoji
//
//  Created by woxtu on 2017/01/07.
//  Copyright (c) 2017 woxtu. All rights reserved.
//

import Foundation

private extension UInt32 {
    static let combiningEnclosingKeycap: UInt32 = 0x20E3
    static let validationSelector15: UInt32 = 0xFE0E
    static let validationSelector16: UInt32 = 0xFE0F
}

public extension NSString {
    @objc
    public func containsEmoji() -> Bool {
        let codepoints = (self as String).unicodeScalars.map { $0.value }
        
        if let first = codepoints.first, let last = codepoints.last {
            let isKeycapEmoji = last == .combiningEnclosingKeycap && codepoints.contains(.validationSelector16)
            let isEmoji = CodePointSet.contains(first) && last != .validationSelector15
            
            return isKeycapEmoji || isEmoji
        } else {
            return false
        }
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
