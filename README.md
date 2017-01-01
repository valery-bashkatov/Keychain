# Keychain
`Keychain` provides simple mechanism (like working with `NSUserDefaults`) for interactions with the keychain storage.

## Requirements
- iOS 9.0+
- Swift 3.0+

## Installation
### Carthage
To integrate `Keychain` into your project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```
github "valery-bashkatov/Keychain" ~> 2.0.0
```

And then follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos) to install the framework.

## Documentation
API Reference is located at [http://valery-bashkatov.github.io/Keychain](http://valery-bashkatov.github.io/Keychain).

## Usage
```swift
import Keychain

try! Keychain.setValue("Jack", forKey: "name")
try! Keychain.setValue([3735565, 2454548, 964533], forKey: "phoneNumbers")
        
let name = try! Keychain.getValue(forKey: "name") as! String
let phoneNumbers = try! Keychain.getValue(forKey: "phoneNumbers") as! [Int]
```