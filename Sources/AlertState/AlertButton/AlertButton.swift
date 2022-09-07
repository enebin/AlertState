//
//  AlertButton.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/31.
//

import SwiftUI

/// Generic button struct used for `SwiftUI`'s `Alert`
///
/// It's designed to cover `Alert.Button` and`Button` both in general way.
/// You can use  `toSystemButton`  and  `toSwiftUIButton` to return button for each purpose.
/// They're located in AlertButton + Extension.swift
///
/// - Warning: When a role's set, button may not appear as intened.
///     Displaying buttons is wholely decided by Apple's UI policy in SwiftUI.
///     For example, if you pass more than 2 `cancel` role buttons, alert shows only one of them.
///     For the detailed explanation, please check wiki page at `AlertState`'s github repository.
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
