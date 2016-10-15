//
//  KeychainTests.swift
//  KeychainTests
//
//  Created by Valery Bashkatov on 07.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import XCTest
import Keychain

class KeychainTests: XCTestCase {
    
    // Saving of simple objects
    func testValueSetting() {
        try! Keychain.setValue(1, forKey: "id")
        try! Keychain.setValue("Jack", forKey: "name")
        try! Keychain.setValue(true, forKey: "isMale")
        try! Keychain.setValue([3735565, 2454548, 964533], forKey: "phoneNumbers")
        
        let id = try! Keychain.getValue(forKey: "id") as! Int
        let name = try! Keychain.getValue(forKey: "name") as! String
        let isMale = try! Keychain.getValue(forKey: "isMale") as! Bool
        let phoneNumbers = try! Keychain.getValue(forKey: "phoneNumbers") as! [Int]
        
        XCTAssert(id == 1)
        XCTAssert(name == "Jack")
        XCTAssert(isMale == true)
        XCTAssert(phoneNumbers == [3735565, 2454548, 964533])
    }
}
