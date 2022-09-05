//
//  File.swift
//  
//
//  Created by YoungBin Lee on 2022/09/05.
//

import SwiftUI

extension View {
    /// Add alerts for the view.
    ///
    /// - Parameter with alertState:
    ///     A binding that holds the current value of any `SimpleAlertType`.
    ///     `AlertType` should conform to `Identifiable`.
    @available(iOS, deprecated: 15.0)
    public func showAlert<T>(with alertState: Binding<T?>) -> some View where T: SimpleAlertType & Identifiable {
        return ShowSimpleAlertView(content: self, alertType: alertState)
    }
    
    
    /// Add alerts for the view.
    ///
    /// - Parameter with alertState:
    ///     A binding that holds the current value of any `NewAlertType`.
    ///     `AlertType` should conform to `Equatable`.
    @available(iOS 15.0, *)
    public func showAlert<T>(with alertState: Binding<T?>) -> some View where T: NewAlertType & Equatable {
        return ShowNewAlertView(content: self, alertType: alertState)
    }
}
