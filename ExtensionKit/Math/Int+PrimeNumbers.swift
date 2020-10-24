//
//  Int+PrimeNumbers.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2020-10-23.
//  Copyright © 2020 Victor Marcias. All rights reserved.
//

import Foundation

extension Int {
    
    /// Returns a list of prime numbers within a given range
    ///
    /// - Returns: an array with the prime numbers list
    static func primeNumbers(in range: ClosedRange<Int>) -> [Int] {
        let primes = Array(range)
            .filter { $0 > 1 }                  // filter negatives, zero, one
            .filter { $0 % 2 != 0 || $0 == 2 }  // filter even numbers
            .filter { $0 % 3 != 0 || $0 == 3 }  // filter multiples of 3
            .filter { $0 % 5 != 0 || $0 == 5 }  // filter multiples of 5
            .filter { $0 % 7 != 0 || $0 == 7 }  // filter multiples of 7
        
        return primes
    }
}
