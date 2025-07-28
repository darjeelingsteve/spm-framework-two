//
//  RandomNumberLogger.swift
//  FrameworkTwo
//
//  Created by Stephen Anthony on 28/07/2025.
//

import Foundation
import FrameworkOne

/// Logs random numbers.
public final class RandomNumberLogger {
    
    public init() {}
    
    /// Requests that the receiver log a random number.
    public func logRandomNumber() {
        print(RandomNumberGenerator().generateRandomNumber())
    }
}
