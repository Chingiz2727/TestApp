import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private lazy var coordinator = makeCoordinator()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow.init(frame: UIScreen.main.bounds)
    coordinator.start()
    window?.makeKeyAndVisible()
    // Override point for customization after application launch.
    return true
  }
}

