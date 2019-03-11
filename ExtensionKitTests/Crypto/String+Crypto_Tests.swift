//
//  String+Crypto_Tests.swift
//  ExtensionKitDemoTests
//
//  Created by Victor Marcias on 2019-03-11.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import XCTest

class String_Crypto_Tests: XCTestCase {

    func testStringCryptoExtension() {
        let testString = "ExtensionKitStringCrypto"
        
        XCTAssertEqual(testString.hashed(.md5), "2843acc605301cec729e5e77119b6ebb")
        XCTAssertEqual(testString.hashed(.sha1), "eff679664ddf4690225b64d6bbd48198a40c3550")
        XCTAssertEqual(testString.hashed(.sha256), "0ce8e8bb95aa328969447d1623ce65605a0f5f811aa6944ed06d9d96b92f3b7a")
        XCTAssertEqual(testString.hashed(.sha512), "3366cd8d51597709c3b47a1b4c170e23a4741b3c8ea809b9953afaca839049d003b2e3a4bbacb85318918cf9dd20348c8542f832e9ecd7e99c45b3fa0b0ad1f6")
    }
}
