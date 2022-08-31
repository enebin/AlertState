# ``AlertState``

Abstract your `Alert`s and manage them in one place. 

## Overview

<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->

## Features
- Super easy to use

## How to install
### Swift Package Manager


## Usage
```
import SwiftUI
import AlertState

enum AlertTypes {
    case errorAlert
    case curogo
}

extension AlertTypes: Identifiable {
    var id: Self { self }
}

extension AlertTypes: AlertType {
    var alertButtons: [AlertButton] {
        return [
            AlertButton("label", action: { print("wow") }),
            AlertButton("label", action: {})
        ]
    }
    
    var title: String {
        return "Test"
    }
    
    var message: String? {
        return "Test"
    }
}


```

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
