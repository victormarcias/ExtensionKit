//
//  Int+PrimeNumbers_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2020-10-23.
//  Copyright © 2020 Victor Marcias. All rights reserved.
//

import XCTest

class Int_PrimeNumbers_Tests: XCTestCase {
    
    /// sequence A000040 in the OEIS
    let first25 = [2, 3, 5, 7, 11,
                   13, 17, 19, 23, 29,
                   31, 37, 41, 43, 47,
                   53, 59, 61, 67, 71,
                   73, 79, 83, 89, 97]
    
    func testBasicRange() {
        let sut = Int.primeNumbers(in: 100)
        
        for (i, _) in sut.enumerated() {
            XCTAssert(sut[i] == first25[i])
        }
    }
    
    func testPrimeNumbersWheel() {
        let sut = Int.primeNumbers(in: 20)
        let expected = [2,3,5,7,11,13,17,19]
        
        for (i, _) in sut.enumerated() {
            XCTAssert(sut[i] == expected[i])
        }
    }
    
    func testPrimeNumbersCount() {
        let sut10 = Int.primeNumbers(in: 10).count
        let sut100 = Int.primeNumbers(in: 100).count
        let sut1000 = Int.primeNumbers(in: 1_000).count
        let sut10000 = Int.primeNumbers(in: 10_000).count
        let sut100000 = Int.primeNumbers(in: 100_000).count
        //let sut1000000 = Int.primeNumbers(in: 1_000_000).count
        
        XCTAssert(sut10 == 4)
        XCTAssert(sut100 == 25)
        XCTAssert(sut1000 == 168)
        XCTAssert(sut10000 == 1229)
        XCTAssert(sut100000 == 9592) // ~1 sec.
        //XCTAssert(sut1000000 == 78498) // ~30 sec.
    }
    
    func testRandomRange() {
        let sut = Int.primeNumbers(in: -2500...13)
        let expected = [2,3,5,7,11,13]
        
        for (i, _) in sut.enumerated() {
            XCTAssert(sut[i] == expected[i])
        }
    }
    
    func testInclusiveRange() {
        let sut = Int.primeNumbers(in: 11...19)
        let expected = [11,13,17,19]
        
        for (i, _) in sut.enumerated() {
            XCTAssert(sut[i] == expected[i])
        }
    }
}
