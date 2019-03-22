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
    /// UnitType: each one defined by the smallest and scaled up
    ///
    enum UnitType {
        
        enum Metric: Double {
            case millimeters = 1        // mm
            case centimeters = 10       // mm
            case meters = 1000          // mm
            case kilometers = 1_000_000 // mm
        }
        
        enum Imperial: Double {
            case inches = 1     // inch
            case feet = 12      // inches
            case yards = 36     // inches
            case miles = 63360  // inches
        }
    }
    
    ///
    /// UnitValue: the object that wraps the original Double value
    ///
    enum UnitValue {
        
        enum Metric {
            case millimeter(_ value: Double)
            case centimeter(_ value: Double)
            case meter(_ value: Double)
            case kilometer(_ value: Double)
            
            ///
            /// Metric -> Metric
            ///
            func to(_ metric: UnitType.Metric) -> Double {
                switch self {
                case .millimeter(let value),
                     .centimeter(let value),
                     .meter(let value),
                     .kilometer(let value):
                    let type = self.unitType()
                    return value * type.rawValue / metric.rawValue
                }
            }
            
            ///
            /// Metric -> Imperial
            ///
            func to(_ imperial: UnitType.Imperial) -> Double {
                switch self {
                case .millimeter(let value),
                     .centimeter(let value),
                     .meter(let value),
                     .kilometer(let value):
                    let type = self.unitType()
                    let millimeterToInch = 0.0393700787 // 1 mm = 0.0393701 inches
                    return value * millimeterToInch * type.rawValue / imperial.rawValue
                }
            }
            
            ///
            /// Gets the UnitType from the UnitValue type
            ///
            private func unitType() -> UnitType.Metric {
                switch self {
                case .millimeter(_):    return .millimeters
                case .centimeter(_):    return .centimeters
                case .meter(_):         return .meters
                case .kilometer(_):     return .kilometers
                }
            }
        }
        
        enum Imperial {
            case inch(_ value: Double)
            case foot(_ value: Double)
            case yard(_ value: Double)
            case mile(_ value: Double)
            
            ///
            /// Imperial -> Imperial
            ///
            func to(_ imperial: UnitType.Imperial) -> Double {
                switch self {
                case .inch(let value),
                     .foot(let value),
                     .yard(let value),
                     .mile(let value):
                    let type = self.unitType()
                    return value * type.rawValue / imperial.rawValue
                }
            }
            
            ///
            /// Imperial -> Metric
            ///
            func to(_ metric: UnitType.Metric) -> Double {
                switch self {
                case .inch(let value),
                     .foot(let value),
                     .yard(let value),
                     .mile(let value):
                    let type = self.unitType()
                    let inchToMillimeter = 25.4 // 1 inch = 25.4 mm
                    return value * inchToMillimeter * type.rawValue / metric.rawValue
                }
            }
            
            ///
            /// Gets the UnitType from the UnitValue type
            ///
            private func unitType() -> UnitType.Imperial {
                switch self {
                case .inch(_):  return .inches
                case .foot(_):  return .feet
                case .yard(_):  return .yards
                case .mile(_):  return .miles
                }
            }
        }
        
    }
}

extension Double {
    
    // MARK: - Metric values
    
    var milimeters: EKLength.UnitValue.Metric {
        return .millimeter(self)
    }
    
    var centimeters: EKLength.UnitValue.Metric {
        return .centimeter(self)
    }
    
    var meters: EKLength.UnitValue.Metric {
        return .meter(self)
    }
    
    var kilometers: EKLength.UnitValue.Metric {
        return .kilometer(self)
    }
    
    // MARK: - Imperial values
    
    var inches: EKLength.UnitValue.Imperial {
        return .inch(self)
    }
    
    var feet: EKLength.UnitValue.Imperial {
        return .foot(self)
    }
    
    var yards: EKLength.UnitValue.Imperial {
        return .yard(self)
    }
    
    var miles: EKLength.UnitValue.Imperial {
        return .mile(self)
    }
}
