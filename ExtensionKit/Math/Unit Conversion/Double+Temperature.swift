//
//  Double+Temperature.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-21.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

///
/// Note: from iOS 10+ Measurement structure can be used
/// https://developer.apple.com/documentation/foundation/measurement
///
/// Written using Google's Unit Converter formulas:
/// https://www.google.com/search?q=unit+converter
///

struct EKTemperature {
    
    enum UnitType {
        case celsius, farenheit, kelvin
    }
    
    enum UnitValue {
        case celsiusValue(_ value: Double)
        case farenheitValue(_ value: Double)
        case kelvinValue(_ value: Double)
        
        /// Converts this temperature to another
        ///
        /// - Parameters:
        ///     - target: the resulting value's temperature unit
        /// - Returns: the original Double value converted to another temperature's Double value
        ///
        func to(_ target: EKTemperature.UnitType) -> Double {
            switch self {
            case .celsiusValue(let value):
                switch target {
                case .celsius:      return value
                case .farenheit:    return value * 9/5 + 32
                case .kelvin:       return value + 273.15
                }
                
            case .farenheitValue(let value):
                switch target {
                case .celsius:      return (value - 32) * 5/9
                case .kelvin:       return (value - 32) * 5/9 + 273.15
                case .farenheit:    return value
                }
                
            case .kelvinValue(let value):
                switch target {
                case .celsius:      return value - 273.15
                case .farenheit:    return (value - 273.15) * 9/5 + 32
                case .kelvin:       return value
                }
            }
        }
    }
}

extension Double {
    
    /// This value in form of an operable temperature unit.
    ///     Usage: {Double}.degrees(.UnitType).to(.UnitType) -> Double
    ///
    /// - Parameters:
    ///     - unit: Temperature UnitType representing this Double value
    /// - Returns: the value in UnitValue (temperature) type
    ///
    func degrees(_ unit: EKTemperature.UnitType) -> EKTemperature.UnitValue {
        switch unit {
        case .celsius:      return .celsiusValue(self)
        case .farenheit:    return .farenheitValue(self)
        case .kelvin:       return .kelvinValue(self)
        }
    }
}
