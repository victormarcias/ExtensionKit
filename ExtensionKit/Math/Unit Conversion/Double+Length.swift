//
//  Double+Length.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-21.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

struct EKLength {
    
    enum UnitType {
        
        enum Metric: Double {
            case milimeter = 1      // mm
            case centimeter = 10    // mm
            case meter = 1000       // mm
            case kilometer = 1_000_000  // mm
            
            init(_ unitValue: UnitValue) {
                switch unitValue {
                case .milimeter(_):     self = .milimeter
                case .centimeter(_):    self = .centimeter
                case .meter(_):         self = .meter
                case .kilometer(_):     self = .kilometer
                default: self = .milimeter
                }
            }
        }
        
        enum Imperial: Double {
            case inch = 1   // inch
            case foot = 12  // inch
            case yard = 36  // inch
            case mile = 63360.23622 // inch
            
            init(valueType: UnitValue) {
                switch valueType {
                case .inch(_):  self = .inch
                case .foot(_):  self = .foot
                case .yard(_):  self = .yard
                case .mile(_):  self = .mile
                default: self = .inch
                }
            }
        }
    }
    
    enum UnitValue {
        case milimeter(_ value: Double)
        case centimeter(_ value: Double)
        case meter(_ value: Double)
        case kilometer(_ value: Double)
        
        case inch(_ value: Double)
        case foot(_ value: Double)
        case yard(_ value: Double)
        case mile(_ value: Double)
        
        func to(_ output: UnitType.Metric) -> Double {
            switch self {
            case .milimeter(let value),
                 .centimeter(let value),
                 .meter(let value),
                 .kilometer(let value):
                let input = UnitType.Metric(self)
                return value * input.rawValue / output.rawValue
                
            case .inch(let value),
                 .foot(let value),
                 .yard(let value),
                 .mile(let value):
                let input = UnitType.Imperial(valueType: self)
                let inchesInMilimeters = 25.4
                return value * inchesInMilimeters * input.rawValue / output.rawValue
            }
        }
        
        func to(_ output: UnitType.Imperial) -> Double {
            switch self {
            case .milimeter(let value),
                 .centimeter(let value),
                 .meter(let value),
                 .kilometer(let value):
                let input = UnitType.Metric(self)
                let milimetersInInches = 0.0393700787
                return value * milimetersInInches * input.rawValue / output.rawValue
                
            case .inch(let value),
                 .foot(let value),
                 .yard(let value),
                 .mile(let value):
                let input = UnitType.Imperial(valueType: self)
                return value * input.rawValue / output.rawValue
            }
        }
    }
}

extension Double {
    
    func units(_ unit: EKLength.UnitType.Metric) -> EKLength.UnitValue {
        switch unit {
        case .milimeter:    return .milimeter(self)
        case .centimeter:   return .centimeter(self)
        case .meter:        return .meter(self)
        case .kilometer:    return .kilometer(self)
        }
    }
    
    func units(_ unit: EKLength.UnitType.Imperial) -> EKLength.UnitValue {
        switch unit {
        case .foot: return .foot(self)
        case .inch: return .inch(self)
        case .yard: return .yard(self)
        case .mile: return .mile(self)
        }
    }
}
