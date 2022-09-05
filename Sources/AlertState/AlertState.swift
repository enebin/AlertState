import SwiftUI

/// A property wrapper offers preprocessed state which can be used for `.showAlert`
@available(iOS 13, *)
@propertyWrapper public struct AlertState<T>: DynamicProperty where T: BasicAlertType {
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
