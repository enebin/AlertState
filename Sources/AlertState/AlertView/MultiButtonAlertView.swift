//
//  ShowNewAlertView.swift
//  AlertState
//
//  Created by YoungBin Lee on 2022/08/30.
//

import SwiftUI

@available(iOS 15.0, *)
struct MultiButtonAlertView<V, AlertT>: View where V: View, AlertT: MultiButtonAlertType {
    private let content: V
    @Binding private var alertType: AlertT?
    @State private var isPresented : Bool = false
    
    var body: some View {
        content
            .onChange(of: alertType) { newValue in
                if newValue != nil, isPresented == false {
                    isPresented = true
                }
            }
            .alert(alertType?.title ?? "", isPresented: $isPresented, actions: {
                if let alertType = alertType {
                    alertType.alertContent(dismissAction: { self.alertType = nil  })
                }
            }, message: {
                Text(alertType?.message ?? "")
            })
    }
    
    
    init(content: V, alertType: Binding<AlertT?>) {
        self.content = content
        self._alertType = alertType
    }
}
