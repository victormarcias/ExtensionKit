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
    
    func test_first25() {
        let sut = Int.primeNumbers(in: 1...100)
        XCTAssert(sut.count == 25)
    }
}
