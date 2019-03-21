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

extension Double {
    
    enum TemperatureUnit {
        case celsius, farenheit, kelvin
    }
    
    enum TemperatureConverter {
        case celsius(_ value: Double)
        case farenheit(_ value: Double)
        case kelvin(_ value: Double)
        
        /// Converts this type's value to another's unit's value
        ///
        /// - Parameters:
        ///     - conversionUnit: the resulting value's TemperatureUnit
        /// - Returns: the Double value converted to another temperature
        ///
        func to(_ conversionUnit: TemperatureUnit) -> Double {
            switch self {
            case .celsius(let value):
                switch conversionUnit {
                case .celsius:      return value
                case .farenheit:    return value * 9/5 + 32
                case .kelvin:       return value + 273.15
                }
                
            case .farenheit(let value):
                switch conversionUnit {
                case .celsius:      return (value - 32) * 5/9
                case .kelvin:       return (value - 32) * 5/9 + 273.15
                case .farenheit:    return value
                }
                
            case .kelvin(let value):
                switch conversionUnit {
                case .celsius:      return value - 273.15
                case .farenheit:    return (value - 273.15) * 9/5 + 32
                case .kelvin:       return value
                }
            }
        }
    }
    
    /// This value measured in form of a operable TemperatureUnit.
    ///     Usage: {Double}.degrees(.TemperatureUnit).to(.TemperatureUnit) -> Double
    ///
    /// - Parameters:
    ///     - unit: TemperatureUnit representing this Double value
    ///
    func degrees(_ unit: TemperatureUnit) -> TemperatureConverter {
        switch unit {
        case .celsius:      return .celsius(self)
        case .farenheit:    return .farenheit(self)
        case .kelvin:       return .kelvin(self)
        }
    }
}
