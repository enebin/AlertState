//
//  AlertType.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/29.
//

import SwiftUI

/// Base protocol only has title attribute for alert window.
public protocol BasicAlertType {
    var title: String { get }
}

/// A protocol for the old alert which has at most 2 buttons.
///
/// If you don't pass any buttons, it will show default OK button.
@available(iOS, deprecated: 15.0)
public protocol SimpleAlertType: BasicAlertType {
    var message: String? { get }
    
    var primaryButton: AlertButton? { get }
    
    var secondaryButton: AlertButton? { get }
}

/// A protocol for the new alert introduced in iOS 15.
///
/// It can have more than 2 buttons.
/// Just pass the array of `AlertButton` to add buttons to your alert window.
/// If you don't pass any buttons, it will show default OK button.
@available(iOS 15.0, *)
public protocol NewAlertType: BasicAlertType {
    var message: String? { get }
    
    var alertButtons: [AlertButton] { get }
}
