//
//  ContentView.swift
//  ExampleAlertProject
//
//  Created by YoungBin Lee on 2022/09/08.
//

import SwiftUI
import AlertState

struct ContentView: View {
//  @State var alertState: SystemAlert?
//  or...
    @AlertState<SystemAlert> var alertState
    @State var showSheet = false
    
    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                alertState = .warning
            }) {
                Text("Warning")
            }

            Button(action: {
                alertState = .errorHappend(error: URLError(.unknown), dismissAction: { print("Some error happened!") })
            }) {
                Text("Error")
            }

            Button(action: {
                alertState = .retry(
                    primaryAction: { print("User canceled") },
                    secondaryAction: { self.showSheet = true })
            }) {
                Text("Retry")
            }
        }
        .showAlert(with: $alertState)
        .sheet(isPresented: $showSheet) {
            Text("How to retry?")
            Text("this and that...")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
