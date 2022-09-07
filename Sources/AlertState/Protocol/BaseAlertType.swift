//
//  File.swift
//  
//
//  Created by 이영빈 on 2022/09/08.
//

import Foundation

/// A base protocol for alert window.
public protocol BaseAlertType {
    var title: String { get }
    
    var message: String? { get }
    
    var alertButtons: [AlertButton] { get }
}
