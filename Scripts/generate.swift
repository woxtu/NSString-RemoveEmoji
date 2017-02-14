#!/usr/bin/env xcrun swift

import Foundation

let resourcePath = "/System/Library/Input Methods/CharacterPalette.app/Contents/Resources/Category-Emoji.plist"

let resource = NSDictionary(contentsOfFile: resourcePath)!
let data = resource.value(forKeyPath: "EmojiDataArray.CVCategoryData.Data") as! [String]
let emojiString =
  data
  .flatMap { $0.components(separatedBy: ",") }
  .filter { $0.range(of: "\u{FE0F}\u{20E3}") == nil }
  .joined()

let filename = "EmojiCharacterSet.swift"

let content = [
  "//",
  "//  \(filename)",
  "//  NSString+RemoveEmoji",
  "//",
  "//  Created by woxtu on 2017/01/07.",
  "//  Copyright (c) 2017 woxtu. All rights reserved.",
  "//",
  "",
  "import Foundation",
  "",
  "internal let EmojiCharacterSet = CharacterSet(charactersIn: \"\(emojiString)\")"
].joined(separator: "\n")

let outputUrl = URL(fileURLWithPath: "./Sources/\(filename)")
try! content.write(to: outputUrl, atomically: true, encoding: .utf8)
