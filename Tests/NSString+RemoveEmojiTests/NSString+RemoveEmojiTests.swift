//
//  NSString+RemoveEmojiTests.swift
//  NSString+RemoveEmoji
//
//  Created by woxtu on 2017/01/07.
//  Copyright (c) 2017 woxtu. All rights reserved.
//

import XCTest
@testable import NSString_RemoveEmoji

class NSString_RemoveEmojiTests: XCTestCase {
    func testContainsEmoji() {
        XCTAssertFalse("Party Hard".containsEmoji())
        XCTAssertFalse("☆Party☆ ☆Hard☆".containsEmoji())
        
        XCTAssert("✨Party✨ ✨Hard✨".containsEmoji())
        XCTAssert("🙏Party🙏 🙏Hard🙏".containsEmoji())
        XCTAssert("👨‍👨‍👧‍👧Party👨‍👨‍👧‍👧 👨‍👨‍👧‍👧Hard👨‍👨‍👧‍👧".containsEmoji())
        XCTAssert("🇯🇵Party🇯🇵 🇯🇵Hard🇯🇵".containsEmoji())

        XCTAssertFalse("0Party0 0Hard0".containsEmoji())
        XCTAssert("0️⃣Party0️⃣ 0️⃣Hard0️⃣".containsEmoji())
    }
    
    func testRemovingEmoji() {
        XCTAssertEqual("Party Hard".removingEmoji(), "Party Hard")
        XCTAssertEqual("☆Party☆ ☆Hard☆".removingEmoji(), "☆Party☆ ☆Hard☆")

        XCTAssertEqual("✨Party✨ ✨Hard✨".removingEmoji(), "Party Hard")
        XCTAssertEqual("🙏Party🙏 🙏Hard🙏".removingEmoji(), "Party Hard")
        XCTAssertEqual("👨‍👨‍👧‍👧Party👨‍👨‍👧‍👧 👨‍👨‍👧‍👧Hard👨‍👨‍👧‍👧".removingEmoji(), "Party Hard")
        XCTAssertEqual("🇯🇵Party🇯🇵 🇯🇵Hard🇯🇵".removingEmoji(), "Party Hard")
        
        XCTAssertEqual("0Party0 0Hard0".removingEmoji(), "0Party0 0Hard0")
        XCTAssertEqual("0️⃣Party0️⃣ 0️⃣Hard0️⃣".removingEmoji(), "Party Hard")
    }
}
