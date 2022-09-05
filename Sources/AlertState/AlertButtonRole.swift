//
//  AlertButtonRole.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/31.
//

import SwiftUI

/// Button's roles corresponding to system's button roles.
///
/// It can be converted to `SwiftUI`'s native struct `ButtonRole`or type `Alert.Button`.
public enum AlertButtonRole: Equatable {
    case `default`
    case detructive
    case cancel
    
    @available(iOS 15.0, *)
    var toSystemRole: ButtonRole? {
        switch self {
        case .`default`:
            return .none
        case .cancel:
            return .cancel
        case .detructive:
            return .destructive
        }
    }
}
