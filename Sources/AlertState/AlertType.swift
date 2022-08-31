//
//  AlertType.swift
//  AlertState
//
//  Created by 이영빈 on 2022/08/29.
//

import SwiftUI

/// It adopts `Identifiable` for iOS 13's nil - non nil changing
/// `Equatable` for iOS 15 for `onChange`
public protocol AlertType: Identifiable, Equatable {
    var title: String { get }
    
    var message: String? { get }
    
    /// `AlertButton`
    ///
    /// Pass an empty array to show default button.
    /// Under iOS 15, `Alert` shows only 2 buttons at most, even you pass more than 2 buttons.
    var alertButtons: [AlertButton] { get }
}
