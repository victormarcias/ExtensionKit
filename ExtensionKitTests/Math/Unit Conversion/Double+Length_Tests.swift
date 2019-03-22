//
//  Double+Length_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2019-03-22.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class Double_Length_Tests: XCTestCase {
    
    func testLengthConversion() {
        let testValue = 10_467.0
        XCTAssertEqual(testValue.meters.to(.kilometers), 10.467)
        XCTAssertEqual(testValue.meters.to(.millimeters), 10_467_000)
        XCTAssertEqual(testValue.meters.to(.centimeters), 1_046_700)
        XCTAssertEqual(testValue.meters.to(.meters), testValue)
        
        XCTAssertEqual(testValue.yards.to(.feet), 31401)
        XCTAssertEqual(testValue.yards.to(.inches), 376812)
        XCTAssertEqual(testValue.yards.to(.miles), 5.947159090909091)
        XCTAssertEqual(testValue.yards.to(.yards), testValue)
        
        XCTAssertEqual(testValue.inches.to(.kilometers), 0.2658618)
        XCTAssertEqual(testValue.inches.to(.millimeters), 265861.8)
        XCTAssertEqual(testValue.inches.to(.centimeters), 26586.18)
        XCTAssertEqual(testValue.inches.to(.meters), 265.8618)

        XCTAssertEqual(testValue.centimeters.to(.miles), 0.06503892262514205)
        XCTAssertEqual(testValue.centimeters.to(.yards), 114.46850382025)
        XCTAssertEqual(testValue.centimeters.to(.inches), 4120.866137529)
        XCTAssertEqual(testValue.centimeters.to(.feet), 343.40551146075)
        
        let smallTestValue = 0.00015
        XCTAssertEqual(smallTestValue.milimeters.to(.miles), 9.320567874053028e-11)
        XCTAssertEqual(smallTestValue.miles.to(.millimeters), 241.40159999999997)
        XCTAssertEqual(smallTestValue.inches.to(.meters), 3.8099999999999995e-6)
        XCTAssertEqual(smallTestValue.milimeters.to(.yards), 1.640419945833333e-7)
    }
}
