# AlertState
Manage `Alert`s in one place! 

## Overview
| Normal alert | Multi button alert |
|----------|----------|
| <img width="200" src="https://media.giphy.com/media/73Ma7S4SLQAHcmTYbE/giphy.gif"> | <img width="200" src="https://media.giphy.com/media/8Qpra2RUXNdGqqySjY/giphy.gif">|

     
## Features
### Super easy to use
- You only need 2 lines to show alert in `View`s.  No needs to write extra variables like `isPresented`!

### Manage everything in one place
- It helps you managing the alert windows with more organized way.

### 100% compatible with native features
- You can use button role(`cancel`, `default`, `destructive`) in the same way you did in SwiftUI
- It's compatible with any version of iOS.

## Requirements
- iOS 13
- Swift 5.5
- Xcode 12

## How to install
### Swift Package Manager
It only supprots SPM yet. 

1. In Xcode, open your project and navigate to File → Add Packages.
2. Copy and past the repository's URL.
```
https://github.com/enebin/AlertState
```
3. Choose a version you want and add it to your project.


## Usage
After [some setup](https://github.com/enebin/AlertState/wiki/How-to-setup), You can use `AlertState` like this:
``` Swift
import SwiftUI
import AlertState

struct ContentView: View {
//   @State var alertState: SystemAlert?
//   or...
     @AlertState<SystemAlert> var alertState

    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                alertState = .warning
            }) {
                Text("Warning")
            }

            Button(action: {
                alertState = .errorHappend(/* SomeError */, dismissAction: { /* some dismiss action */ })
            }) {
                Text("Error")
            }

            Button(action: {
                alertState = .retry(primaryAction: { /* some actions */ }, secondaryAction: { /* some actions */ })
            }) {
                Text("Retry")
            }
        }
        .showAlert(with: $alertState)
    }
}
```

## Example
For more informations, check [the example projects](https://github.com/enebin/AlertState/tree/main/Examples).
