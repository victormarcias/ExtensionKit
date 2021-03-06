//
//  UIView+Frame.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-07.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

extension UIView {
    
    // - Motivation: Code gets hard to read exponentially with the increase in number of views
    // involved in adding/substracting sizes/positions operations, so these might help make it cleaner.
    
    ///
    /// Shortcut to X position (relative to its parent)
    ///
    var x: CGFloat {
        set { frame.origin.x = newValue }
        get { return frame.origin.x }
    }
    
    ///
    /// Shortcut to the Y position (relative to its parent)
    ///
    var y: CGFloat {
        set { frame.origin.y = newValue }
        get { return frame.origin.y }
    }
    
    ///
    /// Position tuple setter/getter
    ///
    var position: (x: CGFloat, y: CGFloat) {
        set { frame.origin = CGPoint(x: newValue.x, y: newValue.y) }
        get { return (frame.origin.x, frame.origin.y) }
    }
    
    ///
    /// Shortcut to the width of the view
    ///
    var width: CGFloat {
        set { frame.size.width = newValue }
        get { return frame.size.width }
    }
    
    ///
    /// Shortcut to the height of the view
    ///
    var height: CGFloat {
        set { frame.size.height = newValue }
        get { return frame.size.height }
    }
    
    ///
    /// Size tuple setter/getter
    ///
    var size: (w: CGFloat, h: CGFloat) {
        set { frame.size = CGSize(width: newValue.w, height: newValue.h) }
        get { return (frame.size.width, frame.size.height) }
    }
    
    ///
    /// Shortcut to the horizontal center of the view (relative to its parent)
    ///
    var centerX: CGFloat {
        set { center = CGPoint(x: newValue, y: center.y) }
        get { return center.x }
    }
    
    ///
    /// Shortcut to the vertical center of the view (relative to its parent)
    ///
    var centerY: CGFloat {
        set { center = CGPoint(x: center.x, y: newValue) }
        get { return center.y }
    }
    
    ///
    /// Center tuple setter/getter
    ///
    var centerXY: (x: CGFloat, y: CGFloat) {
        set { center = CGPoint(x: newValue.x, y: newValue.y) }
        get { return (center.x, center.y) }
    }
    
    ///
    /// Centers this View on the specified another View
    ///
    func center(on view: UIView) {
        self.center = CGPoint(x: round(view.width/2), y: round(view.height/2))
    }
}
