//
//  KeychainError.swift
//  Keychain
//
//  Created by Valery Bashkatov on 07.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import Foundation

/**
 The `KeychainError` represents `Keychain`'s errors.
 */
public struct KeychainError: Error, CustomStringConvertible {
    
    // MARK: - Properties
    
    /// The error codes descriptions.
    private static let descriptions = [
        -4: "The function or operation is not implemented",
        -50: "One or more parameters passed to a function were not valid",
        -108: "Failed to allocate memory",
        -25291: "No keychain is available",
        -25299: "An item with the same primary key attributes already exists",
        -25300: "The item cannot be found",
        -25308: "Interaction with the Security Server is not allowed",
        -26275: "Unable to decode the provided data",
        -34018: "Internal error when a required entitlement isn't present. Keychain entitlement required"
    ]
    
    /// The error code.
    public let code: Int
    
    /// The description.
    public var description: String {
        return KeychainError.descriptions[code] ?? "Unknown error (\(code))"
    }
    
    // MARK: - Initialization
    
    /**
     Initializes `KeychainError` instance.
     
     - parameter code: A system code of an error.
     
     - returns: An `KeychainError`.
     */
    init(code: Int) {
        self.code = code
    }
}
