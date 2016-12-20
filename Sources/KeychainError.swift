//
//  KeychainError.swift
//  Keychain
//
//  Created by Valery Bashkatov on 07.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import Foundation

/**
 The `KeychainError` is an enum that represents `Keychain`'s errors.
 */
public enum KeychainError: Int, Error, CustomStringConvertible {
    
    /// Function or operation not implemented.
    case unimplementedFunction = -4
    
    /// One or more parameters passed to the function were not valid.
    case invalidParameter = -50
    
    /// Failed to allocate memory.
    case memoryAllocationFailed = -108
    
    /// No keychain is available.
    case keychainUnavailable = -25291
    
    /// Authorization/Authentication failed.
    case authFailed = -25293
    
    /// The item already exists.
    case duplicateKey = -25299
    
    /// The item cannot be found.
    case keyNotFound = -25300
    
    /// Interaction with the Security Server is not allowed.
    case interactionNotAllowed = -25308
    
    /// Unable to decode the provided data.
    case dataDecodeError = -26275
    
    /// Internal error when a required entitlement isn't present. Keychain entitlement required.
    case missingEntitlement = -34018
    
    /// Unknown error.
    case unknown = 0
    
    /// Text description of the error.
    public var description: String {
        let text: String
        
        switch self {
        case .unimplementedFunction: text = "Function or operation not implemented"
        case .invalidParameter: text = "One or more parameters passed to the function were not valid"
        case .memoryAllocationFailed: text = "Failed to allocate memory"
        case .keychainUnavailable: text = "No keychain is available"
        case .duplicateKey: text = "The item already exists"
        case .keyNotFound: text = "The item cannot be found"
        case .interactionNotAllowed: text = "Interaction with the Security Server is not allowed"
        case .dataDecodeError: text = "Unable to decode the provided data"
        case .authFailed: text = "Authorization/Authentication failed"
        case .missingEntitlement: text = "Internal error when a required entitlement isn't present. Keychain entitlement required"
        case .unknown: text = "Unknown error"
        }
        
        return "KeychainError (\(self.rawValue)): \(text)."
    }
}
