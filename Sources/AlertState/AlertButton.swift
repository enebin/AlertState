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
/// Above iOS 15, it's impossible to use `Alert.Button` so returns SwiftUI's `Button` instead.`
/// You can use  `toSystemButton`  and  `toSwiftUIButton` to return button for each purpose.
/// They're located in AlertButton + Extension.swift
public struct AlertButton {
    public let label: String
    public let role: AlertButtonRole
    public let action: () -> Void
    
    public init(_ label: String,
                role: AlertButtonRole = .default,
                action: @escaping () -> Void = {}) {
        self.label = label
        self.role = role
        self.action = action
    }
}
