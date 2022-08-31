//
//  AlertButtonRole.swift
//  AlertState
//
//  Created by 이영빈 on 2022/08/31.
//

import SwiftUI

/// Alert button's roles for internal use
///
/// It can be converted to `SwiftUI`'s native struct `ButtonRole`
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
