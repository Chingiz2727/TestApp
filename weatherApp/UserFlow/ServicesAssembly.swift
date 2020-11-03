import UIKit
import Swinject

struct ServiceAssembly: Assembly {
  func assemble(container: Container) {
    registerCommonServices(in: container)
  }
  
  func registerCommonServices(in container: Container) {
    container.register(NavigationRouter.self) { _ in
      let navController = BaseNavigationController()
      return NavigationRouterImpl(rootController: navController)
    }.inObjectScope(.transient)
  }
}
