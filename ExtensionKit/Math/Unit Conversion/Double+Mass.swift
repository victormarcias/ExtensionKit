//
//  Double+Mass.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-04-06.
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

struct EKMass {
    
    ///
    /// How it works:
    /// Basically the conversion is done at the smallest scale of each Unit.
    /// In this case miligram are converted to ounces and viceversa and scaled up or down.
    ///
    /// Example (gram -> pounds):
    ///     50 grams * 3.5274e-5(miligramsToOunces) * 1000(mg) / 16 ounces (1 pound) -> 0.11023125 pounds
    ///
    
    ///
    /// Conversion Constants
    ///
    private static let miligramToOunce = 0.00003527396211   // 1 mg = 0.00003527396211 oz
    private static let ounceToMiligram = 28349.523          // 1 oz = 28349.5 mg
    
    ///
    /// UnitType: each one defined by the smallest and scaled up
    ///
    struct UnitType {
        
        enum Metric: Double {
            case miligrams = 1          // 1 mg
            case grams = 1000           // 1 g = 1000 mg
            case kilograms = 1_000_000  // 1 kg = 1M mg
            case tonnes = 1_000_000_000 // 1 tonne = 1000 Kg = 1B mg
        }
        
        enum Imperial: Double {
            case ounces = 1     // 1 oz
            case pounds = 16    // 1 lb = 16 oz
            case stones = 224   // 1 st = 224 oz
            case UStons = 32000 // 1 t (US) = 32000 oz
            case tons = 35840   // 1 t = 35840 oz
        }
    }
    
    ///
    /// UnitValue: the object that wraps the original Double value
    ///
    struct UnitValue {
        
        enum Metric {
            case miligramValue(_ value: Double)
            case gramValue(_ value: Double)
            case kilogramValue(_ value: Double)
            case tonneValue(_ value: Double)
            
            ///
            /// Metric -> Metric
            ///
            func to(_ target: UnitType.Metric) -> Double {
                switch self {
                case .miligramValue(let value),
                     .gramValue(let value),
                     .kilogramValue(let value),
                     .tonneValue(let value):
                    let from = self.valueType()
                    return value * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Metric -> Imperial
            ///
            func to(_ target: UnitType.Imperial) -> Double {
                switch self {
                case .miligramValue(let value),
                     .gramValue(let value),
                     .kilogramValue(let value),
                     .tonneValue(let value):
                    let from = self.valueType()
                    return value * miligramToOunce * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Gets the UnitType from the UnitValue type
            ///
            private func valueType() -> UnitType.Metric {
                switch self {
                case .miligramValue(_): return .miligrams
                case .gramValue(_):     return .grams
                case .kilogramValue(_): return .kilograms
                case .tonneValue(_):    return .tonnes
                }
            }
        }
        
        enum Imperial {
            case ounceValue(_ value: Double)
            case poundValue(_ value: Double)
            case stoneValue(_ value: Double)
            case UStonValue(_ value: Double)
            case tonValue(_ value: Double)
            
            ///
            /// Imperial -> Imperial
            ///
            func to(_ target: UnitType.Imperial) -> Double {
                switch self {
                case .ounceValue(let value),
                     .poundValue(let value),
                     .stoneValue(let value),
                     .UStonValue(let value),
                     .tonValue(let value):
                    let from = self.valueType()
                    return value * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Imperial -> Metric
            ///
            func to(_ target: UnitType.Metric) -> Double {
                switch self {
                case .ounceValue(let value),
                     .poundValue(let value),
                     .stoneValue(let value),
                     .UStonValue(let value),
                     .tonValue(let value):
                    let from = self.valueType()
                    return value * ounceToMiligram * from.rawValue / target.rawValue
                }
            }
            
            ///
            /// Gets the UnitType from the UnitValue type
            ///
            private func valueType() -> UnitType.Imperial {
                switch self {
                case .ounceValue(_): return .ounces
                case .poundValue(_): return .pounds
                case .stoneValue(_): return .stones
                case .UStonValue(_): return .UStons
                case .tonValue(_):   return .tons
                }
            }
        }
    }
}
