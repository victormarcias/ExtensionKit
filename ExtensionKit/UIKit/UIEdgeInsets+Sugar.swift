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
}
