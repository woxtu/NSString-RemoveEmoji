# NSString+RemoveEmoji

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg?style=flat-square)](https://github.com/apple/swift-package-manager)

A category on NSString that extends for detecting and removing Emoji.

```objectivec
BOOL containsEmoji = [@"✨Party✨ ✨Hard✨" containsEmoji];
NSString* stringByRemovingEmoji = [@"✨Party✨ ✨Hard✨" stringByRemovingEmoji];
```

```swift
let containsEmoji = "✨Party✨ ✨Hard✨".containsEmoji()
let stringByRemovingEmoji = "✨Party✨ ✨Hard✨".removingEmoji()
```

## Installation

### Swift Package Manager

```
.package(url: "https://github.com/woxtu/NSString-RemoveEmoji.git", from: "1.0.0")
```

## License

Licensed under the MIT license.
