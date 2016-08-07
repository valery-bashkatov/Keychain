# Keychain

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)]()

## Description
`Keychain` provides simple mechanism (like working with `NSUserDefaults`) for interactions with the keychain storage.

## Requirements
- iOS 8.0+
- Xcode 7.3+

## Installation
### Carthage

To integrate `Keychain` into your project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Keychain`:

```
github "valery-bashkatov/Keychain"
```
And then follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos) to install the framework.

## Usage

```swift
import Keychain

try! Keychain.setValue("Jack", forKey: "name")
try! Keychain.setValue([3735565, 2454548, 964533], forKey: "phoneNumbers")
        
let name = try! Keychain.getValue(forKey: "name") as! String
let phoneNumbers = try! Keychain.getValue(forKey: "phoneNumbers") as! [Int]
```