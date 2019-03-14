//
//  UITableView+Reusable.swift
//  ExtensionKitDemo
//
//  Created by Victor Marcias on 2019-03-14.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

extension UITableView {
    
    ///
    /// Registers a class for cell reuse with its class name as reuse identifier.
    ///
    func registerReusableCell(_ cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    ///
    /// Registers a class for Header reuse with its class name as reuse identifier.
    ///
    func registerReusableHeader(_ viewClass: AnyClass) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    ///
    /// Registers a class for Footer reuse with its class name as reuse identifier.
    ///
    func registerReusableFooter(_ viewClass: AnyClass) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    ///
    /// Returns a reusable instance of the UITableView class specified as parameter directly.
    /// - Usage: let cell = tableView.dequeueReusableCell(CellClass.self, for: indexPath)
    ///
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let className = NSStringFromClass(T.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: className, for: indexPath) as? T else {
            fatalError("Unable to dequeueReusableCell of class \(className)")
        }
        return cell
    }
    
    ///
    /// Returns a reusable instance of the Header class specified as parameter directly.
    /// - Usage: let header = tableView.dequeueReusableHeader(HeaderClass.self)
    ///
    func dequeueReusableHeader<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T {
        let className = NSStringFromClass(T.self)
        guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: className) as? T else {
            fatalError("Unable to dequeueReusableHeader of class \(className)")
        }
        return header
    }
    
    ///
    /// Returns a reusable instance of the Footer class specified as parameter directly.
    /// - Usage: let footer = tableView.dequeueReusableFooter(FooterClass.self)
    ///
    func dequeueReusableFooter<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T {
        let className = NSStringFromClass(T.self)
        guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: className) as? T else {
            fatalError("Unable to dequeueReusableFooter of class \(className)")
        }
        return header
    }
}
