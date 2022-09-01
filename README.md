# AlertState
Manage `Alert`s in one place! 

## Overview

<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->

## Features
- Super easy to use
- You only need 2 lines to show alert in `View`s.  No needs for extra variables anymore!
- Abstract your alert windows with `enum`. It helps you managing the alert windows with more organized way.

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
