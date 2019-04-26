//
//  UIEdgeInsets+Sugar_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2019-04-26.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class UIEdgeInsets_Sugar_Tests: XCTestCase {
    
    func testEdgeInsetsHelpers() {
        let sut = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        XCTAssertEqual(sut.horizontal, 20)
        XCTAssertEqual(sut.vertical, 20)
        XCTAssertEqual(UIEdgeInsets(inset: 10), sut)
    }
    
    func testEdgeInsetsOperations() {
        let sut = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        XCTAssertEqual(sut * 2, UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30))
        XCTAssertEqual(sut / 5, UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 3))
        XCTAssertEqual(sut + 10, UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25))
        XCTAssertEqual(sut - 10, UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
        
        let other = UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 3)
        XCTAssertEqual(sut + other, UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18))
        XCTAssertEqual(sut - other, UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
    }
}
