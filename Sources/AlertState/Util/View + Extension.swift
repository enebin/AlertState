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
    ///     A binding that holds the current value of any `AlertType`.
    ///     `AlertType` should conform to `Identifiable`.
    public func showAlert<T: AlertType>(with alertState: Binding<T?>) -> some View {
        return AlertView(content: self, alertType: alertState)
    }


    /// Add alerts for the view.
    ///
    /// - Parameter with alertState:
    ///     A binding that holds the current value of any `MultiButtonAlertType`.
    ///     `AlertType` should conform to `Equatable`.
    @available(iOS 15.0, *)
    public func showAlert<T: MultiButtonAlertType>(with alertState: Binding<T?>) -> some View {
        return MultiButtonAlertView(content: self, alertType: alertState)
    }
}
