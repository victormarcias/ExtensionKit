//
//  Int+Time_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2019-03-12.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class Int_Time_Tests: XCTestCase {
    
    func testIntTimeFormatExtension() {
        XCTAssertEqual(200846.timeFormatted.hours, 55)
        XCTAssertEqual(200846.timeFormatted.minutes, 47)
        XCTAssertEqual(200846.timeFormatted.seconds, 26)
        
        XCTAssertEqual(200846.daysAndTimeFormatted.days, 2)
        XCTAssertEqual(200846.daysAndTimeFormatted.hours, 7)
        XCTAssertEqual(200846.daysAndTimeFormatted.minutes, 47)
        XCTAssertEqual(200846.daysAndTimeFormatted.seconds, 26)
    }
}
