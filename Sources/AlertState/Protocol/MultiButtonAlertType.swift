//
//  File.swift
//  
//
//  Created by 이영빈 on 2022/09/08.
//

import SwiftUI

///// A protocol for the new alert introduced in iOS 15.
///
/// Just pass an array of `AlertButton` to add buttons to your alert window.
/// It can show more than 2 buttons while observing Apple's alert policy.
/// Empty button array will show a default OK button.
@available(iOS 15.0, *)
public protocol MultiButtonAlertType: BaseAlertType & Equatable {}

@available(iOS 15.0, *)
extension MultiButtonAlertType {
    /// `AlertButton` to native `Button<Text>` converter
    ///
    /// It requires `dismissAction` mainly used  for resetting the view's alert state to `nil`.
    @ViewBuilder func alertContent(dismissAction: @escaping () -> Void) -> some View {
        if self.alertButtons.isEmpty {
            // Neither of the buttons is given
            Button("OK", action: { dismissAction() })
        } else {
            Group {
                ForEach(self.alertButtons.indices, id: \.self) { index in
                    let button = alertButtons[index]
                    Button(button.label, role: button.role.toSystemRole, action: {
                        button.action()
                        dismissAction()
                    })
                }
                
                let destructiveButtonExist = self.alertButtons.contains{ $0.role == .destructive }
                let cancelButtonExist = self.alertButtons.contains{ $0.role == .cancel }
                
                // If the list of buttons has more than one destructive button,
                // add custom cancel button holding `dismissAction`
                if destructiveButtonExist && !cancelButtonExist {
                    Button("Cancel", role: .cancel, action: { dismissAction() })
                }
            }
        }
    }
}
