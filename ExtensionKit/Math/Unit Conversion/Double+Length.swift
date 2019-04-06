//
//  Double+Length.swift
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

struct EKLength {
    
    ///
    /// How it works:
    /// Basically the conversion is done at the smallest scale of each Unit.
    /// In this case milimeters are converted to inches and viceversa and scaled up or down.
    ///
    /// Example (meter -> yard):
    ///     50 meters * 0.0393700787(milimetersInInches) * 1000(mm) / 36 inches (1 yard) -> 54.6807 yards
    ///
    /// Example (meter -> km):
    ///     500 meters * 1000(mm) / 1_000_000(mm) -> 0.5 Km
    ///
    
    ///
    /// Conversion Constants
    ///
    private static let millimeterToInch = 0.0393700787 // 1 mm = 0.0393701~ inches
    private static let inchToMillimeter = 25.4         // 1 inch = 25.4 mm
    
    ///
    /// UnitType: each one defined by the smallest and scaled up
    ///
    struct UnitType {
        
        enum Metric: Double {
            case millimeters = 1        // 1 mm
            case centimeters = 10       // 1 cm = 10 mm
            case meters = 1000          // 1 m  = 1000 mm
            case kilometers = 1_000_000 // 1 km = 1_000_000 mm
        }
        
        enum Imperial: Double {
            case inches = 1     // 1 inch
            case feet = 12      // 1 foot = 12 inches
            case yards = 36     // 1 yard = 36 inches
            case miles = 63360  // 1 mile = 63360 inches
        }
    }
    
    ///
    /// UnitValue: the object that wraps the original Double value
    ///
    struct UnitValue {
        
        enum Metric {
            case millimeterValue(_ value: Double)
            case centimeterValue(_ value: Double)
            case meterValue(_ value: Double)
            case kilometerValue(_ value: Double)
            
            ///
            /// Metric -> Metric
            ///
            func to(_ target: UnitType.Metric) -> Double {
                switch self {
                case .millimeterValue(let value),
                     .centimeterValue(let value),
                     .meterValue(let value),
                     .kilometerValue(let value):
                    let from = self.valueType()
                    return value * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Metric -> Imperial
            ///
            func to(_ target: UnitType.Imperial) -> Double {
                switch self {
                case .millimeterValue(let value),
                     .centimeterValue(let value),
                     .meterValue(let value),
                     .kilometerValue(let value):
                    let from = self.valueType()
                    return value * millimeterToInch * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Gets the UnitType from the UnitValue type
            ///
            private func valueType() -> UnitType.Metric {
                switch self {
                case .millimeterValue(_):   return .millimeters
                case .centimeterValue(_):   return .centimeters
                case .meterValue(_):        return .meters
                case .kilometerValue(_):    return .kilometers
                }
            }
        }
        
        enum Imperial {
            case inchValue(_ value: Double)
            case footValue(_ value: Double)
            case yardValue(_ value: Double)
            case mileValue(_ value: Double)
            
            ///
            /// Imperial -> Imperial
            ///
            func to(_ target: UnitType.Imperial) -> Double {
                switch self {
                case .inchValue(let value),
                     .footValue(let value),
                     .yardValue(let value),
                     .mileValue(let value):
                    let from = self.valueType()
                    return value * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Imperial -> Metric
            ///
            func to(_ target: UnitType.Metric) -> Double {
                switch self {
                case .inchValue(let value),
                     .footValue(let value),
                     .yardValue(let value),
                     .mileValue(let value):
                    let from = self.valueType()
                    return value * inchToMillimeter * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Gets the UnitType from the UnitValue type
            ///
            private func valueType() -> UnitType.Imperial {
                switch self {
                case .inchValue(_): return .inches
                case .footValue(_): return .feet
                case .yardValue(_): return .yards
                case .mileValue(_): return .miles
                }
            }
        }
    }
}

extension Double {
    
    // MARK: - Metric values
    
    var milimeters: EKLength.UnitValue.Metric {
        return .millimeterValue(self)
    }
    
    var centimeters: EKLength.UnitValue.Metric {
        return .centimeterValue(self)
    }
    
    var meters: EKLength.UnitValue.Metric {
        return .meterValue(self)
    }
    
    var kilometers: EKLength.UnitValue.Metric {
        return .kilometerValue(self)
    }
    
    // MARK: - Imperial values
    
    var inches: EKLength.UnitValue.Imperial {
        return .inchValue(self)
    }
    
    var feet: EKLength.UnitValue.Imperial {
        return .footValue(self)
    }
    
    var yards: EKLength.UnitValue.Imperial {
        return .yardValue(self)
    }
    
    var miles: EKLength.UnitValue.Imperial {
        return .mileValue(self)
    }
}
