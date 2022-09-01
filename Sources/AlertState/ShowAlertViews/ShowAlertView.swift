//
//  ShowAlert.swift
//  AlertState
//
//  Created by 이영빈 on 2022/08/29.
//

import SwiftUI

struct ShowAlertView<V, AlertT>: View where V: View, AlertT: SimpleAlertType & Identifiable {
    private let content: V
    /// Get alert type
    @Binding private var alertType: AlertT?
    
    var body: some View {
        content
            .alert(item: $alertType) { type in
                return type.alertView
            }
    }
    
    init(content: V, alertType: Binding<AlertT?>) {
        self.content = content
        self._alertType = alertType
    }
}
