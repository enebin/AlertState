//
//  ShowAlert.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/29.
//

import SwiftUI

@available(iOS, deprecated: 15.0)
struct ShowSimpleAlertView<V, AlertT>: View where V: View, AlertT: SimpleAlertType & Identifiable {
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
