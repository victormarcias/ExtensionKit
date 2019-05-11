//
//  Double+Mass_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2019-04-08.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class Double_Mass_Tests: XCTestCase {
    
    func testImperialToImperialConversion() {
        let testValue = 100.0
        
        XCTAssertEqual(testValue.pounds.to(.ounces), 1600.0)
        XCTAssertEqual(testValue.pounds.to(.pounds), testValue)
        XCTAssertEqual(testValue.pounds.to(.stones), 7.142857142857143)
        XCTAssertEqual(testValue.pounds.to(.tons), 0.044642857142857144)
        XCTAssertEqual(testValue.pounds.to(.UStons), 0.05)
    }
    
    func testImperialToMetricConversion() {
        let testValue = 100.0
        
        XCTAssertEqual(testValue.pounds.to(.miligrams), 45359236.800000004)
        XCTAssertEqual(testValue.pounds.to(.grams), 45359.236800000006)
        XCTAssertEqual(testValue.pounds.to(.kilograms), 45.359236800000005)
        XCTAssertEqual(testValue.pounds.to(.tonnes), 0.04535923680000001)
    }
    
    func testMetricToMetricConversion() {
        let testValue = 100.0
        
        XCTAssertEqual(testValue.kilograms.to(.miligrams), testValue * 1_000_000)
        XCTAssertEqual(testValue.kilograms.to(.grams), testValue * 1000)
        XCTAssertEqual(testValue.kilograms.to(.kilograms), testValue)
        XCTAssertEqual(testValue.kilograms.to(.tonnes), testValue / 1000)
    }
    
    func testMetricToImperialConversion() {
        let testValue = 100.0
        
        XCTAssertEqual(testValue.kilograms.to(.ounces), 3527.3962109999998)
        XCTAssertEqual(testValue.kilograms.to(.stones), 15.747304513392857)
        XCTAssertEqual(testValue.kilograms.to(.pounds), 220.46226318749999)
        XCTAssertEqual(testValue.kilograms.to(.tons), 0.09842065320870536)
        XCTAssertEqual(testValue.kilograms.to(.UStons), 0.11023113159374999)
    }
    
    func testMorgan() {
        let tsValue = 1.0
        let morgansValue = 3000.0
        
        XCTAssert(morgansValue.pounds.to(.pounds) > tsValue.UStons.to(.pounds))
        XCTAssert(morgansValue > tsValue.UStons.to(.pounds))
    }
}
