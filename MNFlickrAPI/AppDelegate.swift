import UIKit

// https://www.flickr.com/services/feeds/docs/photos_public/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var module: ListModule?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainStoryboardIpad = UIStoryboard(name: "Main", bundle: nil)
        if let rootViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "list_view_controller") as? ListViewController {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            setupWindow(withRootViewController: rootViewController)
            module = ListModule(withViewController: rootViewController)
        }
        
        return true
    }

    private func setupWindow(withRootViewController viewController: UIViewController) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let navigationController = findNavigationController() {
            navigationController.setViewControllers([viewController], animated: true)
            self.window?.rootViewController = navigationController
        }
        else {
            self.window?.rootViewController = viewController
        }
        self.window?.makeKeyAndVisible()
    }
    
    private func findNavigationController() -> UINavigationController? {
        let mainStoryboardIpad = UIStoryboard(name: "Main", bundle: nil)
        if let navigationController = mainStoryboardIpad.instantiateViewController(withIdentifier: "navigation_controller") as? UINavigationController {
            return navigationController
        }
        return nil
    }
}

