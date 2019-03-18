//
//  UIImage+Resize.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-14.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Resize an UIImage
    ///
    /// - Parameters:
    ///   - targetSize: the target size for the image
    ///   - keepAspect: keep aspect ratio of the image by default
    ///   - transparent: if the image has transparency (non pictures, eg: icons, etc)
    /// - Returns: a new instance with the resulting image
    func resized(_ targetSize: CGSize, keepAspect: Bool = true, transparent: Bool = true) -> UIImage {
        
        // avoid redundancy, return same instance if the size is the same
        guard self.size != targetSize else { return self }
        
        // targetSize
        var newSize = targetSize
        
        // calculate aspect ratio if we want to keep it
        if keepAspect {
            let scaleX = targetSize.width / self.size.width
            let scaleY = targetSize.height / self.size.height
            let targetScale = min(scaleX, scaleY)
            // pick the smallest scale to fit the target size
            let width = self.size.width * targetScale
            let height = self.size.height * targetScale
            newSize = CGSize(width: width, height: height)
        }
        
        // render the image with the new size
        UIGraphicsBeginImageContextWithOptions(newSize, !transparent, 0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    
    ///
    /// UIImage with resized width (same aspect)
    ///
    func resized(width: CGFloat, transparent: Bool = true) -> UIImage {
        return resized(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                       keepAspect: true,
                       transparent: transparent)
    }
    
    ///
    /// UIImage with resized height (same aspect)
    ///
    func resized(height: CGFloat, transparent: Bool = true) -> UIImage {
        return resized(CGSize(width: CGFloat.greatestFiniteMagnitude, height: height),
                       keepAspect: true,
                       transparent: transparent)
    }
}
