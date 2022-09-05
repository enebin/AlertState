//
//  AlertType.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/29.
//

import SwiftUI

/// This protocol only has text attributes for alert window.
///
/// You can adopt it unless you want to any display the buttons
/// but it recommended to use other inherited protocols to safe use of the package.
public protocol AlertType {
    var title: String { get }
    
    var message: String? { get }
}


/// It adopts `Identifiable` for iOS 13's nil - non nil changing
/// Under iOS 15, `Alert` shows only 2 buttons at most, even you pass more than 2 buttons.
@available(iOS, deprecated: 15.0)
public protocol SimpleAlertType: AlertType {
    var primaryButton: AlertButton? { get }
    
    var secondaryButton: AlertButton? { get }
}


/// `Equatable` for iOS 15 for `onChange`
@available(iOS 15.0, *)
public protocol NewAlertType: AlertType {
    /// `AlertButton`
    ///
    /// Add buttons as many as you want.
    /// Pass an empty array to show default `OK` button.
    var alertButtons: [AlertButton] { get }
}
