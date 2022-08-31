//
//  AlertButton.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/31.
//

import SwiftUI

/// Generic button struct used for `SwiftUI`'s `Alert`
///
/// It's designed to cover `Alert.Button` under iOS 15.
/// Above iOS 15, it's changed to use SwiftUI's `Button` instead.`
public struct AlertButton {
    public typealias Action = () -> Void
    
    public let label: String
    public let role: AlertButtonRole
    public let action: Action
    
    public init(_ label: String, role: AlertButtonRole = .default, action: @escaping Action = {}) {
        self.label = label
        self.role = role
        self.action = action
    }
}
