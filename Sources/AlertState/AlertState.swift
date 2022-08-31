import SwiftUI

@available(iOS 13, *)
@propertyWrapper
public struct AlertState<T>: DynamicProperty where T: AlertType {
    /// Type of alert
    @State private var alertType: T? = .none
    
    public var wrappedValue: T? {
        get {
            return alertType
        }
        
        nonmutating set {
            alertType = newValue
        }
    }
    
    public var projectedValue: Binding<T?> {
        return $alertType
    }
    
    private func setAlert(to type: T?) {
        alertType = type
    }
    
    public init(alertType: T? = nil) {
        self.alertType = alertType
    }
}

extension View {
    /// Adds a alert to the view.
    ///
    /// - Parameter with alertState:
    ///     A binding that holds the current value of any `AlertType`.
    ///     For more information about the possible positions see `BottomSheetPosition`.
    public func showAlert<T>(with alertState: Binding<T?>) -> some View where T: AlertType & Identifiable {
        if #available(iOS 15.0, *) {
            return ShowNewAlertView(content: self, alertType: alertState)
        } else {
            return ShowAlertView(content: self, alertType: alertState)
        }
    }
    
    public func showAlert<T>(with alertState: Binding<T?>) -> some View where T: AlertType & Equatable {
        if #available(iOS 15.0, *) {
            return ShowNewAlertView(content: self, alertType: alertState)
        } else {
            return ShowAlertView(content: self, alertType: alertState)
        }
    }
}
