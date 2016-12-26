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
    static private let descriptions = [
        Int(errSecUnimplemented): "The function or operation is not implemented",
        Int(errSecParam): "One or more parameters passed to a function were not valid",
        Int(errSecAllocate): "Failed to allocate memory",
        Int(errSecNotAvailable): "No keychain is available",
        Int(errSecDuplicateItem): "An item with the same primary key attributes already exists",
        Int(errSecItemNotFound): "The item cannot be found",
        Int(errSecInteractionNotAllowed): "Interaction with the Security Server is not allowed",
        Int(errSecDecode): "Unable to decode the provided data",
        /* errSecMissingEntitlement */ -34018: "Internal error when a required entitlement isn't present. Keychain entitlement required"
    ]
    
    /// The error code.
    public let code: Int
    
    /// The description.
    public var description: String {
        return KeychainError.descriptions[code] ?? "Unknown error (\(code))"
    }
}
