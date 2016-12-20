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
    
    let key = "key"
    
    override func setUp() {
        super.setUp()
        
        try! Keychain.setValue(nil, forKey: key)
    }
    
    func testInt() {
        let expectedValue = 1
        var value: Int?
        
        do {
            try Keychain.setValue(expectedValue, forKey: key)
        } catch {
            XCTFail("setValue failed: \(error)")
        }
        
        do {
            value = try Keychain.getValue(forKey: key) as? Int
        } catch {
            XCTFail("getValue failed: \(error)")
        }
        
        XCTAssertNotNil(value)
        XCTAssertEqual(value, expectedValue)
    }
    
    func testString() {
        let expectedValue = "Jack"
        var value: String?
        
        do {
            try Keychain.setValue(expectedValue, forKey: key)
        } catch {
            XCTFail("setValue failed: \(error)")
        }
        
        do {
            value = try Keychain.getValue(forKey: key) as? String
        } catch {
            XCTFail("getValue failed: \(error)")
        }
        
        XCTAssertNotNil(value)
        XCTAssertEqual(value, expectedValue)
    }
    
    func testBool() {
        let expectedValue = true
        var value: Bool?
        
        do {
            try Keychain.setValue(expectedValue, forKey: key)
        } catch {
            XCTFail("setValue failed: \(error)")
        }
        
        do {
            value = try Keychain.getValue(forKey: key) as? Bool
        } catch {
            XCTFail("getValue failed: \(error)")
        }
        
        XCTAssertNotNil(value)
        XCTAssertEqual(value, expectedValue)
    }
    
    func testArray() {
        let expectedValue = [3735565, 2454548, 964533]
        var value: [Int]?
        
        do {
            try Keychain.setValue(expectedValue, forKey: key)
        } catch {
            XCTFail("setValue failed: \(error)")
        }
        
        do {
            value = try Keychain.getValue(forKey: key) as? [Int]
        } catch {
            XCTFail("getValue failed: \(error)")
        }
        
        XCTAssertNotNil(value)
        XCTAssertEqual(value!, expectedValue)
    }
    
    func testDictionary() {
        let expectedValue = ["firstName": "John", "lastName": "Wick"]
        var value: [String: String]?
        
        do {
            try Keychain.setValue(expectedValue, forKey: key)
        } catch {
            XCTFail("setValue failed: \(error)")
        }
        
        do {
            value = try Keychain.getValue(forKey: key) as? [String: String]
        } catch {
            XCTFail("getValue failed: \(error)")
        }
        
        XCTAssertNotNil(value)
        XCTAssertEqual(value!, expectedValue)
    }
}
