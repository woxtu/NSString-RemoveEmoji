//
//  NSString+RemoveEmojiTests.swift
//  NSString+RemoveEmoji
//
//  Created by woxtu on 2017/01/07.
//  Copyright (c) 2017 woxtu. All rights reserved.
//

@testable import NSString_RemoveEmoji
import XCTest

class NSString_RemoveEmojiTests: XCTestCase {
    func testContainsEmoji() {
        // text
        XCTAssertFalse("".containsEmoji())
        XCTAssertFalse("Party Hard".containsEmoji())

        // emoji character
        XCTAssert("✨".containsEmoji())

        // text presentation sequence
        XCTAssertFalse("\u{26A1}\u{FE0E}".containsEmoji()) // ⚡︎
        // emoji presentation sequence
        XCTAssert("\u{26A1}\u{FE0F}".containsEmoji()) // ⚡️

        // emoji modifier sequence
        XCTAssert("✌🏻".containsEmoji())

        // emoji flag sequence
        XCTAssert("🇯🇵".containsEmoji())

        // emoji tag sequence
        XCTAssert("🏴󠁧󠁢󠁥󠁮󠁧󠁿".containsEmoji())

        // emoji keycap sequence
        XCTAssertFalse("0︎⃣".containsEmoji())
        XCTAssert("0️⃣".containsEmoji())

        // emoji zwj sequence
        XCTAssert("👁️‍🗨️".containsEmoji())

        // iOS 10
        XCTAssert("🤣".containsEmoji())

        // iOS 11
        XCTAssert("🤩".containsEmoji())

        // iOS 12
        XCTAssert("🥳".containsEmoji())

        // iOS 13
        XCTAssert("🥱".containsEmoji())

        // iOS 14
        XCTAssert("🥸".containsEmoji())
    }

    func testRemovingEmoji() {
        // text
        XCTAssertEqual("".removingEmoji(), "")
        XCTAssertEqual("Party Hard".removingEmoji(), "Party Hard")

        // emoji character
        XCTAssertEqual("✨".removingEmoji(), "")

        // text presentation sequence
        XCTAssertEqual("\u{26A1}\u{FE0E}".removingEmoji(), "⚡︎") // ⚡︎
        // emoji presentation sequence
        XCTAssertEqual("\u{26A1}\u{FE0F}".removingEmoji(), "") // ⚡️

        // emoji modifier sequence
        XCTAssertEqual("✌🏻".removingEmoji(), "")

        // emoji flag sequence
        XCTAssertEqual("🇯🇵".removingEmoji(), "")

        // emoji tag sequence
        XCTAssertEqual("🏴󠁧󠁢󠁥󠁮󠁧󠁿".removingEmoji(), "")

        // emoji keycap sequence
        XCTAssertEqual("0︎⃣".removingEmoji(), "0︎⃣")
        XCTAssertEqual("0️⃣".removingEmoji(), "")

        // emoji zwj sequence
        XCTAssertEqual("👁️‍🗨️".removingEmoji(), "")

        // iOS 10
        XCTAssertEqual("🤣".removingEmoji(), "")

        // iOS 11
        XCTAssertEqual("🤩".removingEmoji(), "")

        // iOS 12
        XCTAssertEqual("🥳".removingEmoji(), "")

        // iOS 13
        XCTAssertEqual("🥱".removingEmoji(), "")

        // iOS 14
        XCTAssertEqual("🥸".removingEmoji(), "")
    }
}
