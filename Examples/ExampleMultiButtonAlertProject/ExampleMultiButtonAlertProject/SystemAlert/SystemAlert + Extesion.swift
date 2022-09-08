//
//  SystemAlert + Extension.swift
//  ExampleAlertProject
//
//  Created by YoungBin Lee on 2022/09/08.
//

import AlertState

extension SystemAlert: MultiButtonAlertType {
    var title: String {
        switch self {
        case .warning:
            return "Warning!"
        case .errorHappend:
            return "Serious error"
        case .retry:
            return "Retry?"
        case .multipleChoices(let title, _):
            return title
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
        case .multipleChoices(_, let message):
            return message
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
        case .multipleChoices:
            return [
                AlertButton("button 1"),
                AlertButton("button 2"),
                AlertButton("button 3"),
                AlertButton("button 4")
            ]
        }
    }
}

extension SystemAlert: Equatable {
    static func == (lhs: SystemAlert, rhs: SystemAlert) -> Bool {
        return lhs.title == rhs.title
    }
}
