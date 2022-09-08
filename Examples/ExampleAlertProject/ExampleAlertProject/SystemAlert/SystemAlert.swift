//
//  SystemAlert.swift
//  ExampleAlertProject
//
//  Created by YoungBin Lee on 2022/09/08.
//

enum SystemAlert {
    typealias Action = () -> Void
    
    case warning
    case errorHappend(error: Error, dismissAction: Action)
    case retry(primaryAction: Action, secondaryAction: Action)
}
