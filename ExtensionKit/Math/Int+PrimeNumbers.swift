//
//  Int+PrimeNumbers.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2020-10-23.
//  Copyright © 2020 Victor Marcias. All rights reserved.
//

import Foundation

///
/// Sources:
///     - https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
///     - https://en.wikipedia.org/wiki/Sieve_of_Sundaram
///     - https://www.mathsisfun.com/prime_numbers.html
/// Solution:
///     - https://stackoverflow.com/questions/45784858/identify-prime-number
///
extension Int {
    
    /// Returns a list of prime numbers up until a given number
    ///
    /// - Returns: an array with the prime numbers list
    static func primeNumbers(in range: Int) -> [Int] {
        return primeNumbers(in: 2...range)
    }
    
    /// Returns a list of prime numbers within a given range
    ///
    /// - Returns: an array with the prime numbers list
    static func primeNumbers(in range: ClosedRange<Int>) -> [Int] {
        let valid = Array(range).filter { $0 > 1 }
        
        let result = valid.filter {
            let wheel = [2,3,5,7,11,13,17,19]
            
            // light solution
            if wheel.contains($0) {
                return true
            }
            // heavy
            let number = $0
            let upperLimit = Int(Double(number).squareRoot())
            let isPrime = !(2...upperLimit).contains { number % $0 == 0 }
            return isPrime
        }
        return result
    }
}
