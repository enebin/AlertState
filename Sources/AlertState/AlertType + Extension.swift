//
//  AlertType + Extension.swift
//  AlertState
//
//  Created by 이영빈 on 2022/08/29.
//

import SwiftUI

extension SimpleAlertType {
    var alertView: Alert {
        /// The case both buttons are given
        if let primaryButton = self.primaryButton,
                  let secondaryButton = self.secondaryButton {
            /// The case both buttons are given
            return Alert(
                title: Text(self.title),
                message: self.message == nil ? nil : Text(self.message!),
                primaryButton: primaryButton.toSystemAlertButton,
                secondaryButton: secondaryButton.toSystemAlertButton
            )
        } else if let primaryButton = self.primaryButton {
            /// The case only `primaryButton` is given
            return Alert(
                title: Text(self.title),
                message: self.message == nil ? nil : Text(self.message!),
                dismissButton: primaryButton.toSystemAlertButton
            )
        } else {
            /// Neither of the buttons is given
            return Alert(
                title: Text(self.title),
                message: self.message == nil ? nil : Text(self.message!)
            )
        }
    }
}


@available(iOS 15.0, *)
extension SheetAlertType {
    @ViewBuilder func alertContent(dismissAction: @escaping () -> Void) -> some View {
        /// The case both buttons are given
        if self.alertButtons.isEmpty {
            /// Neither of the buttons is given
            EmptyView()
        } else {
            Group {
                ForEach(self.alertButtons.indices, id: \.self) { index in
                    let button = alertButtons[index]
                    Button(button.label, role: button.role.toSystemRole, action: {
                        button.action()
                        dismissAction()
                    })
                }
            }
        }
    }
}
