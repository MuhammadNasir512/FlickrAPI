import UIKit

final class BasicAlert: NSObject {
    
    private let title: String
    private let message: String
    
    private override init() {
        title = ""
        message = ""
        super.init()
    }
    
    init(withTitle title: String, withMessage message: String) {
        self.title = title
        self.message = message
        super.init()
    }
    
    func showAlertIn(_ viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
        })
        alertController.addAction(defaultAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
