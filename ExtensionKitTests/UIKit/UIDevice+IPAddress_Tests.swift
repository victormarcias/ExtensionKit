//
//  UIDevice+IPAddress_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2019-03-25.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class UIDevice_IPAddress_Tests: XCTestCase {
    
    private let validIpAddressRegex = "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$" // Example: 192.168.0.1, max: 255.255.255.255
    
    // Test the Extension
    func testDeviceIPAddress() {
        
        // Check connection and test
        checkConnectionAndTest {
            // Result
            let ipAddress = UIDevice.current.getIPAddress()
            
            // Test the result of the IP Address
            XCTAssertNotNil(ipAddress)
            
            // Check the format
            let ipRegex = ipAddress?.range(of: self.validIpAddressRegex, options: .regularExpression)
            XCTAssertNotNil(ipRegex)
        }
    }
    
    // Checks is connected to the internet first and executes the test
    func checkConnectionAndTest(timeout: Double = 10.0, _ testClosure: @escaping (() -> Void)) {
        
        // Connection expectation
        let expectation = XCTestExpectation(description: "Testing URL for connection")
        let url = URL(string: "https://google.com")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            // Test there is "internet connection"
            XCTAssertNotNil(data, "No data. Possible no internet connection.")
            
            // Test Use Case
            testClosure()
            
            // Test success
            expectation.fulfill()
        }
        
        dataTask.resume()
        wait(for: [expectation], timeout: timeout)
    }
}
