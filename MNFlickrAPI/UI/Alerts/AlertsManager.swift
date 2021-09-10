import UIKit

final class AlertsManager: NSObject {
    
    class func showErrorAlert(withMessage message: String, inViewController viewController: ListViewController) {
        let alert = BasicAlert(withTitle: "Error", withMessage: message)
        alert.showAlertIn(viewController)
    }
}
