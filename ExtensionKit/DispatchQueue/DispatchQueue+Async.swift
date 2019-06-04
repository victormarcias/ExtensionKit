//
//  DispatchQueue+Async.swift
//  ExtensionKit
//
//  Created by Victor Marcias on 2019-06-04.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

/// async function
/// will execute a block in background asynchronusly
///
/// - Parameters:
///     - qos: the QoS at which the block should be executed.
///             Defaults to `DispatchQoS.background`.
///     - block: closure to execute on background.
///
@available(iOS 8.0, *)
public func async(_ qos: DispatchQoS.QoSClass = .background, _ block: @escaping () -> Void) {
    DispatchQueue.global(qos: qos).async {
        block()
    }
}
