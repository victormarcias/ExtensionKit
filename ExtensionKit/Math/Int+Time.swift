//
//  Int+Time.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-07.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

extension Int {
    
    //
    // Returns a clock formatted tuple assuming this Int value is in seconds
    //
    var clock: (hours: Int, minutes: Int, seconds: Int) {
        return (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
    
    //
    // Returns days and time elapsed tuple assuming this Int value is in seconds
    //
    var daysClock: (days: Int, hours: Int, minutes: Int, seconds: Int) {
        return (self / 86400, (self % 86400) / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
}
