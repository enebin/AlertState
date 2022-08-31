//
//  AlertButton + Extension.swift
//  AlertState
//
//  Created by 이영빈 on 2022/08/31.
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
        case .detructive:
            systemAlertButton = .destructive(Text(self.label), action: self.action)
        }
        
        return systemAlertButton
    }
    
    @available(iOS 15.0, *)
    var toSwiftUIButton: Button<Text> {
        let button: Button<Text>
        
        switch self.role {
        case .`default`:
            button = Button(action: self.action) {
                Text(self.label)
            }
        case .cancel:
            button = Button(role: .cancel, action: self.action) {
                Text(self.label)
            }
        case .detructive:
            button = Button(role: .destructive, action: self.action) {
                Text(self.label)
            }
        }
        
        return button
    }
}
