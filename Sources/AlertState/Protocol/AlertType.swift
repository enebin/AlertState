//
//  AlertType.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/29.
//

import SwiftUI

/// A protocol for the legacy alert.
///
/// Just pass an array of `AlertButton` to add buttons to your alert window.
/// It displays at most 2 buttons. If you want to show more than 2 buttons, adopt `MultiButtonAlertType`
/// Empty button array will show a default OK button.
public protocol AlertType: BaseAlertType & Identifiable {}

extension AlertType {
//    /// `AlertButton` to native `Alert.Button` converter
    var alertView: Alert {
        // The case both buttons are given
        if let primaryButton = self.alertButtons.first,
           let secondaryButton = self.alertButtons.second {
            // The case both buttons are given
            return Alert(
                title: Text(self.title),
                message: self.message == nil ? nil : Text(self.message!),
                primaryButton: primaryButton.toSystemAlertButton,
                secondaryButton: secondaryButton.toSystemAlertButton
            )
        } else if let primaryButton = self.self.alertButtons.first {
            // The case only `primaryButton` is given
            return Alert(
                title: Text(self.title),
                message: self.message == nil ? nil : Text(self.message!),
                dismissButton: primaryButton.toSystemAlertButton
            )
        } else {
            // Neither of the buttons is given
            return Alert(
                title: Text(self.title),
                message: self.message == nil ? nil : Text(self.message!)
            )
        }
    }
}
