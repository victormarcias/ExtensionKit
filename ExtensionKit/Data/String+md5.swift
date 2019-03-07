//
//  String+md5.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-07.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation
import CommonCrypto

///
/// About md5:
/// https://en.wikipedia.org/wiki/MD5
///
/// Source:
/// https://stackoverflow.com/questions/32163848/how-to-convert-string-to-md5-hash-using-ios-swift
///

extension String {
    
    ///
    /// md5 hash raw data value
    ///
    private func md5Data() -> Data {
        let messageData = self.data(using: .utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes { digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData
    }
    
    ///
    /// Returns the md5 hex value
    ///
    func md5() -> String {
        let md5Hex = md5Data().map { String(format: "%02hhx", $0) }.joined()
        return md5Hex
    }
    
    ///
    /// Returns the md5 hash value in Base64
    ///
    func md5Base64() -> String {
        let md5Base64 = md5Data().base64EncodedString()
        return md5Base64
    }
}
