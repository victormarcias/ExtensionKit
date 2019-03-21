//
//  Double+Temperature_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2019-03-21.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class Double_Temperature_Tests: XCTestCase {
    
    func testTemperatureConversion() {
        let testValue = 30.0
        
        XCTAssertEqual(testValue.degrees(.celsius).to(.farenheit), 86.0)
        XCTAssertEqual(testValue.degrees(.celsius).to(.kelvin), 303.15)
        XCTAssertEqual(testValue.degrees(.celsius).to(.celsius), testValue)
        
        XCTAssertEqual(testValue.degrees(.farenheit).to(.celsius), -1.1111111111111112)
        XCTAssertEqual(testValue.degrees(.farenheit).to(.kelvin), 272.0388888888889)
        XCTAssertEqual(testValue.degrees(.farenheit).to(.farenheit), testValue)

        XCTAssertEqual(testValue.degrees(.kelvin).to(.celsius), -243.14999999999998)
        XCTAssertEqual(testValue.degrees(.kelvin).to(.farenheit), -405.66999999999996)
        XCTAssertEqual(testValue.degrees(.kelvin).to(.kelvin), testValue)
        
        let absoluteZero = 0.0.degrees(.kelvin)
        XCTAssertEqual(absoluteZero.to(.kelvin), 0.0)
        XCTAssertEqual(absoluteZero.to(.celsius), -273.15)
        XCTAssertEqual(absoluteZero.to(.farenheit), -459.66999999999996)
    }
}
