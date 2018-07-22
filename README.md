# :tea: Matcha

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/MatchaTea.svg?style=flat)](http://cocoadocs.org/docsets/MatchaTea)
[![License](https://img.shields.io/cocoapods/l/MatchaTea.svg?style=flat)](http://cocoadocs.org/docsets/MatchaTea)
[![Platform](https://img.shields.io/cocoapods/p/MatchaTea.svg?style=flat)](http://cocoadocs.org/docsets/MatchaTea)

## What's Matcha?

Matcha is Framework that can get parameters from URL Path. It does not have `Router`, so simple.

It can use like following:
```swift
let url = URL(string: "https://example.com/user/1/settings")!
let matcha = Matcha(url: url, pattern: "/user/{userID}/settings")
matcha?.value(of: "userID")     // "1"
matcha?.value(at: 0)            // "1"
```

## Requirements

- Swift 4.1

## How to Install

#### CocoaPods

Add the following to your `Podfile`:

```Ruby
pod "MatchaTea"
```

> :warning: **WARNING :** If you want to install from `CocoaPods`, must add `MatchaTea` to Podfile because there is a `Matcha` different from this `Matcha`.

#### Carthage

Add the following to your `Cartfile`:

```Ruby
github "cats-oss/Matcha"
```

## How to use Matcha

If you have already known information of URL Path, create the instance with the pattern.

```swift
let url = URL(string: "https://example.com/user/1/settings")!
let matcha = Matcha(url: url, pattern: "/user/{userID}/settings")
```

Then, can get matched values.

```swift
matcha?.value(of: "userID")     // "1"
matcha?.value(at: 0)            // "1"
matcha?["userID"]               // "1"
matcha?[0]                      // "1"
```

If you do not know any information of URL Path, match with the pattern after create the instance using the URL.

```swift
if let url = url {
    let matcher = Matcha(url: url)
    if matcher.matched("/") != nil {
        // to root
    } else if matcher.matched("/notification") != nil {
        // to notification
    } else if let id = matcher.matched("/user/{userID}")?["userID"] {
        // to user with id
    }
}
```

## LICENSE
Under the MIT license. See LICENSE file for details.
