//
//  SystemAlert + Extension.swift
//  ExampleAlertProject
//
//  Created by YoungBin Lee on 2022/09/08.
//

import AlertState

extension SystemAlert: AlertType {
    var title: String {
        switch self {
        case .warning:
            return "Warning!"
        case .errorHappend:
            return "Serious error"
        case .retry:
            return "Retry?"
        }
    }
    
    var message: String? {
        switch self {
        case .warning:
            return "A minor error has happend!"
        case .errorHappend(let error, _):
            return error.localizedDescription
        case .retry:
            return nil
        }
    }
    
    var alertButtons: [AlertButton] {
        switch self {
        case .warning:
            return []
        case .errorHappend(_, let dismissAction):
            return [
                AlertButton("OK", action: dismissAction)
            ]
        case .retry(let primaryAction, let secondaryAction):
            return [
                AlertButton("Close", role: .cancel, action: primaryAction),
                AlertButton("retry", action: secondaryAction)
            ]
        }
    }
}

extension SystemAlert: Identifiable {
    var id: String {
        return title
    }
}
