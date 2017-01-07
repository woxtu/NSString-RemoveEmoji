# NSString+RemoveEmoji

[![CocoaPods](https://img.shields.io/cocoapods/v/NSString+RemoveEmoji.svg?style=flat-square)](https://cocoapods.org/pods/NSString+RemoveEmoji)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
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

### CocoaPods

```
pod 'NSString+RemoveEmoji', '~> 1.0'
```

### Carthage

```
github "woxtu/NSString-RemoveEmoji" ~> 1.0
```

### Swift Package Manager

```
.Package(url: "https://github.com/woxtu/NSString-RemoveEmoji.git", majorVersion: 1)
```

## License

Copyright (c) 2014 woxtu

Licensed under the MIT license.
