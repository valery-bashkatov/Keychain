//
//  Keychain.swift
//  Keychain
//
//  Created by Valery Bashkatov on 07.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import Foundation
import Security

/**
 The `Keychain` class makes it easy to work with items in the keychain storage.
 */
public class Keychain {
    
    // MARK: Initialization
    
    /// :nodoc:
    private init() {}
    
    // MARK: - Getting and Setting Values
    
    /**
     Sets the value of the key. Before setting, the old value is removed. So if you want to delete the key, just set its value to `nil`.
     
     - parameter value: The value for the key. Value's type must conform `NSCoding` protocol. It is implemented by all of the Foundation and most of the UIKit types.
     - parameter key: The key for which to create a record in the keychain.
     
     - throws: The `KeychainError` if something went wrong.
     */
    static public func setValue(_ value: Any?, forKey key: String) throws {
        var attributes: [String: NSObject] = [
            (kSecClass as String): kSecClassGenericPassword,
            (kSecAttrAccount as String): key as NSObject
        ]
        
        var status: OSStatus
            
        status = SecItemDelete(attributes as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError(code: Int(status))
        }
        
        // If value is nil, we need just delete the key
        guard let value = value else {
            return
        }
        
        attributes[kSecValueData as String] = NSKeyedArchiver.archivedData(withRootObject: value) as NSObject?
        
        status = SecItemAdd(attributes as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError(code: Int(status))
        }
    }
    
    /**
     Returns the value of the key or `nil`, if the key does not exist.
     
     - parameter key: The key for which to get the value.
     
     - throws: The `KeychainError` if something went wrong.
     
     - returns: The key value.
     */
    static public func getValue(forKey key: String) throws -> Any? {
        let attributes: [String: NSObject] = [
            (kSecClass as String): kSecClassGenericPassword,
            (kSecReturnData as String): true as NSObject,
            (kSecMatchLimit as String): kSecMatchLimitOne,
            (kSecAttrAccount as String): key as NSObject
        ]
        
        var result: AnyObject?
        var status: OSStatus
        
        status = SecItemCopyMatching(attributes as CFDictionary, &result)
        guard status != errSecItemNotFound else {
            return nil
        }
        
        guard status == errSecSuccess else {
            throw KeychainError(code: Int(status))
        }
        
        return NSKeyedUnarchiver.unarchiveObject(with: result as! Data) as Any?
    }
    
    /**
     Saves the `SecKey` object to the keychain. Before saving, the old value is deleted, So, if you want to delete the item, just set its value to `nil`.
     
     - parameter secKey: The `SecKey` object that will be saved.
     - parameter key: The key name for the `SecKey` item.
     
     - throws: The `KeychainError` if something's wrong.
     */
    static public func setSecKey(_ secKey: SecKey?, forKey key: String) throws {
        var attributes: [String: AnyObject] = [
            (kSecClass as String): kSecClassKey,
            (kSecAttrApplicationTag as String): key as AnyObject
        ]
        
        var status: OSStatus
        
        status = SecItemDelete(attributes as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError(code: Int(status))
        }
        
        // If secKey is nil, just delete the key
        guard let secKey = secKey else {
            return
        }
        
        attributes[kSecValueRef as String] = secKey
        
        status = SecItemAdd(attributes as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError(code: Int(status))
        }
    }
    
    /**
     Returns the `SecKey` object associated with the key or `nil`, if the key does not exist.
     
     - parameter key: The key for which to get the `SecKey`.
     
     - throws: The `KeychainError` if something's wrong.
     
     - returns: The `SecKey` object.
     */
    static public func getSecKey(forKey key: String) throws -> SecKey? {
        let attributes: [String: NSObject] = [
            (kSecClass as String): kSecClassKey,
            (kSecAttrApplicationTag as String): key as NSObject,
            (kSecReturnRef as String): true as NSObject
        ]
        
        var secKey: AnyObject?
        var status: OSStatus
            
        status = SecItemCopyMatching(attributes as CFDictionary, &secKey)
        guard status != errSecItemNotFound else {
            return nil
        }
        
        guard status == errSecSuccess else {
            throw KeychainError(code: Int(status))
        }
        
        return secKey as! SecKey?
    }
}
