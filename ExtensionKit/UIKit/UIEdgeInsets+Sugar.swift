//
//  UIEdgeInsets+Sugar.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-07.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    ///
    /// Returns the total amount of inset vertically
    ///
    var vertical: CGFloat {
        return top + bottom
    }
    
    ///
    /// Returns the total amount of inset horizontally
    ///
    var horizontal: CGFloat {
        return left + right
    }
    
    ///
    /// Initializer with the same inset on every margin
    ///
    init(inset: Double) {
        let cgInset = CGFloat(inset)
        self.init(top: cgInset, left: cgInset, bottom: cgInset, right: cgInset)
    }
    
    ///
    /// Insets multiplier
    ///
    static func *(lhs: UIEdgeInsets, rhs: Double) -> UIEdgeInsets {
        let multiplier = CGFloat(rhs)
        return UIEdgeInsets(top: lhs.top * multiplier,
                            left: lhs.left * multiplier,
                            bottom: lhs.bottom * multiplier,
                            right: lhs.right * multiplier)
    }
    
    ///
    /// Insets divider
    ///
    static func /(lhs: UIEdgeInsets, rhs: Double) -> UIEdgeInsets {
        let divider = CGFloat(rhs)
        return UIEdgeInsets(top: lhs.top / divider,
                            left: lhs.left / divider,
                            bottom: lhs.bottom / divider,
                            right: lhs.right / divider)
    }
    
    ///
    /// Insets addition
    ///
    static func +(lhs: UIEdgeInsets, rhs: Double) -> UIEdgeInsets {
        let addition = CGFloat(rhs)
        return UIEdgeInsets(top: lhs.top + addition,
                            left: lhs.left + addition,
                            bottom: lhs.bottom + addition,
                            right: lhs.right + addition)
    }
    
    ///
    /// Insets sustraction
    ///
    static func -(lhs: UIEdgeInsets, rhs: Double) -> UIEdgeInsets {
        let sustraction = CGFloat(rhs)
        return UIEdgeInsets(top: lhs.top - sustraction,
                            left: lhs.left - sustraction,
                            bottom: lhs.bottom - sustraction,
                            right: lhs.right - sustraction)
    }
    
    ///
    /// Insets + Insets
    ///
    static func +(lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top + rhs.top,
                            left: lhs.left + rhs.left,
                            bottom: lhs.bottom + rhs.bottom,
                            right: lhs.right + rhs.right)
    }
    
    ///
    /// Insets - Insets
    ///
    static func -(lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: lhs.top - rhs.top,
                            left: lhs.left - rhs.left,
                            bottom: lhs.bottom - rhs.bottom,
                            right: lhs.right - rhs.right)
    }
}
