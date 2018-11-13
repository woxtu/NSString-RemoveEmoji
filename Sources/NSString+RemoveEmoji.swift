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
    static let variationSelector15: UInt32 = 0xFE0E
    static let variationSelector16: UInt32 = 0xFE0F
}

public extension NSString {
    private func isEmoji() -> Bool {
        let codepoints = (self as String).unicodeScalars.map { $0.value }
        
        if let first = codepoints.first, let last = codepoints.last {
            let isKeycapEmoji = last == .combiningEnclosingKeycap && codepoints.contains(.variationSelector16)
            let isEmoji = CodePointSet.contains(first) && last != .variationSelector15
            
            return isKeycapEmoji || isEmoji
        } else {
            return false
        }
    }
    
    @objc
    public func containsEmoji() -> Bool {
        var containsEmoji = false
        enumerateSubstrings(in: NSRange(location: 0, length: length), options: .byComposedCharacterSequences) { substring, _, _, stop in
            if let substring = substring, substring.isEmoji() {
                containsEmoji = true
                stop.assign(repeating: true, count: 1)
            }
        }
        return containsEmoji
    }
    
    @objc(stringByRemovingEmoji)
    public func removingEmoji() -> NSString {
        let buffer = NSMutableString(capacity: length)
        enumerateSubstrings(in: NSRange(location: 0, length: length), options: .byComposedCharacterSequences) { substring, _, _, _ in
            if let substring = substring, !substring.isEmoji() {
                buffer.append(substring)
            }
        }
        return buffer
    }
}
