//
//  Int+Time.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-07.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

extension Int {
    
    /// Tuple with time format assuming this Int value is in seconds
    ///
    /// - Returns: the Int value as tuple in format of (hh:mm:ss)
    var timeFormatted: (hours: Int, minutes: Int, seconds: Int) {
        return (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
    
    /// Tuple with time format including days assuming this Int value is in seconds
    ///
    /// - Returns: the Int value as tuple in format of (dd:hh:mm:ss)
    var daysAndTimeFormatted: (days: Int, hours: Int, minutes: Int, seconds: Int) {
        return (self / 86400, (self % 86400) / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
}
