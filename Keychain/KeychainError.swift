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
public enum KeychainError: Int, ErrorType, CustomStringConvertible {
    
    /// Function or operation not implemented.
    case unimplementedFunction = -4
    
    /// One or more parameters passed to the function were not valid.
    case invalidParameter = -50
    
    /// Failed to allocate memory.
    case memoryAllocationFailed = -108
    
    /// No keychain is available.
    case keychainUnavailable = -25291
    
    /// The item already exists.
    case duplicateKey = -25299
    
    /// The item cannot be found.
    case keyNotFound = -25300
    
    /// Interaction with the Security Server is not allowed.
    case interactionNotAllowed = -25308
    
    /// Unable to decode the provided data.
    case dataDecodeError = -26275
    
    /// Authorization/Authentication failed.
    case authFailed = -25293
    
    /// Text description of the error.
    public var description: String {
        let text: String
        
        switch self.rawValue {
        case -4: text = "Function or operation not implemented"
        case -50: text = "One or more parameters passed to the function were not valid"
        case -108: text = "Failed to allocate memory"
        case -25291: text = "No keychain is available"
        case -25299: text = "The item already exists"
        case -25300: text = "The item cannot be found"
        case -25308: text = "Interaction with the Security Server is not allowed"
        case -26275: text = "Unable to decode the provided data"
        case -25293: text = "Authorization/Authentication failed"
        default: text = "Unknown error"
        }
        
        return "KeychainError (\(self.rawValue)): \(text)."
    }
}
