//
//  String+Crypto_Tests.swift
//  ExtensionKitTests
//
//  Created by Victor Marcias on 2019-03-11.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class String_Crypto_Tests: XCTestCase {
    
    ///
    /// Source: https://quickhash.com/
    ///
    func testStringCryptoExtension() {
        let testString = "ExtensionKitStringCrypto"
        
        // Hex
        XCTAssertEqual(testString.hashed(.md5), "2843acc605301cec729e5e77119b6ebb")
        XCTAssertEqual(testString.hashed(.sha1), "eff679664ddf4690225b64d6bbd48198a40c3550")
        XCTAssertEqual(testString.hashed(.sha256), "0ce8e8bb95aa328969447d1623ce65605a0f5f811aa6944ed06d9d96b92f3b7a")
        XCTAssertEqual(testString.hashed(.sha384), "2c2e8d717ccea4dfdee954434b24de6e3a4c0beaeb7e73aafad08fb87b990c83ba2532a9f1aca206252a7dd9a51e8408")
        XCTAssertEqual(testString.hashed(.sha512), "3366cd8d51597709c3b47a1b4c170e23a4741b3c8ea809b9953afaca839049d003b2e3a4bbacb85318918cf9dd20348c8542f832e9ecd7e99c45b3fa0b0ad1f6")
        
        // Base64
        XCTAssertEqual(testString.hashed(.md5, output: .base64), "KEOsxgUwHOxynl53EZtuuw==")
        XCTAssertEqual(testString.hashed(.sha1, output: .base64), "7/Z5Zk3fRpAiW2TWu9SBmKQMNVA=")
        XCTAssertEqual(testString.hashed(.sha256, output: .base64), "DOjou5WqMolpRH0WI85lYFoPX4EappRO0G2dlrkvO3o=")
        XCTAssertEqual(testString.hashed(.sha384, output: .base64), "LC6NcXzOpN/e6VRDSyTebjpMC+rrfnOq+tCPuHuZDIO6JTKp8ayiBiUqfdmlHoQI")
        XCTAssertEqual(testString.hashed(.sha512, output: .base64), "M2bNjVFZdwnDtHobTBcOI6R0GzyOqAm5lTr6yoOQSdADsuOku6y4UxiRjPndIDSMhUL4Muns1+mcRbP6CwrR9g==")
    }
}
