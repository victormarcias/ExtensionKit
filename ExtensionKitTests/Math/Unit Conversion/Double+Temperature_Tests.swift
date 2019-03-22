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
        
        let waterBoilingPoint = 99.9839.degrees(.celsius)
        XCTAssertEqual(waterBoilingPoint.to(.kelvin), 373.1339)
        XCTAssertEqual(waterBoilingPoint.to(.farenheit), 211.97102)
        
        let roomTemperature = 25.0.degrees(.celsius)
        XCTAssertEqual(roomTemperature.to(.farenheit), 77)
        XCTAssertEqual(roomTemperature.to(.kelvin), 298.15)
        
        let sunCore = 16_000_000.0.degrees(.celsius)
        XCTAssertEqual(sunCore.to(.farenheit), 28800032)
        XCTAssertEqual(sunCore.to(.kelvin), 16000273.15)
        
        let lightning = 28_000.0.degrees(.celsius)
        XCTAssertEqual(lightning.to(.farenheit), 50432)
        XCTAssertEqual(lightning.to(.kelvin), 28273.15)
    }
}
