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
    }
    
    func testRemovingEmoji() {
        XCTAssertEqual("Party Hard".removingEmoji(), "Party Hard")
        XCTAssertEqual("☆Party☆ ☆Hard☆".removingEmoji(), "☆Party☆ ☆Hard☆")
        
        XCTAssertEqual("✨Party✨ ✨Hard✨".removingEmoji(), "Party Hard")
        XCTAssertEqual("🙏Party🙏 🙏Hard🙏".removingEmoji(), "Party Hard")
        XCTAssertEqual("👨‍👨‍👧‍👧Party👨‍👨‍👧‍👧 👨‍👨‍👧‍👧Hard👨‍👨‍👧‍👧".removingEmoji(), "Party Hard")
        XCTAssertEqual("🇯🇵Party🇯🇵 🇯🇵Hard🇯🇵".removingEmoji(), "Party Hard")
    }
}
