//
//  UIView+Frame.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-07.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

extension UIView {
    
    /// - Code gets hard to read really fast when you add/substract widths/heights/positions
    /// so these shortcuts might help make it cleaner.
    
    ///
    /// Returns the X position relative to its parent
    ///
    var x: CGFloat {
        return frame.origin.x
    }
    
    ///
    /// Returns the Y position relative to its parent
    ///
    var y: CGFloat {
        return frame.origin.y
    }
    
    ///
    /// Returns the width of the view
    ///
    var width: CGFloat {
        return frame.size.width
    }
    
    ///
    /// Returns the height of the view
    ///
    var height: CGFloat {
        return frame.size.height
    }
    
    ///
    /// Centers this View on the specified another View
    ///
    func center(on view: UIView) {
        self.center = CGPoint(x: round(view.width/2), y: round(view.height/2))
    }
}
