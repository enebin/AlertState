//
//  File.swift
//  
//
//  Created by 이영빈 on 2022/09/07.
//

import Foundation

extension Array where Element: Any {
    var second: Element? {
        if self.count >= 2 {
            return self[1]
        } else {
            return nil
        }
    }
}
