//
//  UICollectionView+Reusable.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-03-07.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    ///
    /// Registers a class for cell reuse with its class name as reuse identifier.
    ///
    func registerReusableCell(_ cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    ///
    /// Registers a class for header reuse with its class name as reuse identifier.
    ///
    func registerReusableHeader(_ viewClass: AnyClass) {
        register(viewClass,
                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                 withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    ///
    /// Registers a class for footer reuse with its class name as reuse identifier.
    ///
    func registerReusableFooter(_ viewClass: AnyClass) {
        register(viewClass,
                 forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
                 withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    ///
    /// Returns a reusable instance of the UICollectionViewCell class specified as parameter directly.
    /// - usage: let cell = collectionView.dequeueReusableCell(CellClass.self, for: indexPath)
    ///
    func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let className = NSStringFromClass(T.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T else {
            fatalError("Unable to dequeueReusableCell of class \(className)")
        }
        return cell
    }

    ///
    /// Returns a reusable instance of the Header class specified as parameter directly.
    /// - usage: let header = collectionView.dequeueReusableHeader(HeaderClass.self, for: indexPath)
    ///
    func dequeueReusableHeader<T: UICollectionReusableView>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let className = NSStringFromClass(T.self)
        guard let header = self.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: className, for: indexPath) as? T else {
            fatalError("Unable to dequeueReusableHeader of class \(className)")
        }
        return header
    }
    
    ///
    /// Returns a reusable instance of the Footer class specified as parameter directly.
    /// - usage: let footer = collectionView.dequeueReusableFooter(FooterClass.self, for: indexPath)
    ///
    func dequeueReusableFooter<T: UICollectionReusableView>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let className = NSStringFromClass(T.self)
        guard let header = self.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: className, for: indexPath) as? T else {
            fatalError("Unable to dequeueReusableFooter of class \(className)")
        }
        return header
    }
}
