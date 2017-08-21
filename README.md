

[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/cocoapods/p/DeepLinkSDK.svg?style=flat)](https://developer.apple.com/ios)

<h1 align="center">NotificationTokenCenter</h1>

Overview
-------------
NotificationTokenCenter Notification Token Helper in Swift ver. 3.x<br/>

##Introduction

__Requires Swift 3 or later<br/>

##Installation

Add the files to your project manually by dragging the UserDefaultsCompressor directory into your Xcode project.


##Usage


```swift

// AddObserver (register)
NotificationTokenCenter.default.addObserver(for: self, name: ViewControllerNotification) { (wrapper: NotificationWrapper<Int>) in
	let object = wrapper.object ?? 0
	print(object)
}

// RemoveObserver (unregister)
NotificationTokenCenter.default.removeObserver(for: self)

```

<br>

The MIT License (MIT)

Copyright (c) 2016 Choi Joongkwan. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
