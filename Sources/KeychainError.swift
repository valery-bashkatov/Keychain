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
        errSecUnimplemented: "The function or operation is not implemented",
        errSecParam: "One or more parameters passed to a function were not valid",
        errSecAllocate: "Failed to allocate memory",
        errSecNotAvailable: "No keychain is available",
        errSecDuplicateItem: "An item with the same primary key attributes already exists",
        errSecItemNotFound: "The item cannot be found",
        errSecInteractionNotAllowed: "Interaction with the Security Server is not allowed",
        errSecDecode: "Unable to decode the provided data",
        /*errSecMissingEntitlement*/ -34018: "Internal error when a required entitlement isn't present. Keychain entitlement required"
    ]
    
    /// The error code.
    public let code: OSStatus
    
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
    init(code: OSStatus) {
        self.code = code
    }
}
