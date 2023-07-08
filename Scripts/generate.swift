#!/usr/bin/env swift

import CoreText
import Foundation

let fontPath: String
if CommandLine.arguments.count > 1 {
  fontPath = CommandLine.arguments[1]
} else {
  fontPath = "/System/Library/Fonts/Apple Color Emoji.ttc"
}

let fontURL = URL(filePath: fontPath)
let descriptors = CTFontManagerCreateFontDescriptorsFromURL(fontURL as CFURL) as! [CTFontDescriptor]
let descriptor = descriptors.first { CTFontDescriptorCopyAttribute($0, kCTFontNameAttribute) as? String == "AppleColorEmoji" }!
let font = CTFontCreateWithFontDescriptor(descriptor, 10, nil)
let characterSet = CTFontCopyCharacterSet(font)

var chars = [UTF32Char]()
for plane in 0 ..< 16 where CFCharacterSetHasMemberInPlane(characterSet, plane) {
  for char in UTF32Char(plane) << 16 ..< UTF32Char(plane + 1) << 16
    where char > 0x39 && CFCharacterSetIsLongCharacterMember(characterSet, char)
  {
    chars.append(char)
  }
}

print("""
//
//  CodePointSet.swift
//  NSString+RemoveEmoji
//
//  Created by woxtu on 2018/01/11.
//  Copyright (c) 2018 woxtu. All rights reserved.
//

import Foundation

let CodePointSet = Set<UInt32>([
\(chars.map { String(format: "    0x%05X,", $0) }.joined(separator: "\n"))
])
""")
