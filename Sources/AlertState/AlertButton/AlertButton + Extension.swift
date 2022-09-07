//
//  AlertButton + Extension.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/31.
//

import SwiftUI

extension AlertButton {
    var toSystemAlertButton: Alert.Button {
        let systemAlertButton: Alert.Button
        
        switch self.role {
        case .`default`:
            systemAlertButton = .default(Text(self.label), action: self.action)
        case .cancel:
            systemAlertButton = .cancel(Text(self.label), action: self.action)
        case .destructive:
            systemAlertButton = .destructive(Text(self.label), action: self.action)
        }
        
        return systemAlertButton
    }
    
    @available(iOS 15.0, *)
    var toSwiftUIButton: Button<Text> {
        let swiftUIButton: Button<Text>
        
        switch self.role {
        case .`default`:
            swiftUIButton = Button(action: self.action) {
                Text(self.label)
            }
        case .cancel:
            swiftUIButton = Button(role: .cancel, action: self.action) {
                Text(self.label)
            }
        case .destructive:
            swiftUIButton = Button(role: .destructive, action: self.action) {
                Text(self.label)
            }
        }
        
        return swiftUIButton
    }
}
